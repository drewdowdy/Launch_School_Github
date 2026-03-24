require 'simplecov'
SimpleCov.start

ENV['RACK_ENV'] = 'test'

require "minitest/autorun"
require "rack/test"
require "fileutils"
require "pg"
require "minitest/reporters"

Minitest::Reporters.use!

require_relative '../lib/survey.rb'
require_relative '../lib/database_persistence.rb'

class SurveyTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    @user_name = 'Test Cindy Crawford'
    @brand = "Ben & Jerry's"
    @eating_style = 'Waffle cone'
    @toppings = ['Sprinkles', 'Gummy bears']
    @flavor = 'Chocolate'
    @poem = 'Roses are red, violets are blue, I love ice cream!!'
  end

  def teardown
    storage = DatabasePersistence.new('survey_test')
    storage.clean_test_data
  end

  # Helper methods
  def session
    last_request.env["rack.session"]
  end

  def create_test_user
    post '/name', {user_name: @user_name}
  end

  def valid_response_params
    {
      brand: @brand,
      eating_style: @eating_style,
      flavor: @flavor,
      poem: @poem,
      toppings: @toppings
    }
  end

  def storage
    DatabasePersistence.new('survey_test')
  end

  # Route Tests
  def test_home_page_displays
    get '/'

    assert_equal 200, last_response.status 
    assert_includes last_response.body, 'Welcome to the Survey!'
  end 

  def test_home_page_displays_success_message_after_response
    create_test_user
    post '/response', valid_response_params
    follow_redirect!

    assert_equal 200, last_response.status
    assert_includes last_response.body, 'Thank you!'
    assert_includes last_response.body, 'Your response has been saved'
  end

  def test_name_submission_creates_user_and_redirects
    post '/name', {user_name: @user_name}

    assert_equal 302, last_response.status
    assert_equal 'http://example.org/questions', last_response.headers['location']
    assert session[:user_id]
    
    user = storage.get_user_from_name(@user_name)
    assert_equal @user_name, user['name']
  end

  def test_questions_page_displays_all_questions
    get '/questions'

    assert_equal 200, last_response.status
    assert_includes last_response.body, 'What is the name of your ultimate favorite ice cream brand?'
    assert_includes last_response.body, "What&#39;s your primary eating style?"
    assert_includes last_response.body, 'Which toppings are non-negotiable?'
    assert_includes last_response.body, 'Which is the best flavor of ice cream?'
    assert_includes last_response.body, 'Write a poem about your best ice cream experience:'
    assert_includes last_response.body, '🍦 Ice Cream Survey 🍦'
  end

  def test_response_submission_redirects_to_homepage
    create_test_user
    post '/response', valid_response_params

    assert_equal 302, last_response.status
    assert_equal 'http://example.org/', last_response.headers['location']
  end

  def test_response_submission_sets_success_message
    create_test_user
    post '/response', valid_response_params

    expected_message = <<~MSG
    Thank you!
    Your response has been saved and will help with our very valuable ice cream research.
    Have a wonderful rest of your day and enjoy some ice cream!
    🍦
    MSG

    assert_equal expected_message, session[:message]
  end

  def test_response_submission_stores_brand
    create_test_user
    post '/response', valid_response_params

    response = storage.get_response(@user_name)
    assert_equal @brand, response['brand']
  end

  def test_response_submission_stores_eating_style
    create_test_user
    post '/response', valid_response_params

    response = storage.get_response(@user_name)
    expected_eating_style_id = storage.get_eating_style_id(@eating_style)

    assert_equal expected_eating_style_id, response['eating_style_id']
  end

  def test_response_submission_stores_flavor
    create_test_user
    post '/response', valid_response_params

    response = storage.get_response(@user_name)
    expected_flavor_id = storage.get_flavor_id(@flavor)

    assert_equal expected_flavor_id, response['flavor_id']
  end

  def test_response_submission_stores_poem
    create_test_user
    post '/response', valid_response_params

    response = storage.get_response(@user_name)
    
    assert_equal @poem, response['poem']
  end

  def test_response_submission_stores_toppings
    create_test_user
    post '/response', valid_response_params

    toppings_response = storage.get_toppings_response(@user_name)
    db_topping_ids = toppings_response.map { |row| row['topping_id'] }
    expected_topping_ids = @toppings.map { |topping| storage.get_topping_id(topping) }

    assert_equal expected_topping_ids.sort, db_topping_ids.sort
  end

  def test_response_submission_with_single_topping
    create_test_user
    params = valid_response_params.merge(toppings: ['Sprinkles'])
    post '/response', params
    
    toppings_response = storage.get_toppings_response(@user_name)
    assert_equal 1, toppings_response.size
    
    topping_id = storage.get_topping_id('Sprinkles')
    assert_includes toppings_response.map { |row| row['topping_id'] }, topping_id
  end

  def test_response_submission_with_no_toppings_parameter
    create_test_user
    params = valid_response_params.dup
    params.delete(:toppings)

    post '/response', params

    assert_equal 302, last_response.status
  end

  # DatabasePersistence Method Tests
  def test_database_initialization
    assert storage
  end

  def test_database_schema_setup    
    connection = PG.connect(dbname: 'survey_test')

    connection.exec <<~SQL
      DROP TABLE eating_styles CASCADE;
      DROP TABLE flavors CASCADE;
      DROP TABLE responses CASCADE;
      DROP TABLE toppings CASCADE;
      DROP TABLE toppings_responses CASCADE;
      DROP TABLE users CASCADE;
    SQL

    # Check that the tables were dropped
    result = connection.exec <<~SQL
      SELECT COUNT(*) FROM information_schema.tables
      WHERE table_schema = 'public' AND table_name IN ('users', 'responses', 'toppings');
    SQL

    assert_equal '0', result[0]['count']

    # Check that schema.sql repopulated the tables
    new_storage = storage
    choco_id = new_storage.get_flavor_id('Chocolate')

    assert choco_id.to_i > 0
  end

  def test_add_user_returns_integer_id
    user_id = storage.add_user('Test User')

    assert user_id.is_a?(Integer)
    assert user_id > 0
  end

  def test_get_user_from_id
    user_id = storage.add_user('Test User')
    
    user = storage.get_user_from_id(user_id)

    assert_equal 'Test User', user['name']
    assert_equal user_id.to_s, user['id']
  end

  def test_get_user_from_name
    user_id = storage.add_user('Test User')
    user = storage.get_user_from_name('Test User')

    assert_equal 'Test User', user['name']
    assert_equal user_id.to_s, user['id']
  end

  def test_get_eating_style_id
    eating_style_id = storage.get_eating_style_id('Waffle cone')

    assert eating_style_id
    assert eating_style_id.to_i > 0
  end

  def test_get_flavor_id
    flavor_id = storage.get_flavor_id('Chocolate')

    assert flavor_id
    assert flavor_id.to_i > 0
  end

  def test_add_toppings_responses
    user_id = storage.add_user('Test User')
    response_data = {
      brand: 'Test Brand',
      eating_style: 'Waffle cone',
      flavor: 'Chocolate',
      poem: 'Test poem',
      toppings: []
    }
    storage.add_response(user_id, response_data)
    
    response = storage.get_response('Test User')
    topping_ids = ['Sprinkles', 'Gummy bears'].map { |t| storage.get_topping_id(t).to_i }
    
    storage.add_toppings_responses(response['id'], topping_ids)
    
    toppings = storage.get_toppings_response('Test User')
    assert_equal 2, toppings.size
  end

  def test_remove_newest_user
    user_id = storage.add_user('User To Delete')
    
    user = storage.get_user_from_name('User To Delete')
    assert user
    
    storage.remove_newest_user('User To Delete')
    
    user = storage.get_user_from_name('User To Delete')
    assert_nil user
  end
end