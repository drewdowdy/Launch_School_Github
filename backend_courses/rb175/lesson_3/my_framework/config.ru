# 1. run this file with `bundle exec rackup config.ru -p 9595`
# 2. open web browser and type in `http://localhost:9595`

require_relative 'app'

run App.new
