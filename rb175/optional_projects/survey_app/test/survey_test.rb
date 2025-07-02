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

  def test_welcome_page
    get '/'
  end

end

