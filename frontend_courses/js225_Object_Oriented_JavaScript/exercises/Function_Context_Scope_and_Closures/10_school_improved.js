/*
In an earlier exercise, we created a school object. It works, however, it can still be improved. The following are improvements for you to implement in the solution provided:

- Make the list students private. Right now, anyone can gain access to it and manipulate it.
- Make the constraint for allowed values for years a private variable. As a private variable it avoids an unnecessary statement in the addStudent method and at the same time makes the code more declarative.
- Make the getCourse function accessible in the addGrade method also. As it is, only the courseReport method has access.
*/

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

const school =  (() => {
  const students = [];
  const ALLOWED_YEARS = ['1st', '2nd', '3rd', '4th', '5th'];
  
  function getCourse(courseName) {
    return student.courses.filter(c => c.name === courseName)[0];
  }

  return {
    addStudent(name, year) {
      if (ALLOWED_YEARS.includes(year)) {
        let student = createStudent(name, year);
        students.push(student);
        return student;
      } else {
        console.log('Invalid year.');
      }
    },

    enrollStudent(student, courseName, courseCode) {
      student.addCourse({name: courseName, code: courseCode});
    },

    addGrade(student, courseName, grade) {
      let course = getCourse(courseName);
      if (course) course.grade = grade;
    },

    getReportCard(student) {
      for (let course of student.courses) {
        let score = course.grade || 'In Progress';
        console.log(`${course.name}: ${score}`);
      }
    },

    courseReport(courseName) {
      let studentsInCourse = students.filter(s => {
        return s.courses.some(c => c.name === courseName && c.grade);
      });
      
      if (studentsInCourse.length === 0) return undefined;
      
      console.log(`=${courseName}=`);
      
      let gradeSum = 0;
      for (let student of studentsInCourse) {
        let course = getCourse(courseName);
        console.log(`${student.name}: ${course.grade}`);
        gradeSum += course.grade;
      }
      let avg = gradeSum / studentsInCourse.length;
      
      console.log('---');
      console.log(`Course Average: ${avg}`);
    },
  }
})();
