=begin

PDBAD

=== Problem ===

Create an app that presents a user with a set of questions to be answered.
All answers should be saved in a file.
If an admin user is logged in, they can change the questions and access the answers.

=== Data ===

Store answers as a hash

{
  ID_1: {
    Question_1: Answer_1,
    Question_2: Answer_2,
    ...
  },
  ID_2: {
    Question_1: Answer_1,
    Question_2: Answer_2,
    ...
  },
  ID_3: {
    Question_1: Answer_1,
    Question_2: Answer_2,
    ...
  }
}

So to get a user's answer, it would be something like
answers[id][question_1] == answer1 (for user w/ id)

=== Brainstorm ===

Initial thoughts:
- If I associate a set of answers with a user's name, how do I differentiate between different users?
    - store each answer with an ID as the key and a 'name' as part of the value with the answers
    - OR the survey is anonymous; don't need names
- What's the best way to generate unique ID's without using a counter? (maybe start w/ counter and implement later)

Empty answers should be invalid

The homepage should be a welcome page where you can either login or begin the survey

=end

require 'yaml'

require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubi'
require 'redcarpet'
require 'bcrypt'

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

get '/' do
  erb :home
end


