> What is the method lookup path and how is it important?

- The method lookup path is the order in which Ruby will search through the classes for some method when invoked on an object.
- It is important because, depending on the hierarchy, Ruby will check some classes before others in a certain order. Ruby will invoke the first instance of a method that it finds among the hierarchy.
