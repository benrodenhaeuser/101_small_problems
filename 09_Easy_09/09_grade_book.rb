=begin
Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.


APPROACH
- the mean_score of three scores is given by (score1 + score2 + score3) / 3.0
- (we don't want to round here, because that might distort the result)
- convert the mean to a letter grade => use a case statement or normal if elsif ... end

=end

def letter_grade(score)
  case
  when (90 <= score) && (score <= 100) then 'A'
  when (80 <= score) && (score < 90)   then 'B'
  when (70 <= score) && (score < 80)   then 'C'
  when (60 <= score) && (score < 70)   then 'D'
  when (0 <= score)  && (score < 60)   then 'F'
  end
end

# ^ (this can be improved by working with ranges)

def get_grade(score1, score2, score3)
  score = (score1 + score2 + score3) / 3.0
  letter_grade(score)
end

# generalize to arbitrary number of individual scores:
def get_grade(*scores)
  letter_grade(scores.reduce(&:+) / scores.size)
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

def get_grade(g1, g2, g3)
  case grade = (g1 + g2 + g3) / 3
  when 0..60 then 'F'
  when 60..70 then 'D'
  when 70..80 then 'C'
  when 80..90 then 'B'
  when 90..100 then 'A'
  end
end

p get_grade(70, 70, 70)
