-- INSERT SELECT UPDATE DELETE
-- 연습용 테이블
DROP TABLE IF EXISTS user;
CREATE TABLE user (
    id integer primary key autoincrement ,
    first_name varchar(255) default NULL ,
    last_name varchar(255) default NULL ,
    age mediumint default NULL,
    balance mediumint default NULL,
    phone varchar(100) default NULL,
    email varchar(255) default NULL,
    country varchar(100) default NULL
);

-- INSERT
INSERT INTO user (first_name, last_name)
VALUES ('jeeho', 'park');

INSERT INTO user (first_name, last_name, age, balance)
VALUES ('Alex', 'Rod', 50, 1000000);

INSERT INTO user (first_name, last_name, age, balance, phone, email, country)
VALUES ('Chad', 'Brad', 49, 100000, '01012345678', 'cb@gmail.com', 'USA');

-- SELECT
-- 모든 것을 조회하기
SELECT * FROM user;

-- 특정 컬럼의 데이터만 조회하기
SELECT first_name, last_name FROM user;
SELECT age, first_name, last_name FROM user;

-- 특정 컬럼의 데이터를 기준으로 정렬해서 조회하기
SELECT first_name, age FROM user ORDER BY age;
SELECT first_name, age FROM user ORDER BY age DESC;


-- UPDATE
-- 나이가 없는 데이터의 나이를 전부 0으로
-- 갱신할 테이블
UPDATE user
-- 갱신할 컬럼에 넣을 데이터
SET age = 0
-- 어떤 열들을 대상으로 하는지
WHERE age IS NULL;

-- jeeho를 이름으로 가진 열의 나이를 60으로, balance를 0으로
UPDATE user
SET age = 60, balance = 0
WHERE first_name = 'jeeho';

-- country가 NULL인 열들의 국적을 Korea로
UPDATE user
SET country = 'KOREA'
WHERE country IS NULL;

UPDATE user
SET balance = 0;

-- DELETE
-- first_name이 jeeho인 열을 지운다.
DELETE FROM user
WHERE first_name = 'jeeho';

DELETE FROM user;


-- INSERT 할때 Constraint 꼭 지킬것
DROP TABLE IF EXISTS user;
CREATE TABLE user (
    id integer primary key autoincrement ,
    first_name varchar(255) NOT NULL ,
    last_name varchar(255) NOT NULL ,
    age mediumint NOT NULL,
    balance mediumint default NULL,
    phone varchar(100) default NULL,
    email varchar(255) default NULL,
    country varchar(100) default NULL
);

-- NOT NULL을 만족하지 못한다.
INSERT INTO user (first_name, last_name)
VALUES ('jeeho', 'park');


DROP TABLE IF EXISTS user;
CREATE TABLE user (
    id integer primary key autoincrement ,
    first_name varchar(255) UNIQUE ,
    last_name varchar(255) NOT NULL ,
    age mediumint NOT NULL,
    balance mediumint default NULL,
    phone varchar(100) default NULL,
    email varchar(255) default NULL,
    country varchar(100) default NULL
);

INSERT INTO user (first_name, last_name, age)
VALUES ('jeeho', 'park', 60);

INSERT INTO user (first_name, last_name, age)
VALUES ('jeeho', 'baek', 40);
