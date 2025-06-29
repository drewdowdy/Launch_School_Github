require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/content_for'
require 'tilt/erubi'

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
  set :erb, :escape_html => true
end

root = File.expand_path("..", __FILE__)

get '/' do
  @files = Dir.glob(root + '/data/*').map! do |path|
    File.basename(path)
  end
  erb :index
end

get '/:file_name' do
  file_path = Dir.glob(root + '/data/' + params[:file_name]).first
  headers['Content-Type'] = 'text/plain'
  File.read(file_path)
end