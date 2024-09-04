=begin
According to (Wikipedia)[https://en.wikipedia.org/wiki/Handle_(computing)], a **handle** is:

> ...an abstract reference to a resource that is used when application software references blocks of memory or objects that are managed by another system like a database or an operating system. A resource handle can be an opaque identifier, in which case it is often an integer number (often an array index in an array or "table" that is used to manage that type of resource), or it can be a pointer that allows access to further information.



=end

class Flight
  # attr_accessor :database_handle <- delete this line

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end
