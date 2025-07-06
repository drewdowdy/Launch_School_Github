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

Question storage:

{
  1: {
    question: 'Do you like ice cream?',
    choices: ['Yes', 'No']
  },
  2: {
    question: 'How much do you like chocolate? 1 = not at all; 5 = so so much',
    choices: (1..5).to_a
  },
  3: {
    question: 'Would you put sprinkles on your ice cream?',
    choices: ['Sure', 'Maybe', 'No', "I don't know"]
  }
}

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
require 'sinatra/reloader' if development?
require 'tilt/erubi'
require 'redcarpet'
require 'bcrypt'

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
end

def path(folder)
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/#{folder}", __FILE__)
  else
    File.expand_path("../#{folder}", __FILE__)
  end
end

def load_survey_questions
  questions_path = if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data/questions.yml", __FILE__)
  else
    File.expand_path("../data/questions.yml", __FILE__)
  end

  YAML.load_file(questions_path)
end

def generate_user_id(file_name)
  users = File.join(path('survey_data'))
end

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Show the home page
get '/' do
  erb :home
end

# Show the list of survey questions
get '/questions' do
  @title = 'Survey'
  @survey_questions = load_survey_questions
  erb :questions
end

# Saves the user's answers from the survey
post '/questions' do
  user_id = generate_user_id

  session[:message] = 'Thank you for completing the survey!'
  redirect '/'
end
