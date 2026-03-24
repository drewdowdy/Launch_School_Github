def group(birds)
 yield(birds)
end

birds = %w(raven finch hawk eagle)

group(birds) { |_, _, *raptors| p raptors }
