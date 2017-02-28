-- Define JOB and CONTRACT tables, also populates the JOB table

DROP TABLE CONTRACT CASCADE CONSTRAINTS;
DROP TABLE JOB CASCADE CONSTRAINTS;

CREATE TABLE JOB
(
 JobID 		CHAR(3),
 Title			VARCHAR2(20),
 ContractCount	NUMBER(1,0) DEFAULT 0,

 CONSTRAINT PK_JOB 
		PRIMARY KEY (JobID)
);

CREATE TABLE CONTRACT
(
 JobID			CHAR(3),
 WorkerID		CHAR(7),
 Payment		NUMBER(6,2),

 CONSTRAINT PK_CONTRACT 
		PRIMARY KEY (JobID, WorkerID),

 CONSTRAINT FK_CONTRACT_JOB 
		FOREIGN KEY (JobID)
		REFERENCES JOB (JobID)
);
 
INSERT INTO JOB (JobID, Title) VALUES ( '100', 'Security' );
INSERT INTO JOB (JobID, Title) VALUES ( '299', 'Infrastructure' );
INSERT INTO JOB (JobID, Title) VALUES ( '757', 'Compliance' );
SELECT * FROM JOB;
COMMIT;

-- Trigger

-- 1. NewContract： 
-- If ContractCount is less than 4, INSERT and increase ContractCount by 1.
-- If ContractCount is equal to 4, cancel the INSERT and display an error message.

CREATE OR REPLACE TRIGGER NewContract
    BEFORE INSERT ON CONTRACT
FOR EACH ROW

DECLARE
    ctrCount JOB.ContractCount%type;
BEGIN
    SELECT ContractCount
    INTO ctrCount
    FROM JOB
    WHERE JobID = :new.JobID;
    
    IF (ctrCount<4) THEN
        UPDATE JOB
        SET ContractCount=ContractCount+1
        WHERE JobID = :new.JobID;
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'The job is full');
    END IF;
END;
/

-- 2. EndContract：
-- when DELETE rows from CONTRACT, update the values of ContractCount from a job.

CREATE OR REPLACE TRIGGER EndContract
    AFTER DELETE ON CONTRACT
FOR EACH ROW

DECLARE
    ctrCount JOB.ContractCount%type;
BEGIN
    IF (ctrCount=0) THEN
        RAISE_APPLICATION_ERROR(-20001, 'wrong deletion');
    ELSE
        UPDATE JOB
        SET ContractCount=ContractCount-1
        WHERE JobID = :old.JobID;
    END IF;
END;
/

-- 3. NoChanges:
-- cancel the UPDATE on one or more rows of CONTRACT and display an error message.

CREATE OR REPLACE TRIGGER NoChanges
    BEFORE UPDATE ON CONTRACT
FOR EACH ROW

BEGIN
    RAISE_APPLICATION_ERROR(-20001, 'No updates are permitted to existing rows of CONTRACT');
END;
/


/*Test:

INSERT INTO CONTRACT VALUES ('100','1234567','800');
INSERT INTO CONTRACT VALUES ('100','1234566','800');
INSERT INTO CONTRACT VALUES ('100','1234565','800');
INSERT INTO CONTRACT VALUES ('100','1234564','800');
INSERT INTO CONTRACT VALUES ('100','1234563','800');

DELETE FROM CONTRACT WHERE PAYMENT=800;
UPDATE CONTRACT SET PAYMENT=900 WHERE WorkerID='1234567';

 */
