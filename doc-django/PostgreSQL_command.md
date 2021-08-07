## PostgreSQL commands
0. in cmd connect to sql shell -- Preliminaire psql

$ psql -U postgres -h localhost
$ create database 'database_name';
$ drop database 'database_name';
$ create schema 'name_schema';
$ create table 'name_schema'.'database_name'(firstname CHAR(15), lastname CHAR(20));
$ select * from 'name_schema'.'database_name';
$ create user 'name_user' with password 'mypass';
$ insert into 'name_schema'.'database_name' values ('val1','val2',...);

1. Access the PostgreSQL server from psql with a specific user:

$ psql -U [username];

2. For example, the following command uses the postgres user to access the PostgreSQL database server:
$ psql -U postgres

3. Connect to a specific database:
$ \c database_name;

4. For example, the following command connects to the dvdrental database:
$ \c dvdrental;

You are now connected to database "dvdrental" as user "postgres".

5. To quit the psql:
$ \q

6. List all databases in the PostgreSQL database server
$ \l

7. List all schemas:
$ \dn

8. List all stored procedures and functions:
$ \df

9. List all views:
$ \dv

10. Lists all tables in a current database.
$ \dt

11. Or to get more information on tables in the current database:
$ \dt+

12. Get detailed information on a table.
$ \d+ table_name

13. Show a stored procedure or function code:
$ \df+ function_name

14. Show query output in the pretty-format:
$ \x

15. List all users:
$ \du

16. Create a new role:
$ CREATE ROLE role_name;

17. Create a new role with a username and password:
$ CREATE ROLE username NOINHERIT LOGIN PASSWORD password;

18. Change role for the current session to the new_role:
$ SET ROLE new_role;

19. Allow role_1 to set its role as role_2:
$ GRANT role_2 TO role_1;

## Managing databases

20. Create a new database:

$ CREATE DATABASE [IF NOT EXISTS] db_name;

21. Delete a database permanently:

$ DROP DATABASE [IF EXISTS] db_name;

## Managing tables

22. Create a new table or a temporary table

$ CREATE [TEMP] TABLE [IF NOT EXISTS] table_name(
   pk SERIAL PRIMARY KEY,
   c1 type(size) NOT NULL,
   c2 type(size) NULL,
   ...
);

23. Add a new column to a table:

$ ALTER TABLE table_name ADD COLUMN new_column_name TYPE;

24. Drop a column in a table:

$ ALTER TABLE table_name DROP COLUMN column_name;

25. Rename a column:

$ ALTER TABLE table_name RENAME column_name TO new_column_name;

26. Set or remove a default value for a column:

$ ALTER TABLE table_name ALTER COLUMN [SET DEFAULT value | DROP DEFAULT]

27. Add a primary key to a table.

$ ALTER TABLE table_name ADD PRIMARY KEY (column,...);

28. Remove the primary key from a table.

$ ALTER TABLE table_name
$ DROP CONSTRAINT primary_key_constraint_name;

29. Rename a table.

$ ALTER TABLE table_name RENAME TO new_table_name;

30. Drop a table and its dependent objects:

$ DROP TABLE [IF EXISTS] table_name CASCADE;

## Managing views

31. Create a view:

$ CREATE OR REPLACE view_name AS
query;

32. Create a recursive view:

$ CREATE RECURSIVE VIEW view_name(column_list) AS
SELECT column_list;

33. Create a materialized view:

$ CREATE MATERIALIZED VIEW view_name
AS
query
WITH [NO] DATA;

34. Refresh a materialized view:

$ REFRESH MATERIALIZED VIEW CONCURRENTLY view_name;

35. Drop a view:

$ DROP VIEW [ IF EXISTS ] view_name;

36. Drop a materialized view:

$ DROP MATERIALIZED VIEW view_name;

37. Rename a view:

$ ALTER VIEW view_name RENAME TO new_name;

## Managing indexes

38. Creating an index with the specified name on a table

$ CREATE [UNIQUE] INDEX index_name
ON table (column,...)

39. Removing a specified index from a table

$ DROP INDEX index_name;

## Querying data from tables

40. Query all data from a table:

$ SELECT * FROM table_name;

41. Query data from specified columns of all rows in a table:

$ SELECT column_list
FROM table;

42. Query data and select only unique rows:

$ SELECT DISTINCT (column)
FROM table;

43. Query data from a table with a filter:

$ SELECT *
FROM table
WHERE condition;

44. Assign an alias to a column in the result set:

$ SELECT column_1 AS new_column_1, ...
FROM table;

45. Query data using the LIKE operator:

$ SELECT * FROM table_name
WHERE column LIKE '%value%'

46. Query data using the BETWEEN operator:

$ SELECT * FROM table_name
WHERE column BETWEEN low AND high;

47. Query data using the IN operator:

$ SELECT * FROM table_name
WHERE column IN (value1, value2,...);

48. Constrain the returned rows with the LIMIT clause:

$ SELECT * FROM table_name
LIMIT limit OFFSET offset
ORDER BY column_name;

49. Query data from multiple using the inner join, left join, full outer join, cross join and natural join:

$ SELECT *
FROM table1
INNER JOIN table2 ON conditions

$ SELECT *
FROM table1
LEFT JOIN table2 ON conditions

$ SELECT *
FROM table1
FULL OUTER JOIN table2 ON conditions

$ SELECT *
FROM table1
CROSS JOIN table2;

$ SELECT *
FROM table1
NATURAL JOIN table2;

50. Return the number of rows of a table.

$ SELECT COUNT (*)
FROM table_name;

51. Sort rows in ascending or descending order:

$ SELECT select_list
FROM table
ORDER BY column ASC [DESC], column2 ASC [DESC],...;

52. Group rows using GROUP BY clause.

$ SELECT *
FROM table
GROUP BY column_1, column_2, ...;

53. Filter groups using the HAVING clause.

$ SELECT *
FROM table
GROUP BY column_1
HAVING condition;

## Set operations

54. Combine the result set of two or more queries with UNION operator:

$ SELECT * FROM table1
UNION
SELECT * FROM table2;

55. Minus a result set using EXCEPT operator:

$ SELECT * FROM table1
EXCEPT
SELECT * FROM table2;

56. Get intersection of the result sets of two queries:

$ SELECT * FROM table1
INTERSECT
SELECT * FROM table2;

## Modifying data

57. Insert a new row into a table:

$ INSERT INTO table(column1,column2,...)
VALUES(value_1,value_2,...);

58. Insert multiple rows into a table:

$ INSERT INTO table_name(column1,column2,...)
VALUES(value_1,value_2,...),
      (value_1,value_2,...),
      (value_1,value_2,...)...

59. Update data for all rows:

$ UPDATE table_name
SET column_1 = value_1,
    ...;

60. Update data for a set of rows specified by a condition in the WHERE clause.

$ UPDATE table
SET column_1 = value_1,
    ...
WHERE condition;

61. Delete all rows of a table:

$ DELETE FROM table_name;

62. Delete specific rows based on a condition:

$ DELETE FROM table_name
WHERE condition;

## Performance

63. Show the query plan for a query:

$ EXPLAIN query;

64. Show and execute the query plan for a query:

$ EXPLAIN ANALYZE query;

65. Collect statistics:

$ ANALYZE table_name;
