def destructure(array)
  yield(array)
end

birds = %w(raven finch hawk eagle)

raptors = []
destructure(birds) { |_, _, *birds| raptors = birds }
puts raptors
