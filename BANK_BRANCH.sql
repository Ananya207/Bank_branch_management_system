USE branch;

-- Comparing only with the date even though time is besides
select * from tblbank where Date(CreationDate) = '2021-09-18';

-- Simple Query
SELECT IFSCCode, MICRCode 
FROM tblbankdetail
WHERE BankName = 3;

-- Nested query
-- INTERSECT operation
SELECT tblbank.CreationDate, tblbank.BankName
FROM tblbank
WHERE Date(CreationDate) IN (SELECT Date(CreationDate) FROM tblcity);

-- Correlated query
-- Gives output only if there are tuples with the specified date
SELECT IFSCCode, MICRCode, branch FROM tblbankdetail
WHERE EXISTS (SELECT * FROM tblbank WHERE Date(CreationDate) = '2021-09-18');

-- Set operations
SELECT CreationDate, ShortName FROM tblbank  
UNION   
SELECT CreationDate FROM tblcity; 

SELECT CreationDate FROM tblbank  
UNION ALL   
SELECT CreationDate FROM tblcity;  

-- Join
SELECT IFSCCode, MICRCode, Branch
FROM ( tblbankdetail JOIN tblbank ON tblbank.ID = tblbankdetail.BankName)
WHERE tblbankdetail.BankName = '3';

-- Aggregate Function
SELECT BankName, COUNT(*) 
FROM tblbankdetail
GROUP BY BankName;

SELECT BankName, COUNT(*)
FROM tblbankdetail 
GROUP BY BankName
HAVING COUNT(*) > 2 ;

-- Order by clause
SELECT StateID, City FROM tblcity
ORDER BY City;

SELECT StateID, City FROM tblcity
ORDER BY StateID DESC;

-- Functions
-- Using inbuilt function cast
-- Splitting Date and Time
SELECT cast(CreationDate AS date),cast(CreationDate AS Time) FROM tblbank;

-- Creating a Function
DELIMITER $$
CREATE FUNCTION isValid(
stateID INTEGER )
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
IF stateID > 28 THEN
RETURN ("invalid");
ELSE
RETURN ("valid");
END IF;
END
$$

SELECT isValid(30);
SELECT isValid(5);

-- Trigger
DELIMITER $$
CREATE TRIGGER StateValidity
	AFTER UPDATE ON tblstate
    FOR EACH ROW
	BEGIN  
		DECLARE error_msg VARCHAR(255);  
		SET error_msg = ('Cannot have more than 28 states!');  
		IF new.tblstate.ID > 28 THEN  
		SIGNAL SQLSTATE '45000'   
		SET MESSAGE_TEXT = error_msg;  
		END IF;  
	END $$
    

-- Query for Search
SELECT tblbank.BankName as bn,
	tblbank.ID as bid, tblbank.ShortName, tblstate.State,
    tblcity.ID as cid, tblcity.StateID, tblcity.City,
    tblbankdetail.IFSCCode,	tblbankdetail.StateID,
    tblbankdetail.ID as bdid, tblbankdetail.CityID,
    tblbankdetail.BankName, tblbankdetail.MICRCode,
    tblbankdetail.BankName, tblbankdetail.Address,
    tblbankdetail.Branch, tblbankdetail.PhoneNumber,
    tblbankdetail.BranchCode, tblbankdetail.ZipCode, tblbankdetail.CreationDate 
    from tblbankdetail inner join tblstate  
    on tblbankdetail.StateID=tblstate.ID join tblcity 
    on tblbankdetail.CityID=tblcity.ID join tblbank 
    on tblbankdetail.BankName=tblbank.ID 
    where (tblbank.BankName like  '%$sdata%' || tblbankdetail.ZipCode like  '%$sdata%' || tblbankdetail.Branch like '%$sdata%');

