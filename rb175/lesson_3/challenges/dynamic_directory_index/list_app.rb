require 'tilt/erubi'
require "sinatra"
require "sinatra/reloader"

get '/' do 
  @docs = Dir.glob('public/*.txt').map! do |doc|
    File.basename(doc, '.txt')
  end

  @docs.reverse! if params[:sort] == 'desc'

  erb :home
end

get '/apple' do 
  @title = "Apple"
  @content = File.readlines('public/apple.txt')

  erb :fruit
end

get '/banana' do 
  @title = "Banana"
  @content = File.readlines('public/banana.txt')

  erb :fruit
end

get '/cantaloupe' do 
  @title = "Cantaloupe"
  @content = File.readlines('public/cantaloupe.txt')

  erb :fruit
end

get '/durian' do 
  @title = "Durian"
  @content = File.readlines('public/durian.txt')

  erb :fruit
end

get '/elderberry' do 
  @title = "Elderberry"
  @content = File.readlines('public/elderberry.txt')

  erb :fruit
end
