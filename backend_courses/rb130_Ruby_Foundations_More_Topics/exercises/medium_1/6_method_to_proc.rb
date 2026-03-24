def convert_to_base_8(n)
  n.to_s(8).to_i
  # Integer#to_s(n) converts the calling integer to a string of base n
end

base8_proc = method(:convert_to_base_8).to_proc

p [8, 10, 12, 14, 16, 33].map(&base8_proc)
