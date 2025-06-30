require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/content_for'
require 'tilt/erubi'

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
end

before do
  @root = File.expand_path('..', __FILE__)
  
  @files = Dir.glob(@root + '/data/*').map! do |path|
    File.basename(path)
  end
end

get '/' do
  erb :index
end

def error_for_file_name(file_name)
  "#{file_name} does not exist." if !@files.include?(file_name) 
end

get '/:file_name' do
  file_name = params[:file_name]
  error = error_for_file_name(file_name)

  if error
    session[:error] = error
    redirect '/'
  else
    file_path = Dir.glob(@root + '/data/' + file_name).first
    headers['Content-Type'] = 'text/plain'
    File.read(file_path)
  end
end
