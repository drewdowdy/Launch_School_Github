/*
Tasks:
- return an object
  - {student grades: [], exams: []}
    - student grades is an array of the avarage exam grade of each student
    - exams is an array of the average, minimum, and maximum grades of each exam
*/

let studentScores = {
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

const EXAM_WEIGHT = 65 / 100;
const EXERCISE_WEIGHT = 35 / 100;

function getGrade(score) {
  switch(true) {
    case score >= 93: 
      return 'A';
    case score >= 85:
      return 'B';
    case score >= 77:
      return 'C';
    case score >= 69:
      return 'D';
    case score >= 60:
      return 'E';
    default:
      return 'F';
  }
}

function sum(total, num){
  return total + num;
}

function average(...grades) {
  return grades.reduce(sum, 0) / grades.length;
}

function getAllExamScores(scores) {
  return Object.values(scores).map(obj => {
    return obj.scores.exams;
  });
}

function generateClassRecordSummary(scores) {
  let studentGrades = Object.entries(scores).map(studentArr => {
    let studentObj = studentArr[1];
    
    let weightedAverageExamScore = average(...studentObj.scores.exams) * EXAM_WEIGHT;
    let weightedExerciseScore = studentObj.scores.exercises.reduce(sum, 0) * EXERCISE_WEIGHT;

    let roundedGrade = Math.round(weightedAverageExamScore + weightedExerciseScore);
    return `${roundedGrade} (${getGrade(roundedGrade)})`;
  });

  let allExamScores = getAllExamScores(scores);

  let exams = allExamScores[0].map((_, examIdx) => {
    let examScores = allExamScores.map(student => student[examIdx]);

    return {
      average: average(...examScores),
      minimum: Math.min(...examScores),
      maximum: Math.max(...examScores),
    }
  });

  return {
    studentGrades,
    exams,
  }
}

console.log(generateClassRecordSummary(studentScores));

// returns:
// {
//   studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
//   exams: [
//     { average: 75.6, minimum: 50, maximum: 100 },
//     { average: 86.4, minimum: 70, maximum: 100 },
//     { average: 87.6, minimum: 60, maximum: 100 },
//     { average: 91.8, minimum: 80, maximum: 100 },
//   ],
// }
