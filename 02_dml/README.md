# SQL - DML

Data Manipulation Language, 데이터를 조작하기 위한 언어.

## `INSERT`, `SELECT`, `UPDATE`, `DELETE`

데이터에 가할 수 있는 4가지 기초 작업인 CRUD(Create, Read, Update, Delete)를 하기 위한 SQL

- `INSERT`, 데이터를 테이블에 추가.
    ```sql
    INSERT INTO user(first_name, last_name, age, balance)
    VALUES ('jeeho', 'park', 99, 100);
    ```
- `SELECT`, 테이블의 데이터를 조회.
    ```sql
    SELECT * FROM user;
    ```
- `UPDATE`, 테이블의 데이터를 갱신.
    ```sql
    UPDATE user
    SET phone = '010-1111-1111',
    age = 50
    WHERE first_name = 'jeeho';
    ```
    `WHERE`가 생략될 경우 모든 데이터에 적용하게 됨으로 주의.
- `DELETE`, 테이블의 데이터를 삭제.
    ```sql
    DELETE FROM user
    WHERE first_name = 'jeeho';
    ```
    `WHERE`가 생략될 경우 모든 데이터를 삭제하게 됨으로 주의.

## `SELECT` 활용하기

데이터베이스 자체가 여러 데이터를 보관, 조회하기 위한 만큼 `SELECT`를 사용하는 다양한 방법이 존재한다.

### `ORDER BY`

조회 결과 정렬, `DESC`로 내림차순 정렬

```sql
SELECT * FROM user ORDER BY age;
SELECT * FROM user ORDER BY age, first_name;
SELECT * FROM user ORDER BY age DESC, first_name;
```

### `DISTINCT`

조회된 컬럼의 중복된 값을 제거

```sql
SELECT DISTINCT age FROM user;
SELECT DISTINCT first_name FROM user;
SELECT DISTINCT first_name, last_name FROM user;
SELECT DISTINCT country FROM user ORDER BY country;
```

### `WHERE`

조회시 조건 지정

```sql
SELECT first_name FROM user WHERE age < 30;
SELECT first_name, last_name FROM user WHERE age >= 30;
SELECT first_name, age, balance FROM user WHERE balance < 150;
SELECT first_name, last_name, age FROM user WHERE age < 30 AND balance > 180;
```

### `WHERE` + `LIKE`

문자열의 일부 일치 기준

- `%` - 0개 이상의 문자와 동일
- `_` - 1개의 문자와 동일

```sql
SELECT last_name, email FROM user WHERE email LIKE '%q%';
SELECT phone FROM user WHERE phone LIKE '010-%';
SELECT phone FROM user WHERE NOT phone LIKE '010-%';
```

### `WHERE` + `IN`

특정 값 목록 내의 존재 검사

```sql
SELECT first_name, last_name, country
FROM user
WHERE
    country IN ('United States', 'Canada', 'Mexico');

SELECT first_name, last_name, country
FROM user
WHERE
    country NOT IN ('Italy', 'France', 'Germany', 'United Kingdom', 'Spain')
ORDER BY
    country;
```

### `WHERE` + `BETWEEN`

값이 범위 내에 있는지 검사

```sql
SELECT first_name, last_name
FROM user
WHERE
    age BETWEEN 30 AND 40;

SELECT first_name, last_name
FROM user
WHERE
    age NOT BETWEEN 20 AND 40;
```

### `LIMIT`, `OFFSET`

`LIMIT`을 사용하면 결과의 갯수를 제한할 수 있다.

```sql
SELECT id, first_name, last_name
FROM user
WHERE age < 40
LIMIT 20;
```

`OFFSET`을 함께 사용하면 특정 순서 이후의 데이터를 조회할 수 있다.

```sql
SELECT id, first_name, last_name
FROM user
WHERE age < 30
LIMIT 20 OFFSET 85;
```

## Aggregate Functions

특정 컬럼의 데이터를 모아 집계를 내리는 함수.
- `COUNT()`: 갯수
- `AVG()`: 평균
- `MAX()`: 최대
- `MIN()`: 최소
- `SUM()`: 합계

```sql
SELECT COUNT(*) FROM user;       -- user 테이블의 열의 갯수를 반환한다.
SELECT AVG(balance) FROM user;   -- user 테이블의 balance 값들의 평균을 반환한다.
SELECT MAX(age) FROM user;       -- user 테이블의 age 값들 중 최댓값을 반환한다.
SELECT MIN(age) FROM user;       -- user 테이블의 age 값들 중 최값을 반환한다.
SELECT SUM(balance) FROM user;   -- user 테이블의 balance 값들의 합을 반환한다.
```

### `GROUP BY`

어떤 특정 컬럼의 값을 기준으로 여러 데이터를 하나로 묶어준다.

```sql
-- 국적과 국적별 평균 잔고를 조회한다.
SELECT country, AVG(balance)
FROM user
-- 국적으로 그룹을 만든다.
GROUP BY country;
```

집계함수의 결과를 바탕으로 정렬이 가능하다.

```sql
SELECT country, AVG(age)
FROM user
GROUP BY country
ORDER BY AVG(age);
```

### HAVING

집계함수의 결과를 조건으로 조회되는 데이터를 제한시킬때 사용.

```sql
-- 국적과 국적별 평균 나이를 조회한다.
SELECT country, AVG(age)
FROM user
-- 국적으로 그룹을 만든다.
GROUP BY country
-- 이때 나이의 평균이 40 미만이어야 한다.
HAVING AVG(age) < 40;
```


