def print_in_box(string)
  box_width = string.size + 4
  edge_row = "+#{fill('-', box_width - 2)}+"
  empty_row = "|#{fill(' ', box_width - 2)}|"
  text_row = "| #{string} |"

  puts edge_row
  puts empty_row
  puts text_row
  puts empty_row
  puts edge_row
end

def fill(character, length)
  filler = ''
  length.times { filler << character }
  filler
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
