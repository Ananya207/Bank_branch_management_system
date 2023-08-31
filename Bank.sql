CREATE DATABASE bankbranch;

USE bankbranch;

CREATE TABLE Branch(IFSC varchar(11) PRIMARY KEY, MICR int NOT NULL UNIQUE, BrName varchar(20), Mngr varchar(20), MngrSSN varchar(10), BrType varchar(20) );
CREATE TABLE Assets(IFSC varchar(11) , Lockers int, Loans int, Aadhar int, Passbooks int, Deposits int, Accounts int, FOREIGN KEY(IFSC) REFERENCES Branch(IFSC));
CREATE TABLE Location(LCode varchar(11), Latitude double NOT NULL, Longitude double NOT NULL, City varchar(20), Region varchar(20), State varchar(20), Pincode int);
CREATE TABLE ATM(AtmCode int PRIMARY KEY NOT NULL, CWL double ); 

INSERT INTO Branch (IFSC, MICR, BrName, Mngr, MngrSSN, BrType)  VALUES 
('KARB0000402', 600002027, 'K H Road', 'Rajagopala B', 'KAR4154555', 'Head Office'),
('KARB0000403', 600002029, 'Konappana Agrahara', 'Chandrashekhar C', 'KAR7571480', 'Regional Office'),
('KARB0000404', 600002025, 'Manchikeri', 'Bharathi N', 'KAR4154233', 'Customer Care Centre'),
('KARB0000401', 600002022, 'Koppa', 'Manjunath K', 'KAR9893456', 'City Branch'),
('KARB0000405', 600002035, 'Tipturu', 'Ashish', 'KAR1311257', 'Regional Office'),
('KARB0000406', 600002078, 'Patna', 'Shubha R', 'KAR7879945', 'City Branch'),
('KARB0000407', 600002077, 'Udupi', 'Kantaram', 'KAR1234567', 'Regional Office'),
('KARB0000408', 600002012, 'Sirsi', 'Shiva Prabhudev', 'KAR4148512', 'Regional Office'),
('KARB0000409', 600002024, 'Hyderabad', 'Vijayalakshmi', 'KAR7879234', 'Customer Care Centre'),
('KARB0000410', 600002021, 'Gurgaon', 'Guru Charan', 'KAR1111111', 'City Branch');

INSERT INTO Assets(IFSC, Lockers, Loans, Aadhar, Passbooks, Deposits, Accounts) VALUES 
('KARB0000410', 350, 288, 198, 320, 500, 400),
('KARB0000409', 129, 199, 98, 120, 200, 200),
('KARB0000408', 158, 260, 108, 140, 355,170),
('KARB0000406', 100, 150, 69, 99, 270, 100),
('KARB0000405', 225, 200, 175, 249, 485, 290),
('KARB0000407', 50, 125, 50, 49, 341, 100),
('KARB0000404', 175, 160, 144, 150, 300, 297),
('KARB0000403', 111, 180, 108, 99, 222, 150),
('KARB0000402', 120, 199, 111, 100, 123, 135),
('KARB0000401', 120, 211, 98, 95, 146, 177);

INSERT INTO Location(LCode, Latitude, Longitude, City, Region, State, Pincode ) VALUES
('KARB0000402', 12.97, 77.59, 'Bangalore', 'Blr South', 'Karnataka', 560540),
(667890, 17.97, 72.59, 'Bangalore', 'Blr East', 'Karnataka', 560575),
('KARB0000402', 12.97, 77.59, 'Bangalore', 'Blr South', 'Karnataka', 560540),
(667890, 17.97, 72.59, 'Mumbai', 'Bandra', 'Karnataka', 560575),
('KARB0000402', 12.97, 77.59, 'Bangalore', 'Blr South', 'Karnataka', 560540),
(667890, 17.97, 72.59, 'Mangalore', 'Mlr West', 'Karnataka', 560575),
('KARB0000402', 12.97, 77.59, 'Bangalore', 'Blr South', 'Karnataka', 560540),
(667890, 17.97, 72.59, 'Chennai', 'Che East', 'Karnataka', 560575);

INSERT INTO ATM(AtmCode, CWL) VALUES 
(667890, 1052345),
(667891, 1052345),
(667892, 1052345),
(667893, 1052345),
(667894, 1052345),
(667895, 1052345),
(667896, 1052345),
(667897, 1052345),
(667898, 1052345),
(667899, 1052345);













































































