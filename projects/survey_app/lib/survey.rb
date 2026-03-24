require "bundler/setup"
require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubi"
require "pg"
require "yaml"
require "securerandom"

require_relative "database_persistence.rb"

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
  set :erb, escape_html: true
  set :views, File.join(File.dirname(__FILE__), '..', 'views')
  set :public_folder, File.join(File.dirname(__FILE__), '..', 'public')
end

configure :development do # only used in development environment
  also_reload "database_persistence.rb"
end

before do 
  db_name = ENV['RACK_ENV'] == 'test' ? 'survey_test' : 'survey'
  @storage = DatabasePersistence.new(db_name)
end

# Routes

get "/" do
  erb :home
end

post "/name" do
  user_name = params['user_name']
  session[:user_id] = @storage.add_user(user_name)
  
  redirect "/questions"
end

get "/questions" do
  @questions = YAML.load_file('./data/questions.yml')
  @title = "🍦 Ice Cream Survey 🍦"

  erb :questions
end

post "/response" do
  params['toppings'] = [] if params['toppings'].nil?

  response_hsh = {
    brand: params['brand'],
    eating_style: params['eating_style'],
    flavor: params['flavor'],
    poem: params['poem'],
    toppings: params['toppings']
  }

  @storage.add_response(session[:user_id], response_hsh)

  session[:message] = <<~MSG
  Thank you!
  Your response has been saved and will help with our very valuable ice cream research.
  Have a wonderful rest of your day and enjoy some ice cream!
  🍦
  MSG

  redirect '/'
end

not_found do
  "That page does not exist."
end