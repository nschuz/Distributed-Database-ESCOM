/* 
Before you write the SQL join statement, first choose the columns you want to include in the result. 
Next, determine the tables to which the columns belong. Then, identify the common columns 
between the tables. 
Last, determine if there is a one-to-one or a one-to-many relationship among the column values. 
Joins are typically used to join between the primary key and the foreign key. In the previous 
example, the COURSE_NO column in the COURSE table is the primary key, and the column 
COURSE_NO in the SECTION table is the foreign key. This represents a one-to-many relationship 
between the tables. (When you join tables related through a many-to-many relationship, it yields a 
Cartesian product. There is more on the Cartesian product later in this chapter.)


SELECT course.course_no, section_no, description, 
 location, instructor_id 
 FROM course, section 
 WHERE course.course_no = section.course_no 
 
The WHERE clause formulates the join criteria, also called the join condition, between the two 
tables using the common COURSE_NO column. Since this is an equijoin, the values in the common 
columns must equal each other for a row to be displayed in the result set. Each COURSE_NO value 
from the COURSE table must match a COURSE_NO value from the SECTION table. To differentiate 
between columns of the same name, qualify the columns by prefixing the column with the table 
name and a period. Otherwise, Oracle returns an error— "ORA-00918: column ambiguously 
defined."



*/