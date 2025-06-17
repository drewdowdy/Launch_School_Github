require 'tilt/erubi'
require "sinatra"
require "sinatra/reloader"

# `before` is used to pre-load any content that will be globally used by the app
before do
  @contents = File.readlines("data/toc.txt")
end

# `helpers` allows for methods to be called in view templates (.erb files)
helpers do

  def in_paragraphs(text)
    text.split("\n\n").each_with_index.map do |line, index|
      "<p id=paragraph#{index}>#{line}</p>"
    end.join
  end

  def highlight(text, term)
    text.gsub(term, %(<strong>#{term}</strong>))
  end

end

# `get` defines a route in the application; what action to take when a user types in the URL
get "/" do
  @title = "The Adventures of Sherlock Holmes"

  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  chapter_name = @contents[number - 1]
  @title = "Chapter #{number}: #{chapter_name}"

  redirect "/" unless (1..@contents.size).cover? number

  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

# Calls the block for each chapter, passing that chapter's number, name, and contents.
def each_chapter
  @contents.each_with_index do |name, index|
    number = index + 1
    contents = File.read("data/chp#{number}.txt")
    yield number, name, contents
  end
end

# This method returns an Array of Hashes representing chapters that match the specified query. Each Hash contain values for its :name and :number keys.
def chapters_matching(query)
  results = []

  return results if !query || query.empty?

  each_chapter do |number, name, contents|
    if contents.include?(query)
      matches = {}

      contents.split("\n\n").each_with_index do |paragraph, index|
        matches[index] = paragraph if paragraph.include?(query)
      end

      results << {number: number, name: name, paragraphs: matches} if matches.any?
    end
  end

  results
end

get "/search" do
  @results = chapters_matching(params[:query])
  erb :search
end

# `not_found` route will execute when the app can't find any other route to match a request
not_found do
  redirect "/"
end
