require "sinatra"
require "sinatra/reloader"
require "tilt/erubi"

get "/" do
  redirect "/lists"
end

get "/lists" do
  @lists = [
    {name: "Groceries", todos: []},
    {name: "Dinner Groceries", todos: []}
  ]
  erb :lists, layout: :layout
end

set :session_secret, SecureRandom.hex(32)
