select * from lecture;
select * from instructor;

-- CROSS JOIN
SELECT *
FROM lecture, instructor
-- lecture가 가진 instructor_id
-- instructor의 id가 일치한다.
WHERE lecture.instructor_id = instructor.id;


-- INNER JOIN
SELECT *
FROM lecture INNER JOIN instructor
    ON lecture.instructor_id = instructor.id;

-- inner join은 연관짓고 싶은 칼럼이 존재해야 한다.
SELECT *
FROM student INNER JOIN instructor
    ON student.advisor_id = instructor.id;

-- JOIN만 쓰면 INNER JOIN이 기본
SELECT *
FROM lecture JOIN instructor
    ON lecture.instructor_id = instructor.id;

-- 특정 열만 가져올수도 있다.
SELECT lecture.name, instructor.first_name, instructor.last_name
FROM lecture JOIN instructor
  ON lecture.instructor_id = instructor.id;


-- OUTER JOIN
-- 각 교수별 강의
SELECT *
FROM instructor LEFT OUTER JOIN lecture
    ON instructor.id = lecture.instructor_id;

-- 학생별 지도교수, 지도교수가 학생을 맡지 않을 수 있음
SELECT *
FROM student RIGHT OUTER JOIN instructor
    ON student.advisor_id = instructor.id;

-- 각 교수별 강의
SELECT *
FROM instructor LEFT JOIN lecture
ON instructor.id = lecture.instructor_id;

-- 학생별 지도교수, 지도교수가 학생을 맡지 않을 수 있음
SELECT *
FROM student RIGHT JOIN instructor
ON student.advisor_id = instructor.id;