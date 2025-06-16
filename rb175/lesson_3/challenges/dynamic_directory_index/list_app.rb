require 'tilt/erubi'
require "sinatra"
require "sinatra/reloader"

get '/' do 
  @docs = Dir.glob('public/*.txt').map! do |doc|
    File.basename("#{doc}", '.txt')
  end

  erb :home
end

get '/apple' do 
  
end
