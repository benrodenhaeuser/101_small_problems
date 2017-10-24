require 'set'

class Student
  attr_reader :name, :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end
end

class School
  def initialize
    @students = [] # array, or perhaps hash?
    @grades = Set.new
  end

  def add(name, grade) # enroll student in grade
    @students << Student.new(name, grade)
    @grades.add(grade)
  end

  def students(grade) # get list of all students in grade
    @students
      .select { |student| student.grade == grade }
      .map(&:name).sort
  end

  def students_by_grade # all students, by grade
    list = []
    @grades.each do |grade|
      list << {
        grade: grade,
        students: students(grade)
      }
    end
    list.sort_by { |student_group| student_group[:grade] }
  end

end

module BookKeeping
  VERSION = 3
end
