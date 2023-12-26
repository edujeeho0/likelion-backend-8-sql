# JOIN

데이터의 중복을 피하기 위해 하나의 테이블의 데이터를 두개 이상의 테이블로 나눌 수 있다.
이렇게 나눠진 테이블을 다시 합쳐서 조회할 때 `JOIN`을 활용할 수 있다.

## CROSS JOIN

두 테이블의 곱집합을 구하는 `JOIN`. 각 테이블의 레코드 데이터 간의 연관관계 없이 모든 조합을 만든다.

```sql
SELECT *
FROM lecture, instructor;
```

## INNER JOIN

두개의 테이블을 `ON`을 통해 특정 조건에 대하여 하나의 레코드로 만들어 하나의 테이블로
만드는 `JOIN`. 만약 한쪽의 데이터가 비어있다면 해당 레코드는 조회가 안된다.

```sql
SELECT *
FROM lecture INNER JOIN instructor
    ON lecture.instructor_id = instructor.id;
```

`INNER`는 생략 가능하다.

```sql
SELECT *
FROM lecture JOIN instructor
    ON lecture.instructor_id = instructor.id;
```

## OUTER JOIN

비어있는 데이터를 함께 보고 싶다면, `OUTER JOIN`이 가능하다. 이 경우 왼쪽과 오른쪽 테이블 중
어떤 데이터를 누락시키지 않을 것인지를 `LEFT`, `RIGHT`로 전달한다.

```sql
SELECT *
FROM instructor LEFT OUTER JOIN lecture
    ON instructor.id = lecture.instructor_id;

SELECT *
FROM student RIGHT OUTER JOIN instructor
    ON student.advisor_id = instructor.id;
```

`OUTER JOIN`의 경우 `OUTER`가 생략 가능하다.

```sql
SELECT *
FROM instructor LEFT JOIN lecture
    ON instructor.id = lecture.instructor_id;

SELECT *
FROM student RIGHT JOIN instructor
    ON student.advisor_id = instructor.id;
```

`FULL OUTER JOIN`을 이용해 양쪽 테이블의 데이터를 전부 볼 수 있다.

```sql
SELECT *
FROM student FULL OUTER JOIN instructor
   ON student.advisor_id = instructor.id;
```

## Alias

SQL을 사용하는 과정에서 테이블 이름을 축약시켜 사용할 수 있다.

```sql
SELECT s.id, s.first_name, s.last_name, l.name
FROM student s
    LEFT JOIN attending_lectures a ON s.id = a.student_id
    LEFT JOIN lecture l ON a.attending_id = l.id
ORDER BY s.id;
```


