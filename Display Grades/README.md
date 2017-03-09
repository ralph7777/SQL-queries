# GradeinSection

This program does Java programming with Oracle JDBC.


## Grading.sql

The script in SQLDeveloper creates the GRADING table, which records SectionIDs, StudentIDs, 

and the Grades earned by those students in those course sections.


## GradeinSection.java

The Java program makes a connection to the database server, use a dialog box to prompt

the user to enter a five-digit SectionID, issue an appropriate query to the database, 

and compute and display the number of occurrences of each letter grade in the set 

{A, B, C, D, F} and the total number of grades for the requested section.  

For example:

Section 33333:
--------------
A’s:    2
B’s:	0
C’s:	1
D’s:	1
F’s:	0
Total grades: 4




