/*
Create a school object. The school object uses the same kind of student object as the previous exercise. It has methods that use and update information about the student. Be sure to check out the previous exercise for the other arguments that might be needed by the school object. Implement the following methods for the school object:

- addStudent: Adds a student by creating a new student and adding the student to a collection of students. The method adds a constraint that the year can only be any of the following values: '1st', '2nd', '3rd', '4th', or '5th'. Returns a student object if year is valid otherwise it logs "Invalid Year".
- enrollStudent: Enrolls a student in a course.
- addGrade: Adds the grade of a student for a course.
- getReportCard: Logs the grades of a student for all courses. If the course has no grade, it uses "In progress" as the grade.
- courseReport: Logs the grades of all students for a given course name. Only student with grades are part of the course report.

To test your code, use the three student objects listed below. Using the three student objects, produce the following values from the getReportCard and courseReport methods respectively.
*/

// Examples of created student objects with grades; methods
// on the objects are not shown here for brevity. The
// following are only showing the properties that aren't
// methods for the three objects

function createStudent(name, year) {
  return {
    name,
    year,
    courses: [],

    info() {
      console.log(`${this.name} is a ${this.year} student.`);
    },

    addCourse(newCourse) {
      this.courses.push(newCourse);
    },

    listCourses() {
      console.log(this.courses);
    },

    getCourse(courseCode) {
      return this.courses.filter(({code}) => code === courseCode)[0];
    },

    addNote(courseCode, note) {
      let course = this.getCourse(courseCode);
      
      if (course) {
        course.notes ? course.notes += `; ${note}` : course.notes = note;
      } else {
        course.notes = note;
      }
    },

    viewNotes() {
      for (let course of this.courses) {
        console.log(`${course.name}: ${course.notes}`);
      }
    },

    updateNote(courseCode, newNote) {
      let course = this.getCourse(courseCode);
      if (course) course.notes = newNote;
    },
  };
}

let school = {
  students: [],

  addStudent(name, year) {
    if (['1st', '2nd', '3rd', '4th', '5th'].includes(year)) {
      let student = createStudent(name, year);
      this.students.push(student);
      return student;
    } else {
      console.log('Invalid year.');
    }
  },

  enrollStudent(student, courseName, courseCode) {
    student.addCourse({name: courseName, code: courseCode});
  },

  addGrade(student, courseName, grade) {
    let course = student.courses.filter(c => c.name === courseName)[0];
    if (course) course.grade = grade;
  },

  getReportCard(student) {
    for (let course of student.courses) {
      let score = course.grade || 'In Progress';
      console.log(`${course.name}: ${score}`);
    }
  },

  courseReport(courseName) {
    let studentsInCourse = this.students.filter(s => {
      return s.courses.some(c => c.name === courseName && c.grade);
    });
    
    if (studentsInCourse.length === 0) return undefined;
    
    console.log(`=${courseName}=`);
    
    let gradeSum = 0;
    for (let student of studentsInCourse) {
      let course = student.courses.filter(c => c.name === courseName)[0];
      console.log(`${student.name}: ${course.grade}`);
      gradeSum += course.grade;
    }
    let avg = gradeSum / studentsInCourse.length;
    
    console.log('---');
    console.log(`Course Average: ${avg}`);
  },
}

let paul = school.addStudent('Paul', '3rd');
let mary = school.addStudent('Mary', '1st');
let kim = school.addStudent('Kim', '2nd');

// -----

school.enrollStudent(paul, 'Math', 101);
school.enrollStudent(paul, 'Advanced Math', 102);
school.enrollStudent(paul, 'Physics', 202);

school.enrollStudent(mary, 'Math', 101);

school.enrollStudent(kim, 'Math', 101);
school.enrollStudent(kim, 'Advanced Math', 102);

// -----

school.addGrade(paul, 'Math', 95);
school.addGrade(paul, 'Advanced Math', 90);

school.addGrade(mary, 'Math', 91);

school.addGrade(kim, 'Math', 93);
school.addGrade(kim, 'Advanced Math', 90);

console.log(paul);
// {
//   name: 'Paul',
//   year: '3rd',
//   courses: [
//     { name: 'Math', code: 101, grade: 95, },
//     { name: 'Advanced Math', code: 102, grade: 90, },
//     { name: 'Physics', code: 202, }
//   ],
// }

console.log(mary);
// {
//   name: 'Mary',
//   year: '1st',
//   courses: [
//     { name: 'Math', code: 101, grade: 91, },
//   ],
// }

console.log(kim);
// {
//   name: 'Kim',
//   year: '2nd',
//   courses: [
//     { name: 'Math', code: 101, grade: 93, },
//     { name: 'Advanced Math', code: 102, grade: 90, },
//    ],
// }

school.getReportCard(paul);
// Math: 95
// Advanced Math: 90
// Physics: In progress

school.courseReport('Math');
// =Math Grades=
// Paul: 95
// Mary: 91
// Kim: 93
// ---
// Course Average: 93

school.courseReport('Advanced Math');
// =Advanced Math Grades=
// Paul: 90
// Kim: 90
// ---
// Course Average: 90

school.courseReport('Physics');
// undefined
