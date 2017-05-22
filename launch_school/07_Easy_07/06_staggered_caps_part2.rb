=begin

Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

APPROACH

So the first thing to observe is that our useage of `index` with the % operator will not work anymore.
We somehow need to be able to 'skip' characters (that are not alpha-numeric).

What we could try is a "toggle":
- if the toggle is on and char is alphanumeric:
    upcase char and turn toggle off
- elsif the toggle is off and char is alphanumeric:
    do not upcase char and turn toggle on
- else (i.e., char is not alphanumeric)
    skip the iteration

=end


def toggle(switch)
  !switch
end

def staggered_case(string)
  upcase_next_char = false
  string.downcase.chars.map.with_index do |char, index|
    upcase_next_char = toggle(upcase_next_char) if char.match(/[a-z]/)
    if char.match(/[a-z]/) && upcase_next_char
      char.upcase
    else
      char
    end
  end.join
end

# further exploration: make it configurable with a keyword argument
# whether alpha-numeric should count
def toggle(switch)
  !switch
end

def alphabetic?(char)
  char.match(/[a-z]/)
end

def staggered_case(string, non_alpha_count: false)
  upcase_mode = false
  string.downcase.chars.map.with_index do |char, index|
    upcase_mode =
      toggle(upcase_mode) if alphabetic?(char) || non_alpha_count
    (alphabetic?(char) && upcase_mode) ? char.upcase : char
  end.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case('I Love Launch School!', non_alpha_count: true) == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', non_alpha_count: true) == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', non_alpha_count: true) == 'IgNoRe 77 ThE 444 NuMbErS'
