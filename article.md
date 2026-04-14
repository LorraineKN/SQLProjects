# Mastering SQL Fundamentals: From Data Definition to Data Transformation


## Introduction

Structured Query Language (SQL) is a standardized language used for managing and interacting with relational databases. It enables users to define database structures, manipulate stored data, and retrieve information efficiently. SQL plays a critical role in modern data management systems, making it an essential skill in data-related fields.

SQL commands are broadly categorized into different groups, among which **Data Definition Language (DDL)** and **Data Manipulation Language (DML)** are fundamental. This article explores these categories, demonstrates their application, and reflects on the learning experience gained through practical exercises.

---

## Data Definition Language (DDL)

Data Definition Language (DDL) refers to the set of SQL commands used to define and manage the structure of a database. These commands are concerned with creating, modifying, and deleting database objects.

Key DDL commands include:

- **CREATE**  
  This command is used to create database objects such as tables, schemas, and databases.

- **ALTER**  
  The `ALTER` command is used to modify the structure of existing database objects, such as renaming a column or changing a data type.

- **DROP**  
  This command is used to permanently remove database objects such as tables or databases.

DDL operations focus on structure rather than the data itself.

---

## Data Manipulation Language (DML)

Data Manipulation Language (DML) consists of SQL commands used to interact with and manipulate data within a database.

### INSERT  
Used to add new records into a table.

### SELECT  
Used to retrieve data from one or more tables.

```sql
SELECT * FROM table_name;
```

```sql
SELECT column_name FROM table_name;
```

### UPDATE  
Used to modify existing records.

```sql
UPDATE students
SET city = 'Nairobi'
WHERE first_name = 'Esther' AND last_name = 'Akinyi';
```

### DELETE  
Used to remove records.

```sql
DELETE FROM exam_results
WHERE result_id = 9;
```

These commands demonstrate how data within a database can be dynamically managed.

---

## Filtering Data Using the WHERE Clause

The `WHERE` clause is used to filter records based on specific conditions, allowing for precise data retrieval.

Common operators include:

- `=` (equal to)  
- `>` (greater than)  
- `BETWEEN` (range of values)  
- `IN` (multiple values)  
- `LIKE` (pattern matching)  

Examples:

```sql
SELECT * FROM students
WHERE city IN ('Nairobi', 'Mombasa', 'Kisumu');
```

```sql
SELECT * FROM exam_results
WHERE marks BETWEEN 50 AND 80;
```

```sql
SELECT * FROM students
WHERE first_name LIKE 'A%';
```

Filtering enables users to extract meaningful subsets of data from larger datasets.

---

## Data Transformation Using CASE WHEN

The `CASE WHEN` statement allows conditional logic to be applied within SQL queries, transforming raw data into meaningful categories.

```sql
SELECT 
    marks,
    CASE
        WHEN marks >= 80 THEN 'Distinction'
        WHEN marks >= 60 THEN 'Merit'
        WHEN marks >= 40 THEN 'Pass'
        ELSE 'Fail'
    END AS performance
FROM exam_results;
```

This approach is particularly useful in reporting and data analysis.

---

## Reflection

The learning experience throughout was both challenging and intellectually engaging. One of the main challenges was ensuring accuracy in SQL syntax, as even small mistakes could lead to errors. This emphasized the importance of precision when writing queries.

Despite these challenges, I found querying to be highly enjoyable. I particularly enjoyed interacting with the database and observing how different SQL commands produce meaningful outputs. I found querying both interesting and engaging, and each successful query provided a sense of accomplishment.

The `CASE WHEN` statement was especially insightful, as it demonstrated how raw data can be transformed into meaningful categories. This experience has significantly increased my interest in data manipulation and analysis, and I am motivated to continue improving my SQL skills.

---

## Conclusion

SQL provides powerful tools for defining and managing databases and manipulating data. Understanding the distinction between DDL and DML, along with filtering and transformation techniques, is essential for effective data management.

