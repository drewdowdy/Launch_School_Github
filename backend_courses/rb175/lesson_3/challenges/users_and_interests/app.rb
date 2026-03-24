require 'tilt/erubi'
require "sinatra"
require "sinatra/reloader"
require "yaml"

helpers do 

  def count_interests(user_hsh)
    user_hsh.values.sum { |data| data[:interests].size }
  end

end

before do
  @user_hsh = YAML.load_file("public/users.yaml")
  @user_names = @user_hsh.keys.map(&:to_s)
end

get '/' do 
  redirect '/users'
end

get '/users' do 
  @title = "users"

  erb :users
end

get '/users/:name' do 
  @title = params[:name]
  @user_name = @title
  halt(404, "User \"#{@user_name.capitalize}\" not found") unless @user_hsh.key?(@user_name.to_sym)

  @user_data = @user_hsh[@user_name.to_sym]
  @remaining_user_names = @user_names.reject{ |n| n == @user_name }

  erb :individual
end
