Q1) List all students

SELECT * FROM students;

Q2) Show all courses

SELECT * FROM courses;

Q3) Students enrolled in "Database Systems"

SELECT s.name
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Database Systems';

Q4) Count total students enrolled in each course

SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name;

Q5) Display exam marks with student & course

SELECT s.name, c.course_name, r.marks
FROM results r
JOIN exams e ON r.exam_id = e.exam_id
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;

Q6) Highest scoring student

SELECT s.name, r.marks
FROM results r
JOIN exams e ON r.exam_id = e.exam_id
JOIN students s ON e.student_id = s.student_id
ORDER BY r.marks DESC
LIMIT 1;

Q7) Students not enrolled in any course

SELECT s.name
FROM students s
LEFT JOIN enrollment e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

Q8) Courses with no exams conducted

SELECT c.course_name
FROM courses c
LEFT JOIN exams e ON c.course_id = e.course_id
WHERE e.exam_id IS NULL;

Q9) Average marks per course

SELECT c.course_name, AVG(r.marks) AS avg_marks
FROM results r
JOIN exams e ON r.exam_id = e.exam_id
JOIN courses c ON e.course_id = c.course_id
GROUP BY c.course_name;

Q10) Students with grade ‘A’

SELECT s.name
FROM results r
JOIN exams e ON r.exam_id = e.exam_id
JOIN students s ON e.student_id = s.student_id
WHERE r.grade = 'A';

Q11) List exams conducted in February

SELECT *
FROM exams
WHERE MONTH(exam_date) = 2;

Q12) Convert marks → auto grade

SELECT marks,
CASE 
    WHEN marks >= 85 THEN 'A'
    WHEN marks >= 70 THEN 'B'
    WHEN marks >= 50 THEN 'C'
    ELSE 'D'
END AS grade
FROM results;

Q13) Show student with most enrollments

SELECT s.name, COUNT(e.course_id) AS total_courses
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
GROUP BY s.name
ORDER BY total_courses DESC
LIMIT 1;