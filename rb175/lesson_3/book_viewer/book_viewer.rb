require "sinatra"
require "sinatra/reloader"

get "/" do
  File.read "public/template.html"
  # "Hello World!"
end
