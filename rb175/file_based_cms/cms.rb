require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/content_for'
require 'tilt/erubi'
require 'redcarpet'
require 'yaml'
require 'bcrypt'

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

def version_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/versions", __FILE__)
  else
    File.expand_path("../versions", __FILE__)
  end
end

def require_user_sign_in
  if session[:username].nil?
    session[:message] = 'You must be signed in to do that.'
    redirect '/'
  end
end

def load_user_credentials
  credentials_path = if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/users.yml", __FILE__)
  else
    File.expand_path("../users.yml", __FILE__)
  end

  YAML.load_file(credentials_path)
end

def valid_credentials?(username, password)
  users = load_user_credentials

  if users.key?(username)
    bcrypt_password = BCrypt::Password.new(users[username]) # BCrypt::Password.new uses an EXISTING hash; #create makes a new one
    bcrypt_password == password
  else
    false
  end
end

def hash_password(password)
  BCrypt::Password.create(password).to_s
end

def correct_extension?(file_name)
  file_name.include?('.txt') || file_name.include?('.md')
end

def generate_copy_name(file_name)
  extension = File.extname(file_name)
  base_name = File.basename(file_name, extension)

  copy_name = "#{base_name}_copy#{extension}"
  new_path = File.join(data_path, copy_name)
  number = 2

  while File.file?(new_path)
    copy_name = "#{base_name}_copy_#{number}#{extension}"
    new_path = File.join(data_path, copy_name)
    number += 1
  end

  copy_name
end

def generate_version_name(file_name)
  extension = File.extname(file_name)
  base_name = File.basename(file_name, extension)

  version_name = "#{base_name}_version_1#{extension}"
  new_path = File.join(version_path, version_name)
  number = 2

  while File.file?(new_path)
    version_name = "#{base_name}_version_#{number}#{extension}"
    new_path = File.join(version_path, version_name)
    number += 1
  end

  version_name
end

# ~~~~~~~~~~~~~~~~~~~~

# Shows a list of all files
get '/' do
  @title = 'Index'

  pattern = File.join(data_path, '*') # File.join will use the right seperator based on OS
  @files = Dir.glob(pattern).map! do |path|
    File.basename(path)
  end

  erb :index
end

# Shows the upload image page
get '/new_image' do
  require_user_sign_in

  @title = 'Upload an Image'
  erb :new_image
end

# Saves the image in the data folder
post '/new_image' do
  if params[:image_upload] && params[:image_upload][:tempfile]
    uploaded_image = params[:image_upload]
    image_name = uploaded_image[:filename]
    image_data = uploaded_image[:tempfile]

    file_path = File.join(data_path, image_name)

    File.open(file_path, 'wb') do |file|  # wb - 'write binary' binary mode
      file.write(image_data.read)
    end

    session[:message] = 'Image was successfully uploaded.'
    redirect '/'
  else
    session[:message] = 'No image was uploaded.'
    status 422
    erb :new_image
  end
end

# Shows the new document page
get '/new' do
  require_user_sign_in

  @title = 'New Document'

  erb :new
end

# Creates the new document in the data folder
post '/create' do
  require_user_sign_in

  new_file_name = params[:file_name] || ''

  if new_file_name.size.zero?
    session[:message] = 'A name is required.'
    status 422
    erb :new
  elsif !correct_extension?(new_file_name)
    session[:message] = 'File extensions must be .txt or .md.'
    status 422
    erb :new
  else
    new_path = File.join(data_path, new_file_name)
    File.write(new_path, '')
    session[:message] = "#{new_file_name} was created."
    redirect '/'
  end
end

# Duplicates an existing file
post '/duplicate' do
  require_user_sign_in

  original_path = File.join(data_path, params[:existing_file_name])
  original_content = File.read(original_path)

  copy_name = generate_copy_name(params[:existing_file_name])
  new_path = File.join(data_path, copy_name)

  File.write(new_path, original_content)

  session[:message] = "#{params[:existing_file_name]} has been duplicated."
  redirect '/'
end

# Shows the contents of a file
get '/:file_name' do
  file_name = File.basename(params[:file_name])
  file_path = File.join(data_path, file_name)
  file_extension = File.extname(file_name)

  if File.exist?(file_path)
    if ['.jpeg', '.jpg'].include?(file_extension)
      content_type 'image/jpeg'
      File.read(file_path)
    else
      load_file_content(file_path)
    end
  else
    session[:message] = "#{file_name} does not exist."
    redirect '/'
  end
end

# Shows the edit page
get '/:file_name/edit' do
  require_user_sign_in

  @title = 'Edit File'
  @file_name = params[:file_name]

  erb :edit
end

# Updates the content of a file
post '/:file_name' do
  require_user_sign_in

  file_name = params[:file_name]
  file_path = File.join(data_path, file_name)
  original_content = File.read(file_path)
  
  version_name = generate_version_name(file_name)
  full_version_path = File.join(version_path, version_name)

  new_content = params[:content]

  File.write(full_version_path, original_content) # save a record of original content
  File.write(file_path, new_content)              # update the content of file

  session[:message] = "#{file_name} has been updated."
  redirect '/'
end

# Deletes a file from the folder
post '/:file_name/delete' do
  require_user_sign_in

  file_name = params[:file_name]
  file_path = File.join(data_path, file_name)
  
  File.delete(file_path)

  session[:message] = "#{file_name} has been deleted."
  redirect '/'
end

# Shows the signin page
get '/users/signin' do
  @title = 'Sign In'

  erb :signin
end

# Analyzes the user's signin credentials
post '/users/signin' do
  users = load_user_credentials
  username = params[:username]
  password = params[:password]

  if valid_credentials?(username, password)
    session[:username] = params[:username]
    session[:message] = 'Welcome!'
    redirect '/'
  else
    session[:message] = 'Invalid credentials'
    status 422
    erb :signin
  end
end

# Signs out the user
post '/users/signout' do 
  session.delete(:username)
  session[:message] = 'You have been signed out.'
  redirect '/'
end

# Shows the signup page
get '/users/signup' do
  @title = 'Sign Up'

  erb :signup
end

# Analyzes the user's sign up information
post '/users/signup' do
  users = load_user_credentials

  if users.key?(params[:username])
    session[:message] = 'Username is already taken. Choose a new one.'
    status 422
    erb :signup
  else
    username = params[:username]
    users[username] = hash_password(params[:password])
    credentials_path = File.expand_path("../users.yml", __FILE__)

    File.write(credentials_path, users.to_yaml)

    session[:message] = 'You have successfully signed up.'
    redirect '/'
  end
end
