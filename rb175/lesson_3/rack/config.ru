# 1. run with `rackup config.ru -p 8080`
# 2. open web browser to `http://localhost:8080`

require_relative "myapp"

use Wave
use FriendlyGreeting

run MyApp.new
