function School() {
  this.students = [];
  this.grades = [];
}

School.prototype.add = function add(student, level) {
  this.students.push([student, level]);
  this.grades.push(level);
  this.grades.sort();
};

School.prototype.grade = function grade(level) {
  return this.students
    .filter(tuple => tuple[1] === level)
    .map(tuple => tuple[0])
    .sort((s1, s2) => {
      if (s1.toLowerCase() < s2.toLowerCase()) { return -1; }
      if (s1.toLowerCase() > s2.toLowerCase()) { return 1; }
      return 0;
    });
};

School.prototype.roster = function roster() {
  const theRoster = {};
  this.grades.forEach((level) => {
    theRoster[level] = this.grade(level);
  });
  return theRoster;
};

module.exports = School;
