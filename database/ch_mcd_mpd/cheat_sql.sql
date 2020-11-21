// mySQL

> create table adress (
  id int not null primary key auto_increment,
  numero int default 0,
  avenue varchar(200),
  rue varchar(200),
  code_postal int default 5100 check (code_postal between 0 and 9999),
  ville varchar(50) check (ville in ('Mahdia','Sousse','Tunis','Beja','Sfax','Mounastir'))
) DEFAULT CHARACTER SET utf8 ENGINE=InnoDB;



// Create Database
> CREATE DATABASE my_database;

// Create Table Basic Form
> CREATE TABLE ma_table(
	column_name_1 column_type_1 column_detail_1,
	column_name_2 column_type_2 column_detail_2
) DEFAULT CHARACTER SET charset ENGINE=InnoDB;



// Show all tables of a Database
> SHOW TABLES;


// SHOW Table Structure
> DESCRIBE table_name;

// Insert data into table_name
> INSERT INTO table_name SET column_name_1 = Value_1,
							 column_name_2 = Value_2,
							 column_name_3 = Value_3,
							 ...

> INSERT INTO table_name VALUES (Value_1, Value_2, Value_3,...);
> INSERT INTO table_name (column_name_1, column_name_2, column_name_3,...)
				   VALUES(Value_1, Value_2, Value_3,...);


// Projection
> SELECT * FROM table_name;
> SELECT column_name_1, column_name_x, column_name_y FROM table_name;
> SELECT LEFT(column_name_x,20) FROM table_name;
> SELECT RIGHT(column_name_x,20) FROM table_name;


SELECT COUNT(*)  FROM table_name;


// Modifying Stored Data
> UPDATE table_name SET
	column_name_1 = Value_1,
	column_name_x = Value_x 
	WHERE predicats ;   (Condition)


// DEleting From Table
> DELETE FROM table_name where predicats;



// Operators

  > 	greter then
  < 	less then
  = 	equql
  != 	not equal
  >= 	greter or equal then
  <= 	less or equql then
  OR 	logical or
  AND 	logical AND

  LIKE 	like s%tr%
  IS 	NULL return true if the column value is Null
  IS 	NOT NULL return true if the column value is not Null
  <=> 	operator that compare 2 values even for two null values
  IN 	Operator return true if a value belong to tuple



// Ordering

> SELECT * FROM table_name WHERE predicates OREDER BY column_name ASC | DESC;


// Left Join

> SELECT ALIAS_1.column_name_1, ALIAS_2.column_name_2, ... 
  FROM table_name_1 ALIAS_1
  LEFT JOIN table_name_2 ALIAS_2
  ON ALIAS_1.col = ALIAS_2.col
  WHERE predicats
  ORDER BY creteria ASC | DESC;


// Dropping, Adding or Repositionning Column 
> ALTER TABLE table_name DROP column_name

> ALTER TABLE table_name MODIFY column type;  (change type)
> ALTER TEBLE table_name CHANGE column_origin column_target ;

> ALTER TABLE table_name TYPE= MYISAM;

> ALTER TABLE table_name_origin RENAME TO table_name_target



// Simple and Uniaue Index
> CREATE UNIQUE INDEX index_name
  ON table_name  (column_name_1,column_name_2, :::);


// ALTER Command  to add and drop  INDEX:
> ALTER TABLE table_name ADD PRIMARY KEY (column-list);
> ALTER TABLE table_name ADD UNIQUE index_name (column-list);
> ALTER TABLE table_name ADD INDEX index_name (column-list);
> ALTER TABLE table_name ADD FULLTEXT index_name (column-list);


// ALTER Command to add drop PRIMARY KEY
> ALTER TABLE table_name MODIFY column_name INT NOT NULL;
> ALTER TABLE table_name ADD PRIMARY KEY;


// Shoy Index from table
> SHOW INDEX FROM table_name\G 


// Clone Table
> SHOW CREATE TABLE table_name\G
> SHOW CREATE TABLE table_name;

// Getting Server Metadata
> SELECT VERSION()
> SELECT DATABASE()
> SELECT USER()
> SHOW STATUS
> SHOW VARIABLES

// Countin and identifying duplicate

> SELECT COUNT(*) AS repetition, column_1, column_2
  FROM table_name
  GROUP BY column_1, column_2
  HAVING repetition > 1;

> SELECT DISTINCT column_1, column_2 FROM table_name;


// Exporting Tables
> SELECT * FROM table_name INTO OUTFILE 'path/file.txt';


