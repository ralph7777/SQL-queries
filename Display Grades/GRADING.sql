DROP TABLE GRADING CASCADE CONSTRAINTS;
CREATE TABLE GRADING
(
 SectionID	CHAR(5),
 StudentID	CHAR(7),
 Grade		CHAR(1),
 PRIMARY KEY (SectionID, StudentID)
);
INSERT INTO GRADING VALUES ('11111', '1234567', 'A');
INSERT INTO GRADING VALUES ('22222', '1234567', 'C');
INSERT INTO GRADING VALUES ('33333', '1234567', 'A');
INSERT INTO GRADING VALUES ('55555', '1234567', 'C');
INSERT INTO GRADING VALUES ('66666', '1234567', 'B');
INSERT INTO GRADING VALUES ('11111', '2345678', 'B');
INSERT INTO GRADING VALUES ('22222', '2345678', 'B');
INSERT INTO GRADING VALUES ('33333', '2345678', 'D');
INSERT INTO GRADING VALUES ('44444', '2345678', 'C');
INSERT INTO GRADING VALUES ('11111', '3456789', 'A');
INSERT INTO GRADING VALUES ('33333', '3456789', 'A');
INSERT INTO GRADING VALUES ('55555', '3456789', 'C');
INSERT INTO GRADING VALUES ('66666', '3456789', 'D');
INSERT INTO GRADING VALUES ('22222', '4567890', 'A');
INSERT INTO GRADING VALUES ('11111', '5678901', 'C');
INSERT INTO GRADING VALUES ('22222', '5678901', 'B');
INSERT INTO GRADING VALUES ('44444', '6789012', 'A');
INSERT INTO GRADING VALUES ('55555', '6789012', 'B');
INSERT INTO GRADING VALUES ('66666', '6789012', 'A');
INSERT INTO GRADING VALUES ('22222', '7890123', 'B');
INSERT INTO GRADING VALUES ('33333', '7890123', 'C');
INSERT INTO GRADING VALUES ('66666', '7890123', 'F');
INSERT INTO GRADING VALUES ('22222', '8901234', 'F');
SELECT * FROM GRADING;
COMMIT;
