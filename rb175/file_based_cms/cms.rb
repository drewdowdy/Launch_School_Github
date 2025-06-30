require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/content_for'
require 'tilt/erubi'
require 'redcarpet'

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
end

# Global Methods
def no_file_error(path)
  "#{File.basename(path)} does not exist." if !File.file?(path)
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def load_file_content(path)
  content = File.read(path)
  
  case File.extname(path) # File.extname gets extension name of file
  when '.txt'
    headers['Content-Type'] = 'text/plain'
    content
  when '.md'
    erb render_markdown(content)
  end
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

# Shows a list of all files
get '/' do
  pattern = File.join(data_path, '*') # File.join will use the right seperator based on OS
  @files = Dir.glob(pattern).map! do |path|
    File.basename(path)
  end

  erb :index
end

# Shows the contents of a file
get '/:file_name' do
  file_name = params[:file_name]
  file_path = File.join(data_path, file_name)

  if File.exist?(file_path)
    load_file_content(file_path)
  else
    session[:message] = "#{file_name} does not exist."
    redirect '/'
  end
end

# Shows the edit page
get '/:file_name/edit' do
  @file_name = params[:file_name]
  erb :edit
end

# Updates the file
post '/:file_name' do
  file_name = params[:file_name]
  file_path = File.join(data_path, file_name)
  user_input = params[:content]

  File.write(file_path, user_input)

  session[:message] = "#{file_name} has been updated"
  redirect '/'
end
