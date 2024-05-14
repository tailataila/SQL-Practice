### SQL Basics

**SQL** - structured query language = standardized language for interacting with RDBMS.

**DB** - collection of related information.

**DBMS** - database management system.

**Primary key** - unique identifier for each row in a table. Must contain unique values. Can't contain NULL values.

**Foreign key** - link data in the table to the data in another table = a field in one table that refers to the primary key in another table.

**Surrogate key** = type of primary key = doesn't have mapping in a real world.

**Natural key** = has mapping in a real world.

**Composite key** - consists of more than one attributes / columns.

**Entity** - an object we want to model and store information about.

**Attribute** - specific piece of information about an entity.

**Query** - a request for a particular piece of information.

**Function** - a block of code that we can call, which will do something for us.

**Wildcards** - way to define different patterns that we want to match the data to = grab data that matches specific pattern.

**Union** - SQL operator to combine multiple select statements into one.
- Rule 1 - the same number of columns
- Rule 2 - types of data should be similar

**Join** - combines rows from two or more tables based on a related column between them.
- General JOIN = Inner JOIN = combines two tables only where we have ON values in the columns.
- Left JOIN = we include all of the rows from left table.
- Right JOIN - we include all rows from right table.
- FULL OUTER JOIN - lest and right combined (not used in mySQL).

*Union* - joins vertically
*Join* - joins horizontally


### Normalization

**Database normalization** is the process of structuring a relational database in order to reduce data redundancy and improve data integrity (in accordance with a series of so-called normal forms).

**Database denormalization** is a strategy of increasing read performance of a normalized database at the expense of losing some write performance, by adding redundant copies of data or by grouping data.

**Normal Forms**
**_First normal form:_** any column or attribute need to have a single value.

**_Second normal form:_** any column that is not the primary key needs to depend on the primary key.

**_Third normal form:_** avoid transitive dependencies - any column that is not the primary key is only dependent on the primary key.


### Index

**Indexes** are used by queries to find data from a table quickly. Similar to an index in a book.
Data structure that improves the speed of data retrieval operations on a database table at the cost of additional writes and storage space.

```sql
CREATE Index IX_tblEmployee_Salary
ON tblEmployee (SALARY ASC)
```
