-- To create source table
CREATE TABLE Source_EMP (
                            EMP_ID INT,
                            First_Name VARCHAR(50),
                            Last_Name VARCHAR(50),
                            Designation VARCHAR(50)
);

-- To create target table
CREATE TABLE Target_EMP (
                            EMP_ID INT,
                            First_Name VARCHAR(50),
                            Last_Name VARCHAR(50),
                            Designation VARCHAR(50),
                            Start_Date DATETIME,
                            End_Date DATETIME
);

-- Check data in Source and Target table
SELECT * FROM Source_EMP;
SELECT * FROM Target_EMP;

-- Insert data into source table
INSERT INTO Source_EMP (EMP_ID, First_Name, Last_Name, Designation)
VALUES (101, 'Aman', 'Patil', 'Software Test Engineer');

INSERT INTO Source_EMP (EMP_ID, First_Name, Last_Name, Designation)
VALUES (102, 'Sara', 'Rathod', 'Trainee Engineer');

INSERT INTO Source_EMP (EMP_ID, First_Name, Last_Name, Designation)
VALUES (103, 'Rohit', 'Joshi', 'Project Manager');

INSERT INTO Source_EMP (EMP_ID, First_Name, Last_Name, Designation)
VALUES (104, 'Pooja', 'Smith', 'Software Engineer');

-- Check data in Source and Target table
SELECT * FROM Source_EMP;
SELECT * FROM Target_EMP;

-- Update data in source table
UPDATE Source_EMP
SET Designation = 'Sr.Software Test Engineer'
WHERE EMP_ID = 101;

-- Check data in Source and Target table
SELECT * FROM Source_EMP;
SELECT * FROM Target_EMP;

-- Update data in source table
UPDATE Source_EMP
SET Last_Name = 'Sonawane'
WHERE EMP_ID = 102;

-- Check data in Source and Target table
SELECT * FROM Source_EMP;
SELECT * FROM Target_EMP;
