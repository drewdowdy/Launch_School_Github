require 'rackup'

class MyApp
  def call(env)
    body = "<h2>Hello in Style!</h2>"

    [200, {"content-type" => "text/html"}, [body]]
  end
end

class FriendlyGreeting
  def initialize(app)
    @app = app
  end

  def call(env)
    body = @app.call(env).last

    [
      200,
      {"content-type" => "text/html"},
      body.prepend("<p>A warm welcome to you!</p>\n")
    ]
  end
end

class Wave
  def initialize(app)
    @app = app
  end
  def call(env)
    body = @app.call(env).last
   
    [
     200, 
     { "content-type" => "text/html" }, 
     body.prepend("<p>Wave from afar!</p>\n")
    ]
  end 
end
