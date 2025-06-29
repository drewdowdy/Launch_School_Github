require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/content_for'
require 'tilt/erubi'

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
  set :erb, :escape_html => true
end

before do
  @files = Dir.glob('data/*').map do |file|
    File.basename(file)
  end
end

get '/' do
  erb :index
end