-- ALTER TABLE RENAME
-- 테이블 이름 바꾸기
ALTER TABLE student RENAME TO student_backup;
ALTER TABLE student_backup RENAME TO student;

-- 컬럼의 이름 바꾸기
ALTER TABLE student RENAME COLUMN first_name TO given_name;
ALTER TABLE student RENAME COLUMN given_name TO first_name;
-- last_name을 sur_name으로
ALTER TABLE student RENAME COLUMN last_name TO sur_name;
ALTER TABLE student RENAME COLUMN sur_name TO last_name;

-- 컬럼 추가하기
ALTER TABLE student ADD COLUMN address VARCHAR(256);
-- 제약사항 넣어서 추가하기
ALTER TABLE student ADD COLUMN phone VARCHAR(128) NOT NULL DEFAULT '';
-- SQLite not supported
-- ALTER TABLE student ADD COLUMN social_id VARCHAR(128) UNIQUE;

-- 컬럼 제거하기
ALTER TABLE student DROP COLUMN phone;

-- DROP TABLE
DROP TABLE student;
DROP TABLE IF EXISTS student;
