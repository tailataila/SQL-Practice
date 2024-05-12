### SQL Basics

**SQL** - structured query language = standartized language for interacting with RDBMS.

**DB** - collection of related information.

**DBMS** - database management system.

**Primary key** - unique identifier for each record/row in a table. Must contain unique valies. Can't contain NULL values.

**Foreign key** - link data in the table to the data in another table = a field in one table that refers to the primary key in another table.


### Normalization

**Database normalization** is the process of structuring a relational database in order to reduce data redundancy and improve data integrity (in accordance with a series of so-called normal forms).

**Database denormalization** is a strategy of increasing read performance of a normalized database at the expense of losing some write performance, by adding redundant copies of data or by grouping data.

**Normal Forms**
**_First normal form:_** any column or attribute need to have a single value.

**_Second normal form:_** any column that is not the primary key needs to depend on the primary key.

**_Third normal form:_** avoid transitive dependancies - any column that is not the primary key is only dependent on the primary key.


### Index

**Indexes** rae used by queries to find data from table quickly. Similar to an index in a book.
Data structure that improves the speed of data retrieval operations on a database table at the cost of additional writes and storage space.

```sql
CREATE Index IX_tblEmployee_Salary
ON tblEmployee (SALARY ASC)
```
