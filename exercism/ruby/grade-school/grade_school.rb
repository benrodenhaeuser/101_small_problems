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
    @students = []
    @grades = Set.new
  end

  def add(name, grade)
    @students << Student.new(name, grade)
    @grades << grade
  end

  def students(grade)
    @students
      .select { |student| student.grade == grade }
      .map(&:name)
      .sort
  end

  def students_by_grade
    @grades.map do |grade|
      {
        grade: grade,
        students: students(grade)
      }
    end.sort_by { |student_group| student_group[:grade] }
  end

end

module BookKeeping
  VERSION = 3
end
