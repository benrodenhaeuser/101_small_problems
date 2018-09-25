var utils = {
  sum: function (numbers) {
    var add = function (number1, number2) {
      return number1 + number2;
    };

    return numbers.reduce(add);
  },

  average: function (numbers) {
    return this.sum(numbers) / numbers.length;
  },

  minimum: function (numbers) {
    return Math.min.apply(null, numbers);
  },

  maximum: function (numbers) {
    return Math.max.apply(null, numbers);
  },

  transpose: function (lists) {
    var column = function (index) {
      return lists.map(function (list) {
        return list[index];
      });
    };

    var indices = Object.keys(lists[0]);
    return indices.map(column);
  }
}

var summaryForAllStudents = function (records) {
  var studentScores = function (studentHandle) {
    return records[studentHandle].scores;
  };

  var studentGrade = function (studentData) {
    var EXAM_WEIGHT = 0.65;
    var EXERCISE_WEIGHT = 0.35;
    var examScore = utils.average(studentData.exams);
    var exerciseScore = utils.sum(studentData.exercises);
    var score = examScore * EXAM_WEIGHT + exerciseScore * EXERCISE_WEIGHT;

    return Math.round(score);
  };

  var studentReport = function (percentGrade) {
    var letter = function (score) {
      if (score >= 93) {
        return 'A';
      } else if (score >= 85) {
        return 'B';
      } else if (score >= 77) {
        return 'C';
      } else if (score >= 69) {
        return 'D';
      } else if (score >= 60) {
        return 'E';
      } else {
        return 'F';
      }
    };

    return String(percentGrade) + ' (' + letter(percentGrade) + ')';
  };

  var studentHandles = Object.keys(records);
  return studentHandles.map(studentScores)
                       .map(studentGrade)
                       .map(studentReport);
};

var summaryForAllExams = function (records) {
  var studentExamScores = function(handle) {
    return records[handle].scores.exams;
  };

  var examReport = function (examData) {
    return {
      average: utils.average(examData),
      minimum: utils.minimum(examData),
      maximum: utils.maximum(examData)
    };
  };

  var studentHandles = Object.keys(records);
  var examData = utils.transpose(studentHandles.map(studentExamScores));
  return examData.map(examReport);
};

var generateClassRecordsSummary = function (records) {
  return {
    studentGrades: summaryForAllStudents(records),
    exams: summaryForAllExams(records)
  };
};

var records = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

console.log(generateClassRecordsSummary(records));
