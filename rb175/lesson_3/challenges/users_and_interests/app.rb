=begin

+ When a user loads the home page, they should be redirected to a page that lists all of the users' names. Load the users from the users.yaml file (content below).
+ Each of the users' names should be a link to a page for that user.
On each user's page, display their email address. Also display their interests, with a comma appearing between each interest.
+ At the bottom of each user's page, list links to all of the other users pages. Do not include the user whose page it is in this list.
+ Add a layout to the application. At the bottom of every page, display a message like this: "There are 3 users with a total of 9 interests."
- Update the message printed out in #5 to determine the number of users and interests based on the content of the YAML file. Use a view helper method, count_interests, to determine the total number of interests across all users.
- Add a new user to the users.yaml file. Verify that the site updates accordingly.

=end

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
  @all_names = @user_hsh.keys.map(&:to_s)
end

get '/' do 
  redirect '/users'
end

get '/users' do 
  @title = "Users"

  erb :users
end

get '/users/:name' do 
  @name = params[:name]
  @person = @user_hsh[@name.to_sym]
  @remaining_names = @all_names.reject{ |n| n == @name }

  erb :individual
end
