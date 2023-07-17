CREATE TABLE Jobseekers(
    JobseekerID varchar(10) NOT NULL,
    JobseekerName varchar(20),
    JobseekerGender varchar(10),
    JobseekerMail varchar(50),
    JobseekerPhone varchar(20),
    JobseekerAddress varchar(200),
    JobseekerSkills varchar(200),
    JobseekerExperience varchar(200),
    JobseekerHighEdu varchar(200),
    PRIMARY KEY (JobseekerID),
    CHECK (JobseekerID LIKE('JS-00%')),
    CHECK (JobseekerGender IN('Male','Female'))
);

SELECT * FROM Jobseekers;

CREATE TABLE Companies(
    CompanyID varchar(10) NOT NULL,
    CompanyName varchar(20),
    CompanyAddress varchar(255),
    CompanyPhone varchar(50),
    CompanyEmail varchar(20),
    CompanyWebsite varchar(200),
    PRIMARY KEY (CompanyID),
    CHECK (CompanyID LIKE('C-00%'))
);

SELECT * FROM Companies;

CREATE TABLE StaffType(
    StaffTypeID varchar(10) NOT NULL,
    StaffType varchar(20),
    PRIMARY KEY (StaffTypeID),
    CHECK (StaffTypeID LIKE('ST-00%'))
);

SELECT * FROM StaffType;

CREATE TABLE JobLocation(
	JobLocationID varchar(10) NOT NULL,
	RegionState varchar(20),
	country varchar(20),
	PRIMARY KEY (JobLocationID),
	CHECK (JobLocationID LIKE('JL-00%'))
);

SELECT * FROM JobLocation;

CREATE TABLE JobCategory(
	JobCategoryID varchar(10) NOT NULL,
	JobCategoryName varchar(50),
	PRIMARY KEY (JobCategoryID),
	CHECK (JobCategoryID LIKE('JC-00%'))
);

SELECT * FROM JobCategory;

CREATE TABLE Staff(
	StaffID varchar(10) NOT NULL,
	StaffName varchar(50),
	StaffAddress varchar(200),
	StaffPhone varchar(20),
	StaffMail varchar(50),
	StaffTypeID varchar(10),
	PRIMARY KEY (StaffID),
	CHECK (StaffID LIKE('S-00%')),
	CHECK (StaffTypeID LIKE('ST-00%')),
	FOREIGN KEY (StaffTypeID) REFERENCES StaffType (StaffTypeID)
	ON DELETE NO ACTION
	ON UPDATE CASCADE
);

SELECT * FROM Staff;

CREATE TABLE Job(
	JobID varchar(10) NOT NULL,
	JobTitle varchar(100),
	JobCategoryID varchar(10),
	JobLocationID varchar(10),
	CompanyID varchar(10),
	JobPosition varchar(50),
	JobDescription text,
	JobRequirements text,
	JobSalary decimal,
	NoOfVacancy int,
	StaffID varchar(10),
	PRIMARY KEY (JobID),
	CHECK (JobID LIKE('JB-00%')),
	CHECK (JobCategoryID LIKE('JC-00%')),
	CHECK (JobLocationID LIKE('JL-00%')),
	CHECK (StaffID LIKE ('S-00%')),
	FOREIGN KEY (JobCategoryID) REFERENCES JobCategory(JobCategoryID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,
	FOREIGN KEY (JobLocationID) REFERENCES JobLocation(JobLocationID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,
	FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,
	FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
);

SELECT * FROM Job;

CREATE TABLE Interviews (
	InterviewID varchar(10),
	JobID varchar(10),
	JobseekerID varchar (10),
	InterviewDate date,
	InterviewTime time,
	InterviewLocation varchar (100),
	InterviewrName varchar (50),
	TotalInterviewRound int,
	PRIMARY KEY (InterviewID),
	CHECK (InterviewID LIKE('ITR-00%')),
	CHECK (JobID LIKE('JB-00%')),
	CHECK (JobseekerID LIKE('JS-00%')),
	FOREIGN KEY (JobID) REFERENCES Job(JobID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,
	FOREIGN KEY (JobseekerID) REFERENCES Jobseekers(JobseekerID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
);

SELECT * FROM Interviews;

CREATE TABLE Results (
	ResultID varchar(10),
	InterviewID varchar(10),
	Result varchar (20),
	InterviewRound varchar (20),
	Reasons text,
	PRIMARY KEY (ResultID),S
	CHECK (ResultID LIKE('RE-00%')),
	CHECK (InterviewID LIKE('ITR-00%')),
	FOREIGN KEY (InterviewID) REFERENCES Interviews(InterviewID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
);

SELECT * FROM Results;

CREATE TABLE Payment (
	PaymentID varchar(10),
	PaymentDate date,
	MonthlyFees decimal(10,2),
	JobID varchar (10),
	PRIMARY KEY (PaymentID),
	CHECK (PaymentID LIKE('P-00%')),
	CHECK (JobID LIKE('JB-00%')),
	FOREIGN KEY (JobID) REFERENCES Job(JobID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
);

DROP TABLE Payment;

SELECT * FROM Payment;

CREATE TABLE ApplicationDetails (
	JobseekerID varchar(10),
	JobID varchar(10),
	PRIMARY KEY (JobseekerID, JobID),
	CHECK (JobseekerID LIKE('JS-00%')),
	CHECK (JobID LIKE('JB-00%')),
	FOREIGN KEY (JobseekerID) REFERENCES Jobseekers(JobseekerID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,
	FOREIGN KEY (JobID) REFERENCES Job(JobID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,
);

SELECT * FROM ApplicationDetails;



INSERT INTO Jobseekers (JobseekerID, JobseekerName, JobseekerGender, JobseekerMail, JobseekerPhone, JobseekerAddress, JobseekerSkills, JobseekerExperience, JobseekerHighEdu)
VALUES
    ('JS-001', 'John Smith', 'Male', 'john@example.com', '123-456-7890', '123 Main St, Yangon', 'Java, SQL, Python', '5 years', 'Bachelor degree'),
    ('JS-002', 'Jane Doe', 'Female', 'jane@example.com', '123-456-7891', '456 Main St, Mandalay', 'C++, C#, Ruby', '3 years', 'Master degree'),
    ('JS-003', 'Bob Johnson', 'Male', 'bob@example.com', '123-456-7892', '789 Main St, Yangon', 'JavaScript, PHP, Swift', '2 years', 'Associate degree'),
    ('JS-004', 'Alice Williams', 'Female', 'alice@example.com', '123-456-7893', '321 Main St, Yangon', 'C, C++, Python', '1 year', 'Bachelor degree'),
    ('JS-005', 'Mike Brown', 'Male', 'mike@example.com', '123-456-7894', '654 Main St, Yangon', 'Java, C#, Ruby', '4 years', 'Master degree'),
    ('JS-006', 'Samantha Davis', 'Female', 'samantha@example.com', '123-456-7895', '246 Main St, Mon', 'JavaScript, PHP, Swift', '3 years', 'Bachelor degree'),
    ('JS-007', 'William Thompson', 'Male', 'william@example.com', '123-456-7896', '135 Main St, Mon', 'C, C++, Python', '2 years', 'Associate degree'),
    ('JS-008', 'Ashley Johnson', 'Female', 'ashley@example.com', '123-456-7897', '753 Main St, Mon', 'Java, SQL, Ruby', '1 year', 'Bachelor degree'),
    ('JS-009', 'David Anderson', 'Male', 'david@example.com', '123-456-7898', '159 Main St, Mon', 'JavaScript, PHP, Swift', '5 years', 'Master degree'),
    ('JS-0010', 'Jessica Taylor', 'Female', 'jessica@example.com', '123-456-7899', '357 Main St, Rakhine', 'C, C++, Python', '4 years', 'Bachelor degree');

	select * from Jobseekers order by JobseekerID;

INSERT INTO Jobseekers (JobseekerID, JobseekerName, JobseekerGender, JobseekerMail, JobseekerPhone, JobseekerAddress, JobseekerSkills, JobseekerExperience, JobseekerHighEdu)
VALUES
    ('JS-0011', 'Jessica Men', 'Male', 'jessica@example.com', '123-456-7899', '357 Main St, Rakhine', 'C, C++, Python', '4 years', 'Bachelor degree');

INSERT INTO Companies (CompanyID, CompanyName, CompanyAddress, CompanyPhone, CompanyEmail, CompanyWebsite)
VALUES
    ('C-001', 'Acme Inc', '123 Main St, Yangon', '123-456-7890', 'info@acmeinc.com', 'www.acmeinc.com'),
    ('C-002', 'XYZ Corp', '456 Main St, Yangon', '123-456-7891', 'info@xyzcorp.com', 'www.xyzcorp.com'),
    ('C-003', 'ABC Inc', '789 Main St, Yangon', '123-456-7892', 'info@abcinc.com', 'www.abcinc.com'),
    ('C-004', 'Def Co', '321 Main St, Yangon', '123-456-7893', 'info@defco.com', 'www.defco.com'),
    ('C-005', 'GHI Inc', '654 Main St, Yangon', '123-456-7894', 'info@ghiinc.com', 'www.ghiinc.com'),
    ('C-006', 'JKL Corp', '246 Main St, Yangon', '123-456-7895', 'info@jklcorp.com', 'www.jklcorp.com'),
    ('C-007', 'MNO Inc', '135 Main St, Yangon', '123-456-7896', 'info@mnoinc.com', 'www.mnoinc.com'),
    ('C-008', 'PQR Co', '753 Main St, Yangon', '123-456-7897', 'info@pqrco.com', 'www.pqrco.com'),
    ('C-009', 'STU Inc', '159 Main St, Yangon', '123-456-7898', 'info@stuinc.com', 'www.stuinc.com'),
    ('C-0010', 'VWX Corp', '357 Main St, Yangon', '123-456-7899', 'info@vwxcorp.com', 'www.vwxcorp.com');

	select * from Companies;

INSERT INTO JobLocation (JobLocationID, RegionState, Country)
VALUES
    ('JL-001', 'Yangon', 'Myanmar'),
    ('JL-002', 'Mandalay', 'Myanmar'),
    ('JL-003', 'Bago', 'Myanmar'),
    ('JL-004', 'Rakhine', 'Myanmar'),
    ('JL-005', 'Chin', 'Myanmar'),
    ('JL-006', 'Mon', 'Myanmar'),
    ('JL-007', 'Singapore', 'Singapore'),
    ('JL-008', 'Bongok', 'Thailand'),
    ('JL-009', 'Ka Chin', 'Myanmar'),
    ('JL-0010', 'Shan', 'Myanmar');

	select * from JobLocation;

INSERT INTO JobCategory (JobCategoryID, JobCategoryName)
VALUES
    ('JC-001', 'Software Development'),
    ('JC-002', 'Data Science'),
    ('JC-003', 'Accounting'),
    ('JC-004', 'Marketing'),
    ('JC-005', 'Sales'),
    ('JC-006', 'Human Resources'),
    ('JC-007', 'Customer Service'),
    ('JC-008', 'Education'),
    ('JC-009', 'Healthcare'),
    ('JC-0010', 'Creative Design');

	select * from JobCategory;

INSERT INTO StaffType (StaffTypeID, StaffType)
VALUES
    ('ST-001', 'Full_time'),
    ('ST-002', 'Part-time'),
    ('ST-003', 'Contract'),
    ('ST-004', 'Temporary'),
    ('ST-005', 'Intern'),
    ('ST-006', 'Volunteer'),
    ('ST-007', 'Seasonal'),
    ('ST-008', 'Freelance'),
    ('ST-009', 'Consultant'),
    ('ST-0010', 'Admin');

	select * from StaffType;

INSERT INTO Staff (StaffID, StaffName, StaffAddress, StaffPhone, StaffMail, StaffTypeID)
VALUES
    ('S-001', 'John Smith', '123 Main St, Yangon', '123-456-7890', 'john.smith@example.com', 'ST-0010'),
    ('S-002', 'Jane Doe', '456 Main St, Yangon', '123-456-7891', 'jane.doe@example.com', 'ST-0010'),
    ('S-003', 'Bob Johnson', '789 Main St, Yangon', '123-456-7892', 'bob.johnson@example.com', 'ST-001'),
    ('S-004', 'Sally Smith', '321 Main St, Yangon', '123-456-7893', 'sally.smith@example.com', 'ST-009'),
    ('S-005', 'Tom Jones', '654 Main St, Yangon', '123-456-7894', 'tom.jones@example.com', 'ST-008'),
    ('S-006', 'Lisa Williams', '246 Main St, Yangon', '123-456-7895', 'lisa.williams@example.com', 'ST-007'),
    ('S-007', 'Mike Brown', '135 Main St, Yangon', '123-456-7896', 'mike.brown@example.com', 'ST-006'),
    ('S-008', 'Emily Davis', '753 Main St, Yangon', '123-456-7897', 'emily.davis@example.com', 'ST-005'),
    ('S-009', 'David Anderson', '159 Main St, Yangon', '123-456-7898', 'david.anderson@example.com', 'ST-004'),
    ('S-0010', 'Mary Thompson', '357 Main St, Yangon', '123-456-7899', 'mary.thompson@example.com', 'ST-003');

	select * from Staff;

INSERT INTO Job (JobID, JobTitle, JobCategoryID, JobLocationID, CompanyID, JobPosition, JobDescription, JobRequirements, JobSalary, NoOfVacancy, StaffID)
VALUES
    ('JB-001', 'Software Developer', 'JC-001', 'JL-001', 'C-001', 'Full-time', 'We are seeking a skilled software developer to join our team. The ideal candidate will have experience with Java and Python and a strong understanding of computer science concepts.', 'Bachelor degree in computer science or related field. 3+ years of experience as a software developer. Proficiency in Java and Python.', 65000, 1, 'S-001'),
    ('JB-002', 'Data Scientist', 'JC-002', 'JL-001', 'C-001', 'Full-time', 'We are seeking a talented data scientist to join our team. The ideal candidate will have experience with machine learning and data analysis and a strong understanding of statistical concepts.', 'Master degree in data science or related field. 3+ years of experience as a data scientist. Proficiency in Python and R.', 75000, 1, 'S-002'),
    ('JB-003', 'Accountant', 'JC-003', 'JL-002', 'C-001', 'Full-time', 'We are seeking a qualified accountant to join our team. The ideal candidate will have experience with financial analysis and a strong understanding of accounting principles.', 'Bachelor degree in accounting or related field. 3+ years of experience as an accountant. Proficiency with QuickBooks.', 55000, 1, 'S-001'),
    ('JB-004', 'Marketing Manager', 'JC-004', 'JL-002', 'C-001','Full-time', 'We are seeking a creative and experienced marketing manager to join our team. The ideal candidate will have experience with digital marketing and a strong understanding of branding and marketing strategy.', 'Bachelor degree in marketing or related field. 3+ years of experience as a marketing manager. Proficiency with Adobe Creative Suite.', 65000, 1, 'S-002'),
    ('JB-005', 'Sales Representative', 'JC-005', 'JL-003', 'C-001', 'Full-time', 'We are seeking an experienced sales representative to join our team. The ideal candidate will have a proven track record of meeting sales targets and a strong understanding of the sales process.', 'Bachelor degree in business or related field. 3+ years of experience as a sales representative. Excellent communication skills.', 55000, 1, 'S-001'),
    ('JB-006', 'Human Resources Manager', 'JC-006', 'JL-003', 'C-001', 'Full-time', 'We are seeking an experienced human resources manager to join our team. The ideal candidate will have a strong understanding of employment laws and HR best practices.', 'Bachelor degree in human resources or related field. 3+ years of experience as an HR manager. PHR certification.', 65000, 1, 'S-001'),
    ('JB-007', 'Customer Service Representative', 'JC-007', 'JL-004', 'C-001', 'Full-time', 'We are seeking a customer service representative to join our team. The ideal candidate will have excellent communication skills and a strong understanding of customer service best practices.', 'High school diploma or equivalent. 3+ years of experience as a customer service representative. Excellent communication skills.', 45000, 1, 'S-001'),
    ('JB-008', 'Elementary School Teacher', 'JC-008', 'JL-004', 'C-001', 'Full-time', 'We are seeking a qualified elementary school teacher to join our team. The ideal candidate will have a teaching certification and a strong understanding of elementary education.', 'Bachelor degree in education. Teaching certification. 3+ years of experience as an elementary school teacher.', 55000, 1, 'S-001'),
    ('JB-009', 'Registered Nurse', 'JC-009', 'JL-005', 'C-001', 'Full-time', 'We are seeking a registered nurse to join our team. The ideal candidate will have a nursing license and a strong understanding of patient care.', 'Bachelor degree in nursing. Nursing license. 3+ years of experience as a registered nurse.', 65000, 1, 'S-001'),
    ('JB-0010', 'Graphic Designer', 'JC-0010', 'JL-005', 'C-001', 'Full-time', 'We are seeking a talented graphic designer to join our team. The ideal candidate will have experience with design software and a strong understanding of design principles.', 'Bachelor degree in graphic design or related field. 3+ years of experience as a graphic designer. Proficiency with Adobe Creative Suite.', 55000, 1, 'S-002');

	SELECT * FROM Job;

INSERT INTO Interviews (InterviewID, JobID, JobseekerID, InterviewDate, InterviewTime, InterviewLocation, InterviewrName, TotalInterviewRound)
VALUES
    ('ITR-001', 'JB-001', 'JS-001', '2022-01-01', '09:00:00', '123 Main St, Mon', 'John Smith', 2),
    ('ITR-002', 'JB-001', 'JS-002', '2022-01-02', '10:00:00', '123 Main St, Mandalay', 'John Smith', 2),
    ('ITR-003', 'JB-001', 'JS-003', '2022-01-03', '11:00:00', 'online', 'John Smith', 2),
    ('ITR-004', 'JB-002', 'JS-004', '2022-01-04', '09:00:00', '123 Main St, Yangon', 'Jane Doe', 3),
    ('ITR-005', 'JB-002', 'JS-005', '2022-01-05', '10:00:00', '123 Main St, Yangon', 'Jane Doe', 3),
    ('ITR-006', 'JB-002', 'JS-006', '2022-01-06', '11:00:00', 'online', 'Jane Doe', 3),
    ('ITR-007', 'JB-003', 'JS-007', '2022-01-07', '09:00:00', 'online', 'Bob Johnson', 1),
    ('ITR-008', 'JB-003', 'JS-008', '2022-01-08', '10:00:00', 'online', 'Bob Johnson', 1),
    ('ITR-009', 'JB-003', 'JS-009', '2022-01-09', '11:00:00', 'online', 'Bob Johnson', 4),
	('ITR-0010', 'JB-003', 'JS-0010', '2022-01-10', '12:00:00', 'online', 'Bob Johnson', 4);

	SELECT * FROM Interviews;

INSERT INTO Results (ResultID, InterviewID, Result, InterviewRound, Reasons)
VALUES
    ('RE-001', 'ITR-001', 'Pass', 'First Round', 'The candidate demonstrated strong problem-solving skills and a good understanding of Java and Python.'),
    ('RE-002', 'ITR-002', 'Fail', 'Second Round', 'The candidate was not able to answer basic questions about Java and Python.'),
    ('RE-003', 'ITR-003', 'Pass', 'First Round', 'The candidate demonstrated strong problem-solving skills and a good understanding of Java and Python.'),
    ('RE-004', 'ITR-004', 'Pass', 'Third Round', 'The candidate demonstrated strong analytical skills and a good understanding of machine learning and data analysis.'),
    ('RE-005', 'ITR-005', 'Fail', 'First Round', 'The candidate was not able to answer basic questions about machine learning and data analysis.'),
    ('RE-006', 'ITR-006', 'Pass', 'Second Round', 'The candidate demonstrated strong analytical skills and a good understanding of machine learning and data analysis.'),
    ('RE-007', 'ITR-007', 'Pass', 'First Round', 'The candidate demonstrated strong financial analysis skills and a good understanding of accounting principles.'),
    ('RE-008', 'ITR-008', 'Fail', 'First Round', 'The candidate was not able to answer basic questions about financial analysis and accounting principles.'),
    ('RE-009', 'ITR-009', 'Pass', 'Second Round', 'The candidate demonstrated strong financial analysis skills and a good understanding of accounting principles.'),
    ('RE-0010', 'ITR-0010', 'Pass', 'Third Round', 'The candidate demonstrated strong design skills and a good understanding of design principles.');
	
	SELECT * FROM Results;

INSERT INTO Payment (PaymentID, PaymentDate, MonthlyFees, JobID)
VALUES
    ('P-001', '2022-11-01', 10.5, 'JB-001'),
    ('P-002', '2022-11-02', 10.5, 'JB-002'),
    ('P-003', '2022-11-02', 10.5, 'JB-003'),
    ('P-004', '2022-11-03', 10.5, 'JB-004'),
    ('P-005', '2022-11-03', 10.5, 'JB-005'),
    ('P-006', '2022-11-04', 11.5, 'JB-006'),
    ('P-007', '2022-11-04', 12.5, 'JB-007'),
    ('P-008', '2022-11-05', 10.5, 'JB-008'),
    ('P-009', '2022-11-05', 11.5, 'JB-009'),
    ('P-0010', '2022-11-06', 10.5, 'JB-0010');

	SELECT * FROM Payment;

INSERT INTO Payment (PaymentID, PaymentDate, MonthlyFees, JobID)
VALUES
    ('P-0011', '2022-12-01', 10.5, 'JB-001'),
    ('P-0012', '2022-12-03', 10.5, 'JB-005'),
    ('P-0013', '2022-12-04', 11.5, 'JB-007'),
    ('P-0014', '2022-12-06', 12.5, 'JB-0010');

INSERT INTO Payment (PaymentID, PaymentDate, MonthlyFees, JobID)
VALUES
    ('P-0015', '2023-01-01', 11.8, 'JB-001');


INSERT INTO ApplicationDetails (JobseekerID, JobID)
VALUES
    ('JS-001', 'JB-001'),
    ('JS-002', 'JB-001'),
    ('JS-003', 'JB-001'),
    ('JS-004', 'JB-002'),
    ('JS-005', 'JB-002'),
    ('JS-006', 'JB-002'),
    ('JS-007', 'JB-003'),
    ('JS-008', 'JB-003'),
    ('JS-009', 'JB-003'),
    ('JS-0010', 'JB-004');


	SELECT * FROM ApplicationDetails;


UPDATE Job
SET CompanyID = 'C-002'
WHERE JobID IN ('JB-001', 'JB-004', 'JB-007', 'JB-0010');



SELECT j.JobID, j.JobTitle, j.JobDescription, jl.RegionState, jl.Country, c.JobCategoryName, co.CompanyName
FROM Job j
JOIN JobLocation jl ON j.JobLocationID = jl.JobLocationID
JOIN JobCategory c ON j.JobCategoryID = c.JobCategoryID
JOIN Companies co ON j.CompanyID = co.CompanyID;

SELECT JobseekerGender, COUNT(*) AS NumberOfJobseekers
FROM Jobseekers
GROUP BY JobseekerGender
ORDER BY NumberOfJobseekers;

SELECT c.CompanyName, COUNT(*) AS NumberOfJobs
FROM Job j
JOIN Companies c ON j.CompanyID = c.CompanyID
GROUP BY c.CompanyName
ORDER BY NumberOfJobs DESC;

SELECT js.JobseekerName, j.JobTitle, c.CompanyName
FROM ApplicationDetails a
INNER JOIN Jobseekers js ON a.JobseekerID = js.JobseekerID
INNER JOIN Job j ON a.JobID = j.JobID
INNER JOIN Companies c ON j.CompanyID = c.CompanyID


SELECT c.CompanyName, j.JobID, SUM(p.MonthlyFees) as TotalValuePaid
FROM Payment p
INNER JOIN Job j ON p.JobID = j.JobID
INNER JOIN Companies c ON j.CompanyID = c.CompanyID
GROUP BY c.CompanyName, j.JobID


SELECT c.CompanyName, j.JobID, SUM(p.MonthlyFees) as TotalValuePaid,
MIN(p.PaymentDate) as StartMonth, MAX(p.PaymentDate) as EndMonth
FROM Payment p
INNER JOIN Job j ON p.JobID = j.JobID
INNER JOIN Companies c ON j.CompanyID = c.CompanyID
WHERE p.PaymentDate BETWEEN '2022-12-01' AND '2023-01-30'
GROUP BY c.CompanyName, j.JobID;


ALTER TABLE ApplicationDetails
ADD ApplicationStatus varchar(10);

UPDATE ApplicationDetails
SET ApplicationStatus = 'Pending'

UPDATE ad
SET ad.ApplicationStatus =
    CASE
        WHEN ITR.TotalInterviewRound = 1 THEN 'Approved'
        WHEN res.Result = 'Fail' THEN 'Rejected'
        ELSE 'Pending'
    END
FROM ApplicationDetails ad
INNER JOIN Job j ON ad.JobID = j.JobID
INNER JOIN Interviews ITR ON j.JobID = ITR.JobID
INNER JOIN Results res ON ITR.InterviewID = res.InterviewID

Select * from ApplicationDetails


SELECT ad.JobID, ad.JobseekerID, ad.ApplicationStatus, ITR.InterviewID, RES.InterviewRound,
    ITR.TotalInterviewRound - (SELECT COUNT(*) FROM Interviews WHERE JobID = ad.JobID AND JobseekerID = ad.JobseekerID) AS RemainingRounds
FROM ApplicationDetails ad
INNER JOIN Interviews ITR ON ad.JobID = ITR.JobID AND ad.JobseekerID = ITR.JobseekerID
INNER JOIN Results RES ON ITR.InterviewID = RES.InterviewID
WHERE ad.ApplicationStatus = 'Pending'


SELECT JobseekerID, JobseekerName, JobseekerSkills
FROM Jobseekers
WHERE JobseekerSkills LIKE '%Java%'

SELECT j.JobID,s.StaffName, s.StaffID FROM Job j, Staff s WHERE j.StaffID=s.StaffID;

SELECT *
FROM Interviews
WHERE InterviewLocation = 'Online'

SELECT js.JobseekerName, j.JobTitle, r.InterviewID,r.InterviewRound, r.Result, i.InterviewrName
FROM Results r
INNER JOIN Interviews i ON r.InterviewID = i.InterviewID
INNER JOIN Job j ON i.JobID = j.JobID
INNER JOIN Jobseekers js ON i.JobseekerID = js.JobseekerID
WHERE r.Result = 'Fail'


