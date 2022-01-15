USE EClinicalWork;
GO

IF  DB_ID('EClinicalWork') IS NOT NULL
DROP DATABASE EClinicalWork;
GO

CREATE DATABASE EClinicalWork;
GO

USE EClinicalWork;
GO

drop table Accountant
CREATE TABLE Accountant
(
	accountantId int IDENTITY (1, 1) NOT NULL,
	accountantName nvarchar(20) NOT NULL,
	email nvarchar(100) NOT NULL,
	phone bigint NOT NULL,
	CONSTRAINT Accountant_PK PRIMARY KEY(accountantId),
	CONSTRAINT Accountant_UC1 UNIQUE(email),
	CONSTRAINT Accountant_UC2 UNIQUE(phone)
)
GO

SET IDENTITY_INSERT Accountant ON;

INSERT INTO Accountant (accountantId, accountantName, email, phone)  VALUES
(1, 'Himanshu Sharma', 'hsharma@gmail.com', +18765742285),
(2, 'Rahul Gupta', 'rgupta@gmail.com', +16543387992),
(3, 'Sushil Kumar', 'skumar@gmail.com', +127765732443),
(4, 'Mohan Bansal', 'mbansal@gmail.com', +14329987653),
(5, 'Pankaj Raj', 'praj@gmail.com', +16543321273),
(6, 'Harsh Vardhan', 'hvardhan@gmail.com', +13434876484),
(7, 'Sidhant Lalvani', 'sidlal@gmail.com', +14563827389),
(8, 'Bal Veer', 'balveer@gmail.com', +18389493948),
(9, 'James Alabi', 'jalabi@gmail.com', +14437782902),
(10, 'Om Kapoor', 'omkap@gmail.com', +17564795389);

SET IDENTITY_INSERT Accountant OFF;

Select * From Accountant

DROP TABLE Address
CREATE TABLE Address
(
	addressNr int NOT NULL,
	stateCode nchar(2) NOT NULL,
	cityName nvarchar(10),
	countryCode nchar(4000),
	CONSTRAINT Address_PK PRIMARY KEY(addressNr)
)
GO

INSERT INTO Address (addressNr, stateCode, cityName, countryCode)
Values
(1, 'AZ', 'Tempe', 1),
(2, 'CA', 'San Diego', 1),
(3, 'AZ', 'Phoenix', 1),
(4, 'CT', 'Hartford', 1),
(5, 'DE', 'Dover', 1),
(6, 'FL', 'Miami', 1),
(7, 'GA', 'Atlanta', 1),
(8, 'HI', 'Hilo', 1),
(9, 'ID', 'Boise', 1),
(10, 'IL', 'Chicago', 1),
(11, 'IN', 'Indianap', 1),
(12, 'IA', 'Iowa City', 1),
(13, 'KS', 'Topeka', 1),
(14, 'KY', 'Kentucky', 1),
(15, 'MI', 'Detroit', 1);

SELECT * FROM Address

DROP TABLE Doctor
CREATE TABLE Doctor
(
	doctorId int IDENTITY (1, 1) NOT NULL,
	doctorName nvarchar(30) NOT NULL,
	email nvarchar(30) NOT NULL,
	phone bigint NOT NULL,
	profile nvarchar(30) NOT NULL,
	appointmentId int,
	departmentId int,
	CONSTRAINT Doctor_PK PRIMARY KEY(doctorId),
	CONSTRAINT Doctor_UC1 UNIQUE(email),
	CONSTRAINT Doctor_UC2 UNIQUE(phone)
)
GO

SET IDENTITY_INSERT Doctor ON;
Insert INTO Doctor (doctorId, doctorName, email, phone, profile, appointmentId,departmentId) 
VALUES
(1, 'Anil Kumar', 'akumar@gmail.com', +12234434339, 'Profile', 2, 1),
(2, 'Brij Mohan', 'bmohan@gmail.com', +15757473989, 'Profile', 4, 3),
(3, 'Veer Singh', 'vsingh@gmail.com', +12324345496, 'Profile', 1, 6),
(4, 'Baal Gupta', 'bgupta@gmail.com', +15439856332, 'Profile', 3, 4),
(5, 'Harshit Arora', 'harora@gmail.com', +19984342345, 'Profile',5,2),
(6, 'Bilu Singh', 'bsingh@gmail.com', +14562134568, 'Profile', 6,3),
(7, 'Raj Kumar', 'rajkum@gmail.com', +18478349827, 'Profile',7,9 ),
(8, 'Sanddy Singh', 'sandsing@gmail.com', +17654687652, 'Profile',8,7 ),
(9, 'Brandy Jain', 'brandjain@gmail.com', +17674537386, 'Profile',9,8),
(10, 'Himanshu Rana', 'himrana@gmail.com', +19654364736, 'Profile',10,10);

SET IDENTITY_INSERT Doctor OFF;

Select *From Doctor

DROP TABLE Patient
CREATE TABLE Patient
(
	patientId int IDENTITY (1, 1) NOT NULL,
	bloodGroup nchar(2) NOT NULL,
	email nvarchar(30) NOT NULL,
	patientName nvarchar(20) NOT NULL,
	phone bigint NOT NULL,
	genderCode nchar(1),
	drugName nvarchar(20),
	CONSTRAINT Patient_PK PRIMARY KEY(patientId)
)
GO
SET IDENTITY_INSERT Patient ON;
INSERT INTO	Patient (patientId, bloodGroup, email, patientName, phone, genderCode, drugName)
VALUES
(1, 'A+', 'pkumar@gmail.com', 'Peter Kumar', +18857757849, 'M', 'Brompheniramine'),
(2, 'O+', 'mpandey@gmail.com', 'Mahesh Pandey', +15543437554, 'M', 'Cetirizine'),
(3, 'B-', 'isingh@gmail.com', 'Ishika Sigh', +14352876543, 'F', 'Fexofenadine'),
(4, 'B+', 'araj@gmail.com', 'Anjali Raj', +15643263884, 'F',NULL),
(5, 'A-', 'plal@gmail.com', 'Pyare Lal', +14384649364, 'M',NULL),
(6, 'O-', 'bverma@gmail.com', 'Bipin Verma',+14536873887, 'M','Brompheniramine'),
(7, 'A+', 'psinha@gmail.com', 'Priyanshi Sinha', +14537468379, 'F', NULL),
(8, 'B+', 'schoud@gmail.com', 'Soham Choudhury', +14807635483, 'M', 'Brompheniramine'),
(9, 'O+', 'ssharma@gmail.com', 'Shubham Sharma', +16573849398, 'M', 'Fexofenadine'),
(10, 'B-', 'pgupta@gmail.com', 'Palak Gupta', +14809876745, 'F', 'Fexofenadine');

SET IDENTITY_INSERT Patient OFF;

Select * From Patient

Drop table department
CREATE TABLE Department
(
	departmentId int IDENTITY (1, 1) NOT NULL,
	departmentName nvarchar(20) NOT NULL,
	description nvarchar(50) NOT NULL,
	CONSTRAINT Department_PK PRIMARY KEY(departmentId),
	CONSTRAINT Department_UC1 UNIQUE(departmentName),
	CONSTRAINT Department_UC2 UNIQUE(description)
)
GO

SET IDENTITY_INSERT Department ON;
INSERT INTO Department (departmentId, departmentName,description) 
VALUES
(1,'Pediatrician','Child Doctor'),
(2, 'Surgeon','Surgery Purpose Ony'),
(3, 'Dermatologist', 'Skin Care'),
(4, 'Cardiologist', 'Heart Specialist'),
(5, 'OB/GYN','Pregnent Ladies Doctor'),
(6, 'Allergists', 'some autoimmune diseases'),
(7, 'Endocrinologists', 'experts on hormones and metabolism'),
(8, 'Gastroenterologists', 'specialists in digestive organs'),
(9, 'Hematologists', 'specialists in diseases of the blood, spleen'),
(10, 'Neurologists', 'specialists in the nervous system');

SET IDENTITY_INSERT Department OFF;

Select * From Department


DROP TABLE Invoice
CREATE TABLE Invoice
(
	invoiceId int IDENTITY (1, 1) NOT NULL,
	patientId int NOT NULL,
	paymentId float NOT NULL,
	email nvarchar(30),
	description nvarchar(50),
	CONSTRAINT Invoice_PK PRIMARY KEY(invoiceId),
	CONSTRAINT Invoice_UC1 UNIQUE(patientId),
	CONSTRAINT Invoice_UC2 UNIQUE(paymentId)
)
GO

SET IDENTITY_INSERT Invoice ON;
INSERT INTO Invoice (invoiceId,patientId,paymentId,email,description) 
VALUES
(1, 1, 1,'pkumar@gmail.com', 'Appointment Confirmation of Peter Kumar'),
(2,2,2,'mpandey@gmail.com', 'Appointment Confirmation of Mahesh Pandey'),
(3,3,3,'isingh@gmail.com',  'Appointment Confirmation of Ishika Sigh'),
(4,4,4,'araj@gmail.com', 'Appointment Confirmation of Anjali Raj'),
(5,5,5,'plal@gmail.com', 'Appointment Confirmation of Pyare Lal'),
(6,6,6, 'bverma@gmail.com', 'Appointment Confirmation of Bipin Verma'),
(7,7,7, 'psinha@gmail.com', 'Appointment Confirmation of Priyanshi Sinha'),
(8,8,8, 'schoud@gmail.com', 'Appointment Confirmation of Soham Choudhury'),
(9,9,9, 'ssharma@gmail.com', 'Appointment Confirmation of Shubham Sharma'),
(10,10,10, 'pgupta@gmail.com', 'Appointment Confirmation of Palak Gupta');

SET IDENTITY_INSERT Invoice OFF;
Select * from Invoice


DROP TABLE payment
CREATE TABLE Payment
(
	paymentId int NOT NULL,
	amount decimal(19,4) NOT NULL,
	patientId int NOT NULL,
	paymentTimestamp datetime NOT NULL,
	transactionId nvarchar(18) NOT NULL,
	description nvarchar(50),
	CONSTRAINT Payment_PK PRIMARY KEY(paymentId),
	CONSTRAINT Payment_UC1 UNIQUE(transactionId),
	CONSTRAINT Payment_UC2 UNIQUE(patientId)
)
GO


INSERT INTO Payment (paymentId,amount,patientId,paymentTimestamp,transactionId,description)
VALUES
(1, 450.32, 1, convert(datetime, '2021-04-06 09:26:56'), 'WSS333331345','Payment Sucessful' ),
(2, 100.65, 2, convert(datetime, '2021-04-06 12:49:43'), 'WAB33333AG11','Payment Sucessful' ),
(3, 654.87, 3, convert(datetime, '2021-04-08 10:05:34'), 'WSS33333SG10','Payment Sucessful' ),
(4, 765.79, 4, convert(datetime, '2021-04-09 15:54:22'), 'APP33333SG10','Payment Sucessful' ),
(5, 1032.88, 5, convert(datetime, '2021-04-10 09:26:56'), 'DVV33333SG10','Payment Sucessful' ),
(6, 567.43, 6, convert(datetime, '2021-04-12 13:39:42'), 'WSS667883SG10', 'Payment Sucessful'),
(7, 648.21, 7, convert(datetime, '2021-04-12 17:15:31'), 'WSS6672225610', 'Payment Sucessful'),
(8, 824.89, 8, convert(datetime, '2021-04-12 17:15:31'), 'WSS667883S101', 'Payment Sucessful'),
(9, 2324.44, 9, convert(datetime, '2021-03-12 17:15:31'), 'WS99993SG1000', 'Payment Sucessful'),
(10, 3421.32, 10, convert(datetime, '2021-03-12 17:15:31'), 'WS99993SG11111', 'Payment Sucessful');

Select * From Payment

Drop table Appointment

CREATE TABLE Appointment
(
	appointmentId int IDENTITY (1, 1) NOT NULL,
	appointmentTimestamp datetime NOT NULL,
	CONSTRAINT Appointment_PK PRIMARY KEY(appointmentId)
)
GO

SET IDENTITY_INSERT Appointment ON;
INSERT INTO Appointment(appointmentId, appointmentTimestamp)
VALUES
(1,convert(datetime, '2021-04-08 09:20:56')),
(2,convert(datetime, '2021-04-09 10:30:45')),
(3,convert(datetime, '2021-04-10 15:00:15')),
(4,convert(datetime, '2021-04-11 11:30:38')),
(5,convert(datetime, '2021-04-13 18:15:34')),
(6, convert(datetime, '2021-04-12 09:30:43')),
(7, convert(datetime, '2021-04-12 13:15:20')),
(8, convert(datetime, '2021-04-14 18:15:34')),
(9, convert(datetime, '2021-03-14 18:15:34')),
(10, convert(datetime, '2021-03-15 18:15:34'));

SET IDENTITY_INSERT Appointment OFF;

select * from Appointment

select * from AccountantLiveAtAddress


Drop table AccountantLiveAtAddress

CREATE TABLE AccountantLiveAtAddress
(
	accountantId int NOT NULL,
	addressNr int NOT NULL,
	CONSTRAINT AccountantLiveAtAddress_PK PRIMARY KEY(accountantId, addressNr)
)
GO

INSERT INTO AccountantLiveAtAddress(accountantId,addressNr) 
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,1),
(7,3),
(8,4),
(9,2),
(10,8);

select * from AccountantLiveAtAddress

Drop table PatientLivesAtAddress
CREATE TABLE PatientLivesAtAddress
(
	addressNr int NOT NULL,
	patientId int NOT NULL,
	CONSTRAINT PatientLivesAtAddress_PK PRIMARY KEY(patientId, addressNr)
)
GO

INSERT INTO PatientLivesAtAddress(addressNr,patientId)
VALUES
(4,1),
(7,2),
(8,3),
(9,4),
(10,5),
(1,6),
(1,7),
(3,8),
(3,9),
(4,10);

select * from PatientLivesAtAddress

Drop table DoctorLivesAtAddress
CREATE TABLE DoctorLivesAtAddress
(
	addressNr int NOT NULL,
	doctorId int NOT NULL,
	CONSTRAINT DoctorLivesAtAddress_PK PRIMARY KEY(doctorId, addressNr)
)
GO

INSERT INTO DoctorLivesAtAddress(addressNr,doctorId) 
VALUES
(11,1),
(12,2),
(13,3),
(14,4),
(15,5),
(1,6),
(12,7),
(13,8),
(4,9),
(5,10);

SELECT * from DoctorLivesAtAddress

Drop table DoctorProvidesReport
CREATE TABLE DoctorProvidesReport
(
	doctorId int NOT NULL,
	reportId int NOT NULL,
	CONSTRAINT DoctorProvidesReport_PK PRIMARY KEY(doctorId, reportId)
)
GO

INSERT INTO DoctorProvidesReport(doctorId,reportId) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);


Drop table Bed
CREATE TABLE Bed
(
	bedId int IDENTITY (1, 1) NOT NULL,
	bedDescption nvarchar(50),
	bedType nvarchar(10),
	CONSTRAINT Bed_PK PRIMARY KEY(bedId)
)
GO
SET IDENTITY_INSERT Bed ON;
INSERT INTO Bed(bedId,bedDescption,bedType) VALUES
(1, 'ward1', 'ward'),
(2, 'ward2', 'ward'),
(3, 'ward2', 'ward'),
(4, 'icu1','icu'),
(5, 'icu2', 'icu'),
(6, 'ward3', 'ward'),
(7, 'ward4', 'ward'),
(8, 'icu2', 'icu'),
(9, 'icu3', 'icu'),
(10, 'ward4', 'ward');

SET IDENTITY_INSERT Bed OFF;

Drop table AppointmentBookedByPatient
CREATE TABLE AppointmentBookedByPatient
(
	appointmentId int NOT NULL,
	patientId int NOT NULL,
	CONSTRAINT AppointmentBookedByPatient_PK PRIMARY KEY(appointmentId, patientId)
)
GO

SET IDENTITY_INSERT AppointmentBookedByPatient ON;

INSERT INTO AppointmentBookedByPatient(appointmentId,patientId) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

SET IDENTITY_INSERT AppointmentBookedByPatient ON;


Drop table BedAllotment
CREATE TABLE BedAllotment
(
	bedAllotmentId int IDENTITY (1, 1) NOT NULL,
	allotmentTimestamp datetime NOT NULL,
	bedId int NOT NULL,
	dischageTimestamp datetime NOT NULL,
	patientId int NOT NULL,
	CONSTRAINT BedAllotment_PK PRIMARY KEY(bedAllotmentId),
	CONSTRAINT BedAllotment_UC1 FOREIGN KEY(bedId) REFERENCES Bed(bedId),
	CONSTRAINT BedAllotment_UC2 UNIQUE(patientId)
)
GO

 

SET IDENTITY_INSERT BedAllotment ON;
INSERT INTO BedAllotment(bedAllotmentId,allotmentTimestamp,bedId,dischageTimestamp,patientId) VALUES
(9, '2021-03-24 10:34:09',1, '2021-03-29 11:34:10', 10),
(1, '2021-04-24 10:34:09', 2,'2021-05-01 10:34:09', 4),
(4, '2021-04-28 11:34:10',3, '2021-05-02 11:34:10', 5),
(3, '2021-06-24 10:34:09',3, '2021-02-26 11:34:10', 3),
(2, '2020-07-24 10:34:09',1, '2020-07-20 11:34:10', 2),
(5, '2021-04-26 9:34:09',4, '2021-04-28 11:34:10', 1),
(6, '2021-04-29 10:34:09',1, '2020-5-03 11:34:10', 7),
(7, '2021-03-26 9:34:09',4, '2021-03-28 11:34:10', 6)

select * from BedAllotment
SET IDENTITY_INSERT BedAllotment OFF;
CREATE TABLE Report
(
	reportId int IDENTITY (1, 1) NOT NULL,
	description nvarchar(50) NOT NULL,
	patientId int NOT NULL,
	type nvarchar(10) NOT NULL,
	caseHistory nvarchar(50) NOT NULL,
	CONSTRAINT Report_PK PRIMARY KEY(reportId)
)
GO

Drop table Report
SET IDENTITY_INSERT Report ON;
INSERT INTO Report(reportId,description,patientId,type,caseHistory)
VALUES
(1,'Routine Checkup',1,'Normal','No'),
(2,'Follow Up', 2, 'Normal','Yes'),
(3, 'Routine Checkup', 3, 'Normal','Yes'),
(4, 'Follow Up', 4, 'Normal', 'Yes'),
(5, 'Routine Checkup', 5, 'Normal','No'),
(6, 'Emergency', 6, 'Emergency','No'),
(7, 'Routine Checkup', 7, 'Normal','No'),
(8, 'Follow UP', 8, 'Normal','No'),
(9, 'Follow UP', 5, 'Normal','No'),
(10, 'Emergency', 9, 'Emergency','No');

SET IDENTITY_INSERT Report OFF;


drop table AccountantAuditTable

CREATE TABLE AccountantAuditTable
(
	accountantId int NOT NULL,
	accountantName nvarchar(20) NOT NULL,
	email nvarchar(100) NOT NULL,
	phone bigint NOT NULL,
	deletedTime datetime NOT NULL,
)
GO

-- Query 1
-- This query provides information about the details of beds available in the hospital.
USE EClinicalWork;
GO

SELECT DISTINCT b.bedId, b.bedDescption, b.bedType 
FROM Bed b, BedAllotment ba 
Where b.bedId NOT IN(SELECT bedId FROM BedAllotment WHERE dischageTimestamp > CURRENT_TIMESTAMP)

-- Query 2
-- The below query provides information about the number of appointments registered in each month.
USE EClinicalWork;
GO

SELECT COUNT(*) As NumberOfAppointments, DateName(mm, appointmentTimestamp) as monthNames
FROM Appointment
GROUP BY DateName(mm, appointmentTimestamp);

-- Query 3
-- The below query provides information about the number of appointments on a Particular date.
USE EClinicalWork;
GO
SELECT COUNT(*), FORMAT(appointmentTimestamp, 'MMM dd') as dateNames 
FROM Appointment
GROUP BY FORMAT(appointmentTimestamp, 'MMM dd');

-- Query 4
-- The below query yields information about the details of the patient which includes patient name, blood group, phone number, gender, assigned doctor name and timestamp etc.
USE EClinicalWork;
GO

SELECT p.patientName, p.bloodGroup, p.phone, p.genderCode, d.doctorName, a.appointmentTimestamp As AppointmentDate, r.description, r.type, r.caseHistory 
FROM Report r, Patient p, Doctor d, Appointment a, DoctorProvidesReport dpr 
Where p.patientId = r.patientId AND 
d.appointmentId = a.appointmentId AND
d.doctorId = dpr.doctorId AND
r.reportId = dpr.reportId

-- Query 5
-- The below query gives information about the month wise count of payments and total amount received
USE EClinicalWork;
GO

SELECT COUNT(*) As NumberOfPayments, SUM(Amount) As TotalCashReceived, DateName(mm, paymentTimestamp) as paymentMonth
FROM Payment
GROUP BY DateName(mm, paymentTimestamp);

-- Query 6
-- The below query yields information about the payment history which includes number of payments done on particular date along with the total cash received.
USE EClinicalWork;
GO

SELECT COUNT(*) As NumberOfPayments, SUM(Amount) As TotalCashReceived, FORMAT(paymentTimestamp, 'MMM dd') as paymentDate 
FROM Payment
GROUP BY FORMAT(paymentTimestamp, 'MMM dd');

-- Stored Procedure
-- a. The below stored procedure is beneficial to retrieve information about Particular Patient
/* stored procedure for particular patient*/
CREATE PROCEDURE GetPatientDetail @Id int
AS
	SELECT p.patientName, p.bloodGroup, p.drugName As AllegicDrug, p.genderCode, p.phone, p.email, a.cityName, pay.transactionId, 
	pay.paymentTimestamp,pay.amount, d.doctorName, r.description, r.type, r.caseHistory  
	FROM Address a
	JOIN
	PatientLivesAtAddress pla
	ON pla.addressNr = a.addressNr
	JOIN
	Patient p 
	ON pla.patientId = p.patientId
	JOIN
	Payment pay 
	ON p.patientId = pay.patientId
	JOIN
	Report r
	ON p.patientId = r.patientId 
	JOIN
	DoctorProvidesReport dpr
	ON r.reportId = dpr.reportId
	JOIN
	Doctor d ON dpr.doctorId = d.doctorId  
	WHERE p.patientId = @Id 

GO

-- b. This Stored procedure is useful to retrieve details about patients based on state, city, and both.
CREATE PROC GetPatientByStateANDCity

( 
	@state varchar(2),
	@city varchar(50) = NULL
) AS
	/* Only with states */
	IF @city IS NULL
	SELECT p.patientName, a.cityName, a.countryCode, a.stateCode, p.phone 
	FROM Patient p ,PatientLivesAtAddress pla, Address a 
	WHERE p.patientId =  pla.patientId AND
	pla.addressNr=a.addressNr AND
	a.stateCode =@state

	/* Only with city */
	ELSE IF @state IS NULL
	SELECT p.patientName, a.cityName, a.countryCode, a.stateCode, p.phone 
	FROM Patient p ,PatientLivesAtAddress pla, Address a 
	WHERE p.patientId =  pla.patientId AND
	pla.addressNr=a.addressNr AND
	a.cityName=@city

	/* With states and city */
	ELSE
	SELECT p.patientName, a.cityName, a.countryCode, a.stateCode, p.phone 
	FROM Patient p ,PatientLivesAtAddress pla, Address a 
	WHERE p.patientId =  pla.patientId AND
	pla.addressNr=a.addressNr AND
	stateCode=@state AND cityName=@city
Go

/* available patient according to state */
EXEC GetPatientByStateANDCity 'AZ'
/* city and State */
EXEC GetPatientByStateANDCity 'AZ', 'Tempe'

EXEC GetPatientByStateANDCity NULL, 'Phoenix'

-- Triggers
-- Whenever an accountant's record is deleted, then the trigger is activated, and that particular record is inserted into the audit table for auditing purposes.

-- After DELETE Triggers in SQL Server
USE [EClinicalWork]
GO

IF OBJECT_ID ('AfterDeleteAccountant', 'TR') IS NOT NULL  
   DROP TRIGGER AfterDeleteAccountant; 

CREATE TRIGGER AfterDeleteAccountant on [Accountant]
FOR DELETE 
AS DECLARE @AccountantId int,
	@AccountantName nvarchar(20),
	@AccountantEmail nvarchar(100),
	@AccountantPhone bigint

SELECT @AccountantId = del.accountantId FROM DELETED del;
SELECT @AccountantName = del.accountantName FROM DELETED del;
SELECT @AccountantEmail = del.email FROM DELETED del;
SELECT @AccountantPhone = del.phone FROM DELETED del;

  
INSERT INTO [AccountantAuditTable]( 
       accountantId ,[accountantName], [email], [phone], [deletedTime])
VALUES (@AccountantId, @AccountantName,@AccountantEmail,@AccountantPhone, CURRENT_TIMESTAMP);
	
PRINT 'We Successfully Fired the AFTER DELETE Triggers in SQL Server.'
GO

Delete from Accountant where accountantId = 5

Select * from AccountantAuditTable 

-- Functions
-- Function 1: This User-defined function is used to find the medication given to a Patient when only the Bed Number is known.

--drop function Patient_Medication
create FUNCTION Patient_Medication (@bedNo int = 0) returns table RETURN (
    select P.patientName, P.genderCode, B.bedId, B.allotmentTimestamp,B.dischageTimestamp, P.drugName 
    from Patient P inner join BedAllotment B on P.patientId=B.patientId where B.bedId=@bedNo
);
Select * from Patient_Medication(4) order by 1;

-- Function 2: This User-defined function is used to find the treating Doctor for a particular Patient.

drop function Treating_Doctor
create FUNCTION Treating_Doctor (@name varchar(50) = NULL) returns table RETURN (
    select P.patientId, P.patientName, D.doctorName, D.departmentId from Patient P join Report R on P.patientId=R.patientId join DoctorProvidesReport Dp on Dp.reportId=R.reportId 
    join Doctor D on D.doctorId=Dp.doctorId where P.patientName=@name
);

select * from Treating_Doctor('Mahesh Pandey') order by 1;





