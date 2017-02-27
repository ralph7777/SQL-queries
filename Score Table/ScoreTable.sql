-- table STUDENT and able WEIGHTS are defined and populated by the following:

DROP TABLE STUDENT CASCADE CONSTRAINTS;
CREATE TABLE STUDENT
(
	ID		CHAR(3),
	Name		VARCHAR2(20),
	Midterm	NUMBER(3,0) 	CHECK (Midterm>=0 AND Midterm<=100),
	Final		NUMBER(3,0)	CHECK (Final>=0 AND Final<=100),
	Homework	NUMBER(3,0)	CHECK (Homework>=0 AND Homework<=100),

	PRIMARY KEY (ID)
);
INSERT INTO STUDENT VALUES ( '445', 'Seinfeld', 85, 90, 99 );
INSERT INTO STUDENT VALUES ( '909', 'Costanza', 74, 72, 86 );
INSERT INTO STUDENT VALUES ( '123', 'Benes', 93, 89, 91 );
INSERT INTO STUDENT VALUES ( '111', 'Kramer', 99, 91, 93 );
INSERT INTO STUDENT VALUES ( '667', 'Newman', 78, 82, 83 );
INSERT INTO STUDENT VALUES ( '888', 'Banya', 50, 65, 50 );
SELECT * FROM STUDENT;

DROP TABLE WEIGHTS CASCADE CONSTRAINTS;
CREATE TABLE WEIGHTS
(
	MidPct	NUMBER(2,0) CHECK (MidPct>=0 AND MidPct<=100),
	FinPct	NUMBER(2,0) CHECK (FinPct>=0 AND FinPct<=100),
	HWPct		NUMBER(2,0) CHECK (HWPct>=0 AND HWPct<=100)
);
INSERT INTO WEIGHTS VALUES ( 30, 30, 40 );
SELECT * FROM WEIGHTS;
COMMIT;

-- PL/SQL block
declare
    midtermPct WEIGHTS.MidPct%type;
    finalPct WEIGHTS.FinPct%type;
    homeworkPct WEIGHTS.HWPct%type;
    
    studentScore NUMBER(4,1);
    studentGrade CHAR(1);
    
    studentInfo STUDENT%rowtype;
    cursor studentPtr is SELECT * FROM STUDENT;
    
begin
    SELECT MidPct, FinPct, HWPct
    INTO midtermPct, finalPct, homeworkPct
    FROM WEIGHTS;
    
    -- Report the three weights found in the WEIGHTS table
    DBMS_OUTPUT.PUT_LINE('Weights are '||midtermPct||', '||finalPct||', '||homeworkPct);

    -- Output the ID and name of each student, with their overall score and a letter grade(90-100=A, 80-89.99=B, 65-79.99=C, 0-64.99=F)
    for studentInfo in studentPtr
    loop 
        studentScore:= (studentInfo.Midterm*midtermPct + studentInfo.Final*finalPct + studentInfo.Homework*homeworkPct)/100;
        CASE 
        WHEN (studentScore>=90) THEN studentGrade:='A';
        WHEN (studentScore>=80) THEN studentGrade:='B';
        WHEN (studentScore>=65) THEN studentGrade:='C';
        ELSE  studentGrade:='D';
        END CASE;
        
        DBMS_OUTPUT.PUT_LINE(studentInfo.ID||' '||studentInfo.Name||' '||studentScore||' '||studentGrade);
    end loop;
end;