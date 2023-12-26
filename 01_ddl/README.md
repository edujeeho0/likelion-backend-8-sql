# SQL - DDL

Data Definition Language, 데이터를 정의하는 SQL.

## `CREATE TABLE`

데이터베이스 테이블을 만들기 위해 사용하는 DDL.

```sql
CREATE TABLE table_name (
    column_name1 data_type constraints,
    column_name2 data_type constraints
);
```

데이터베이스의 테이블에는 다양한 자료형을 가지고 있다. 이는 어떤 데이터베이스를 사용하는지에 따라 조금씩 다르다.

```sql
-- 가장 기본적인 CREATE TABLE
CREATE TABLE user (
    id INTEGER,
    username VARCHAR(64),
    first_name VARCHAR(32),
    last_name VARCHAR(32),
    email VARCHAR(100)
);
```

## Table Constraints

데이터 무결성을 위해 테이블에 여러 제약사항을 적용할 수 있다.

### `NOT NULL`

컬럼에 `NULL`을 허용하지 않음

```sql
CREATE TABLE user (
    id INTEGER,
    username VARCHAR(64),
    first_name VARCHAR(32),
    last_name VARCHAR(32),
    email VARCHAR(100) NOT NULL
);
```

### `UNIQUE`

컬럼의 각 행의 모든 값이 고유해야(겹치지 않아야) 함

```sql
CREATE TABLE user (
    id INTEGER,
    username VARCHAR(64) UNIQUE,
    first_name VARCHAR(32),
    last_name VARCHAR(32),
    email VARCHAR(100)
);
```

### `PRIMARY KEY`

Primary Key, 즉 기본키로 지정한다. 묵시적으로 `NOT NULL`이다.

```sql
CREATE TABLE user (
    id INTEGER PRIMARY KEY,  -- NOT NULL
    username VARCHAR(64),
    first_name VARCHAR(32),
    last_name VARCHAR(32),
    email VARCHAR(100)
);
```

### `AUTOINCREMENT`

사용되지 않은 값이나 이전에 삭제된 행의 값을 재사용하지 않고, 하나씩 증가되는 값을 적용해준다.

```sql
CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(64),
    first_name VARCHAR(32),
    last_name VARCHAR(32),
    email VARCHAR(100)
);
```

## `ALTER TABLE`

이미 존재하는 테이블을 수정한다.

- `RENAME TO`
    ```sql
    ALTER TABLE user RENAME TO user_backup;
    ALTER TABLE user_backup RENAME TO user;
    ```
- `RENAME COLUMN`
    ```sql
    ALTER TABLE user RENAME COLUMN first_name to given_name;
    ALTER TABLE user RENAME COLUMN last_name to sur_name;
    ```
- `ADD COLUMN`
    ```sql
    ALTER TABLE user ADD COLUMN address VARCHAR(256);
    ```
    컬럼을 추가하면서 제약사항을 명시할 수 있다. `NOT NULL`을 적용할 경우 주의.
    ```sql
    ALTER TABLE user ADD COLUMN phone VARCHAR(128) NOT NULL DEFAULT '';  -- DEFAULT
    ```  
- `DROP COLUMN`
    ```sql
    ALTER TABLE user DROP COLUMN phone;
    ```
  
## `DROP TABLE`

테이블을 삭제한다. 돌이킬 수 없으니 주의 요망.

```sql
-- DROP TABLE
DROP TABLE user;
DROP TABLE IF EXISTS user;
```

