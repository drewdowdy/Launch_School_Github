require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/content_for'
require 'tilt/erubi'
require 'redcarpet'

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

helpers do
  def no_file_error(path)
    "#{File.basename(path)} does not exist." if !File.file?(path)
  end

  def render_markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(text)
  end

  def load_file_content(path)
    content = File.read(path)
    
    case File.extname(path) # gets extension name of file
    when '.txt'
      headers['Content-Type'] = 'text/plain'
      content
    when '.md'
      render_markdown(content)
    end
  end
end

get '/' do
  erb :index
end

get '/:file_name' do
  file_name = params[:file_name]
  file_path = @root + '/data/' + file_name

  if File.exist?(file_path)
    load_file_content(file_path)
  else
    session[:error] = "#{file_name} does not exist."
    redirect '/'
  end
end
