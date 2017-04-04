Daily Report - 4/4/2017


----------

##NoSQL and SQL

- NoSQL is a type of databases distinctly different from SQL databases. NoSQL is often used to refer to data management systems that are “Not SQL” or an approach to data management that includes “Not only SQL". NoSQL store data as key and value
- 
-  SQL is a programming language used by database architects to design relational databases. SQL store data as tables.
-  Use NoSQL when we want store a complex, big result or query, query is key and result is value. It will be faster

##Window Functions

Mysql doesn't have Window Functions.

SQL Window function performs a calculation across a set of table rows that are somehow related to the current row, in a way similar to aggregate functions

##MyISAM, Memory, InnoDB
Mysql 5.6, 5.7 Default: InnoDB
Mysql version < 5.6, Default: MyISAM

|  Feature  |  MyISAM  |    Memory | InnoDB  |
| :-------- | --------:| :-------: | :-------: |
| Storage limits|256TB|RAM|64TB|
| Transactions|No|No|Yes|
| Full-text search indexes|Yes|No|Yes|
|Foreign key support|No|No|Yes|
|MVCC|No|No|Yes|
|Locking granularity|Table|Table|Row|
|Compressed data|Yes|No|Yes|

##View in postgresql 
View SQL is a SQL statement that is stored in the database with an associated name. A view is actually a composition of a table in the form of a predefined SQL query.

EXAMPLE

```sql

CREATE VIEW [Student List] AS
SELECT ID, Name
FROM students

SELECT * FROM [Student List];

```

##Company's DBMS

Youtube's DBMS

Youtube uses MySQL as its main database management system.
They creat 4 tables:
- define the user table to store user's basic information like: email, name, registration data, profile information and so on.
- A table to store video's meta data like: title, description, size, etc.
- A table to store comments, view counts, like counts ...
- A table to associate author's video and video to creat relationship.

Youtube store video as link, use CDN(Content delivery network) to store video file's 

The biggest benefit using CDN is that CDN replicates content in multiple places so that there’s a better chance of content being closer to the user, with fewer hops, and content will run over a more friendly network

**So the Access as well as transmission will be faster.**
