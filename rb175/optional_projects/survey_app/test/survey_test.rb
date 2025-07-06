ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require "fileutils" # module with tools for Files and Paths

require_relative '../survey.rb'

class SurveyTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    FileUtils.mkdir_p(path('data'))
    @mock_survey = {
      '1' => {
        question: "Test Question 1?",
        choices: ["Option A", "Option B", "Option C"]
      },
      '2' => {
        question: "Test Question 2?", 
        choices: ["Yes", "No"]
      }
    }
    File.write(File.join(path('data'), 'questions.yml'), @mock_survey.to_yaml)
  end

  def teardown
    FileUtils.rm_rf(path('data'))
  end

  def test_welcome_page
    get '/'
    assert_equal 200, last_response.status
    assert_includes last_response.body, "Welcome to the survey!"
  end

  def test_display_survey_questions
    get '/questions'
    assert_equal 200, last_response.status
    assert_includes last_response.body, 'Test Question 1?'
    assert_includes last_response.body, 'Option A'
  end

  def test_save_responses
    # post '/questions'
  end
end
