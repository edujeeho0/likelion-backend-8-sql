-- CROSS JOIN
-- 왼쪽과 오른쪽 데이터를 하나씩 조합해서
-- 전체 출력
SELECT *
FROM student, instructor;

SELECT *
FROM student CROSS JOIN instructor
WHERE advisor_id = instructor.id;

SELECT *
FROM instructor, lecture;

-- 어떤 교수님이 어떤 강의를 하는지 알고 싶다면?
SELECT instructor.id, lecture.instructor_id, first_name, last_name, name
FROM instructor, lecture
WHERE instructor.id = lecture.instructor_id;


-- INNER JOIN
-- ON을 통해 어떤 컬럼이 일치해야 하는지, 어떤 컬럼을 기준으로 JOIN을 하는지를 전달
-- 교수님들과 강의하시는 강의를 동시에 출력하고 싶다.
SELECT *
FROM instructor INNER JOIN lecture
                           ON instructor.id = lecture.instructor_id;

-- 강의별로 강의하는 교수님을 출력하고 싶다.
SELECT *
FROM lecture INNER JOIN instructor
                        ON lecture.instructor_id = instructor.id;

-- 학생들의 지도교수 정보를 포함해서 학생들을 출력하고 싶다.
SELECT student.first_name, student.last_name, instructor.first_name, instructor.last_name
FROM student INNER JOIN instructor
                        ON student.advisor_id = instructor.id;

-- INNER는 생략 가능
SELECT *
FROM student JOIN instructor
                  ON student.advisor_id = instructor.id;


-- OUTER JOIN
-- 학생을 지도교수님 정보까지 포함해서 출력하되
-- 지도교수가 없는 학생도 출력
SELECT *
FROM student LEFT OUTER JOIN instructor
                             ON student.advisor_id = instructor.id;


-- 교수와 지도학생을 출력하되
-- 지도하는 학생이 없는 교수님도 출력
SELECT *
FROM instructor LEFT OUTER JOIN student
        on instructor.id = student.advisor_id;

-- OR
SELECT *
FROM student RIGHT OUTER JOIN instructor
ON student.advisor_id = instructor.id;

SELECT *
FROM instructor RIGHT OUTER JOIN student
ON instructor.id = student.advisor_id;


-- OUTER는 생략 가능
SELECT *
FROM instructor LEFT JOIN lecture
                          ON instructor.id = lecture.instructor_id;

SELECT *
FROM student RIGHT JOIN instructor
ON student.advisor_id = instructor.id;


-- 학생과 지도교수를 전부 출력한다.
-- 한명의 학생도, 교수님도 빠지지 않는다.
SELECT *
FROM student FULL OUTER JOIN instructor
ON student.advisor_id = instructor.id
WHERE student.advisor_id IS NULL;


-- Many To Many
-- 각 학생이 듣고 있는 강의들을 출력한다.
-- 1. student와 enrolling_lectures를 INNER JOIN한다.
SELECT *
FROM student
         -- 요만큼이 하나의 테이블이다.
         INNER JOIN enrolling_lectures
                    ON student.id = enrolling_lectures.student_id
    -- 새로운 테이블과 ___를 INNER JOIN한다.
         INNER JOIN lecture
                    ON enrolling_lectures.lecture_id = lecture.id;

/*student
     -- 요만큼이 하나의 테이블이다.
     INNER JOIN enrolling_lectures
                ON student.id = enrolling_lectures.student_id
    -- 새로운 테이블과 ___를 INNER JOIN한다.
     INNER JOIN lecture
                ON enrolling_lectures.lecture_id = lecture.id*/

-- 이제 필요한 데이터 컬럼만 가져오자.
/*SELECT student.id, student.first_name, student.last_name, lecture.name
FROM 어떤_테이블
WHERE student.id = 1
ORDER BY student.first_name;*/


-- 이제 필요한 데이터 컬럼만 가져오자.
SELECT student.id, student.first_name, student.last_name, lecture.name
FROM student
         INNER JOIN enrolling_lectures
                    ON student.id = enrolling_lectures.student_id
         INNER JOIN lecture
                    ON enrolling_lectures.lecture_id = lecture.id
ORDER BY student.id;

-- OUTER JOIN도 가능
-- 모든 학생이 듣고있는 강의들을 다 출력한다.
-- 강의를 듣고있지 않은 학생들도 출력한다.
SELECT student.id, first_name, last_name, name
FROM student
    LEFT JOIN enrolling_lectures
            ON student.id = enrolling_lectures.student_id
    LEFT JOIN lecture
            ON enrolling_lectures.lecture_id = lecture.id;



-- ALIAS
-- 학생과 지도교수의 이름들
-- 너무길다!
SELECT student.first_name, student.last_name, instructor.first_name, instructor.last_name
FROM student JOIN instructor
ON student.advisor_id = instructor.id;

SELECT st.first_name, st.last_name, i.first_name, i.last_name
FROM student st JOIN instructor i
ON st.advisor_id = i.id;

SELECT s.id, s.first_name, s.last_name, l.name
FROM student s
    INNER JOIN enrolling_lectures sl
        ON s.id = sl.student_id
    INNER JOIN lecture l
        ON sl.lecture_id = l.id
ORDER BY s.id;

SELECT
    s.id AS studentId,
    s.first_name AS 'student first name',
    s.last_name AS 'student last name',
    l.name AS 'lecture name'
FROM student s
     INNER JOIN enrolling_lectures sl
        ON s.id = sl.student_id
     INNER JOIN lecture l
        ON sl.lecture_id = l.id
ORDER BY s.id;


-- 뭐...이렇게도 쓸수는 있다.
SELECT *
FROM student s
WHERE s.id = 1;


-- SubQuery
-- 어떤 특정 강의(2번 강의)를 듣는 학생들의 id를 가져오고 싶다.
SELECT student_id
FROM enrolling_lectures
WHERE lecture_id = 2;

-- 2번 강의를 듣는 학생들의 이름을 가져오고 싶다.
SELECT first_name, last_name
FROM student
    INNER JOIN enrolling_lectures
        ON student.id = enrolling_lectures.student_id
    INNER JOIN lecture
        ON lecture_id = lecture.id
WHERE lecture_id = 2;


-- 만약 강의를 듣는 학생의 id들을 알고있다면, IN을 활용할 수 있다.
SELECT first_name
FROM student
WHERE id IN (
    SELECT student_id
    FROM enrolling_lectures
    WHERE lecture_id = 2
);
