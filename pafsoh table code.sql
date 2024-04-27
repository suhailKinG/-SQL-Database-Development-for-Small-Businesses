USE pafsohDB;
-- Create Location Table
CREATE TABLE Location (
LocationID INT PRIMARY KEY NOT NULL,
Address VARCHAR(60) NOT NULL
);

-- Create Customer Table
CREATE TABLE Customer (
CustomerID INT PRIMARY KEY NOT NULL,
FirstName VARCHAR(45) NOT NULL,
LastName VARCHAR(45) NOT NULL,
PhoneNumber VARCHAR(15) NOT NULL,
Email VARCHAR(60) NOT NULL,
Gender VARCHAR(60) NOT NULL
);

-- Create Access Table
CREATE TABLE Access (
AccessID INT PRIMARY KEY NOT NULL,
AccessLevel INT,
UserID INT,
CustomerID INT,
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Create Supplier Table
CREATE TABLE Supplier (
SupplierID INT PRIMARY KEY NOT NULL,
FirstName VARCHAR(45) NOT NULL,
LastName VARCHAR(45) NOT NULL,
PhoneNumber VARCHAR(15) NOT NULL,
Email VARCHAR(60) NOT NULL,
Gender VARCHAR(60) NOT NULL,
SustainableMaterialOffered VARCHAR(45) NOT NULL,
SupplierRating INT
);

-- Create TransactionHistory Table
CREATE TABLE TransactionHistory (
TransactionID INT PRIMARY KEY NOT NULL,
DateAndTime DATETIME,
EmployeeID INT,
CustomerID INT,
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


-- Create Employee Table
CREATE TABLE Employee (
EmployeeID INT PRIMARY KEY NOT NULL,
FirstName VARCHAR(45) NOT NULL,
LastName VARCHAR(45) NOT NULL,
Role VARCHAR(45) NOT NULL,
PhoneNumber VARCHAR(15) NOT NULL,
Email VARCHAR(60) NOT NULL,
Gender VARCHAR(60) NOT NULL,
BranchID INT,
AccessID INT,
TransactionHistoryID INT,
FOREIGN KEY (AccessID) REFERENCES Access(AccessID),
FOREIGN KEY (TransactionHistoryID) REFERENCES TransactionHistory(TransactionID)
);


-- Add missing foreign key relationship
ALTER TABLE TransactionHistory
ADD FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);

-- Create Branch Table
CREATE TABLE Branch (
BranchID INT PRIMARY KEY NOT NULL,
Location VARCHAR(60) NOT NULL,
ManagerID INT NOT NULL,
NumberOfStaff INT NOT NULL,
LocationID INT,
FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

-- Add missing foreign key relationship
ALTER TABLE Employee
ADD FOREIGN KEY (BranchID) REFERENCES Branch(BranchID);

-- Create Inventory Table
CREATE TABLE Inventory (
InventoryID INT PRIMARY KEY NOT NULL,
QuantityOnHand INT,
RecorderPoint DATETIME,
StockAlerts DATETIME,
LocationInStore VARCHAR(45) NOT NULL,
ProductID INT, 
FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
SupplierID INT,
FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);


-- Create WasteManagement Table
CREATE TABLE WasteManagement (
WasteID INT PRIMARY KEY NOT NULL,
DisposalMethod VARCHAR(45) NOT NULL,
DisposalCost INT,
DisposalDate DATE
);

-- Create OnlineOrder Table
CREATE TABLE OnlineOrder (
OrderID INT PRIMARY KEY NOT NULL,
OrderDate DATETIME,
CustomerID INT,
WasteID INT,
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
FOREIGN KEY (WasteID) REFERENCES WasteManagement(WasteID)
);

-- Create Product Table
CREATE TABLE Product (
ProductID INT PRIMARY KEY NOT NULL,
Name VARCHAR(45) NOT NULL,
Description VARCHAR(45) NOT NULL,
Size INT,
Color VARCHAR(45) NOT NULL,
Price INT
);

-- Create Feedback Table
CREATE TABLE Feedback (
FeedbackID INT PRIMARY KEY NOT NULL,
DateAndTime DATETIME,
FeedbackType VARCHAR(45) NOT NULL,
CustomerID INT,
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

SHOW TABLES;
DESCRIBE Employee;

-- Insert sample data into Location table 
INSERT INTO Location (LocationID, Address) VALUES
(101, 'Main Street'),
(102, 'Oak Avenue'),
(103, 'Elm Lane'),
(104, 'Pine Road'),
(105, 'Maple Drive'),
(106, 'Cedar Court'),
(107, 'Birch Street'),
(108, 'Aspen Avenue'),
(109, 'Redwood Lane'),
(110, 'Oak Avenue'),
(111, 'Pine Road'),
(112, 'Maple Drive'),
(113, 'Cedar Court'),
(114, 'Birch Street'),
(115, 'Aspen Avenue'),
(116, 'Elm Lane'),
(117, 'Redwood Lane'),
(118, 'Cedar Court'),
(119, 'Oak Avenue'),
(120, 'Main Street'),
(121, 'Birch Street'),
(122, 'Elm Lane'),
(123, 'Redwood Lane'),
(124, 'Pine Road'),
(125, 'Aspen Avenue'),
(126, 'Main Street'),
(127, 'Cedar Court'),
(128, 'Elm Lane'),
(129, 'Birch Street'),
(130, 'Redwood Lane');

SELECT * FROM Location;

-- Inserting sample records into Customer table 
INSERT INTO Customer (CustomerID, FirstName, LastName, PhoneNumber, Email, Gender) VALUES
(201, 'John', 'Doe', '1234567890', 'john.doe@example.com', 'Male'),
(202, 'Jane', 'Smith', '9876543210', 'jane.smith@example.com', 'Female'),
(203, 'Mike', 'Johnson', '5551112233', 'mike.johnson@example.com', 'Male'),
(204, 'Emily', 'Williams', '3334445555', 'emily.williams@example.com', 'Female'),
(205, 'Chris', 'Brown', '9998887777', 'chris.brown@example.com', 'Male'),
(206, 'Emma', 'Miller', '1112223333', 'emma.miller@example.com', 'Female'),
(207, 'Ryan', 'Taylor', '4445556666', 'ryan.taylor@example.com', 'Male'),
(208, 'Sophia', 'Clark', '6667778888', 'sophia.clark@example.com', 'Female'),
(209, 'Daniel', 'Moore', '2223334444', 'daniel.moore@example.com', 'Male'),
(210, 'Olivia', 'Martin', '7778889999', 'olivia.martin@example.com', 'Female'),
(211, 'Ethan', 'Davis', '8889990000', 'ethan.davis@example.com', 'Male'),
(212, 'Ava', 'Anderson', '5554443333', 'ava.anderson@example.com', 'Female'),
(213, 'Justin', 'Garcia', '6667778888', 'justin.garcia@example.com', 'Male'),
(214, 'Mia', 'Thomas', '1112223333', 'mia.thomas@example.com', 'Female'),
(215, 'Nathan', 'Lee', '9998887777', 'nathan.lee@example.com', 'Male'),
(216, 'Avery', 'Hill', '7778889999', 'avery.hill@example.com', 'Female'),
(217, 'Connor', 'Wright', '3334445555', 'connor.wright@example.com', 'Male'),
(218, 'Grace', 'Baker', '4445556666', 'grace.baker@example.com', 'Female'),
(219, 'Jackson', 'Lopez', '5551112233', 'jackson.lopez@example.com', 'Male'),
(220, 'Lily', 'Evans', '1234567890', 'lily.evans@example.com', 'Female'),
(221, 'Logan', 'Perez', '9876543210', 'logan.perez@example.com', 'Male'),
(222, 'Hannah', 'Wood', '5554443333', 'hannah.wood@example.com', 'Female'),
(223, 'Henry', 'Flores', '6667778888', 'henry.flores@example.com', 'Male'),
(224, 'Chloe', 'Rogers', '1112223333', 'chloe.rogers@example.com', 'Female'),
(225, 'Mason', 'Hughes', '9998887777', 'mason.hughes@example.com', 'Male'),
(226, 'Ella', 'Morgan', '7778889999', 'ella.morgan@example.com', 'Female'),
(227, 'Caleb', 'Reed', '4445556666', 'caleb.reed@example.com', 'Male'),
(228, 'Victoria', 'Turner', '6667778888', 'victoria.turner@example.com', 'Female'),
(229, 'Owen', 'Cooper', '1112223333', 'owen.cooper@example.com', 'Male'),
(230, 'Aria', 'Fisher', '5551112233', 'aria.fisher@example.com', 'Female');

SELECT * FROM Customer;


-- Inserting sample records into Access table 
INSERT INTO Access (AccessID, AccessLevel, UserID, CustomerID) VALUES
(301, 1, 501, 201),
(302, 2, 502, 202),
(303, 1, 503, 203),
(304, 3, 504, 204),
(305, 2, 505, 205),
(306, 1, 506, 206),
(307, 3, 507, 207),
(308, 2, 508, 208),
(309, 1, 509, 209),
(310, 3, 510, 210),
(311, 2, 511, 211),
(312, 1, 512, 212),
(313, 3, 513, 213),
(314, 2, 514, 214),
(315, 1, 515, 215),
(316, 3, 516, 216),
(317, 2, 517, 217),
(318, 1, 518, 218),
(319, 3, 519, 219),
(320, 2, 520, 220),
(321, 1, 521, 221),
(322, 3, 522, 222),
(323, 2, 523, 223),
(324, 1, 524, 224),
(325, 3, 525, 225),
(326, 2, 526, 226),
(327, 1, 527, 227),
(328, 3, 528, 228),
(329, 2, 529, 229),
(330, 1, 530, 230);



-- Inserting sample records into Supplier table 
INSERT INTO Supplier (SupplierID, FirstName, LastName, PhoneNumber, Email, Gender, SustainableMaterialOffered, SupplierRating) VALUES
(401, 'David', 'Smith', '1234567890', 'david.smith@example.com', 'Male', 'Recycled Paper', 4),
(402, 'Emma', 'Johnson', '9876543210', 'emma.johnson@example.com', 'Female', 'Biodegradable Plastics', 5),
(403, 'Brian', 'Taylor', '5551112233', 'brian.taylor@example.com', 'Male', 'Organic Cotton', 3),
(404, 'Sophie', 'Clark', '3334445555', 'sophie.clark@example.com', 'Female', 'Sustainably Harvested Wood', 4),
(405, 'Alex', 'Brown', '9998887777', 'alex.brown@example.com', 'Male', 'Recycled Metal', 5),
(406, 'Olivia', 'Miller', '1112223333', 'olivia.miller@example.com', 'Female', 'Eco-Friendly Packaging', 4),
(407, 'Daniel', 'Davis', '4445556666', 'daniel.davis@example.com', 'Male', 'Organic Cotton', 3),
(408, 'Chloe', 'Anderson', '6667778888', 'chloe.anderson@example.com', 'Female', 'Biodegradable Plastics', 5),
(409, 'James', 'Moore', '2223334444', 'james.moore@example.com', 'Male', 'Recycled Paper', 4),
(410, 'Ava', 'Martin', '7778889999', 'ava.martin@example.com', 'Female', 'Recycled Metal', 5),
(411, 'Ethan', 'Wright', '8889990000', 'ethan.wright@example.com', 'Male', 'Eco-Friendly Packaging', 4),
(412, 'Mia', 'Garcia', '5554443333', 'mia.garcia@example.com', 'Female', 'Sustainably Harvested Wood', 3),
(413, 'Henry', 'Thomas', '6667778888', 'henry.thomas@example.com', 'Male', 'Biodegradable Plastics', 5),
(414, 'Aria', 'Lee', '1112223333', 'aria.lee@example.com', 'Female', 'Recycled Metal', 4),
(415, 'Logan', 'Hill', '9998887777', 'logan.hill@example.com', 'Male', 'Organic Cotton', 3),
(416, 'Grace', 'Baker', '7778889999', 'grace.baker@example.com', 'Female', 'Sustainably Harvested Wood', 4),
(417, 'Jackson', 'Lopez', '3334445555', 'jackson.lopez@example.com', 'Male', 'Recycled Paper', 5),
(418, 'Lily', 'Evans', '1234567890', 'lily.evans@example.com', 'Female', 'Biodegradable Plastics', 4),
(419, 'William', 'Perez', '9876543210', 'william.perez@example.com', 'Male', 'Eco-Friendly Packaging', 5),
(420, 'Sophia', 'Wood', '5554443333', 'sophia.wood@example.com', 'Female', 'Sustainably Harvested Wood', 3),
(421, 'Nathan', 'Flores', '6667778888', 'nathan.flores@example.com', 'Male', 'Organic Cotton', 4),
(422, 'Hannah', 'Rogers', '1112223333', 'hannah.rogers@example.com', 'Female', 'Recycled Metal', 5),
(423, 'Leo', 'Hughes', '9998887777', 'leo.hughes@example.com', 'Male', 'Biodegradable Plastics', 4),
(424, 'Avery', 'Morgan', '7778889999', 'avery.morgan@example.com', 'Female', 'Eco-Friendly Packaging', 3),
(425, 'Elijah', 'Reed', '4445556666', 'elijah.reed@example.com', 'Male', 'Sustainably Harvested Wood', 5),
(426, 'Scarlett', 'Turner', '6667778888', 'scarlett.turner@example.com', 'Female', 'Recycled Paper', 4),
(427, 'Isaac', 'Cooper', '1112223333', 'isaac.cooper@example.com', 'Male', 'Eco-Friendly Packaging', 3),
(428, 'Aria', 'Fisher', '5551112233', 'aria.fisher@example.com', 'Female', 'Sustainably Harvested Wood', 5),
(429, 'Owen', 'Fowler', '1234567890', 'owen.fowler@example.com', 'Male', 'Biodegradable Plastics', 4),
(430, 'Ava', 'Gomez', '9876543210', 'ava.gomez@example.com', 'Female', 'Recycled Metal', 3);


-- Inserting sample records into TransactionHistory table 
INSERT INTO TransactionHistory (TransactionID, DateAndTime, CustomerID) VALUES
(501, '2023-01-01 10:30:00', 201),
(502, '2023-01-02 11:45:00', 202),
(503, '2023-01-03 12:15:00', 203),
(504, '2023-01-04 14:20:00', 204),
(505, '2023-01-05 15:30:00', 205),
(506, '2023-01-06 16:45:00', 206),
(507, '2023-01-07 09:00:00', 207),
(508, '2023-01-08 10:30:00', 208),
(509, '2023-01-09 13:15:00', 209),
(510, '2023-01-10 14:45:00', 210),
(511, '2023-01-11 16:00:00', 211),
(512, '2023-01-12 09:45:00', 212),
(513, '2023-01-13 11:00:00', 213),
(514, '2023-01-14 13:30:00', 214),
(515, '2023-01-15 14:45:00', 215),
(516, '2023-01-16 16:15:00', 216),
(517, '2023-01-17 10:00:00', 217),
(518, '2023-01-18 11:30:00', 218),
(519, '2023-01-19 13:45:00', 219),
(520, '2023-01-20 15:00:00', 220),
(521, '2023-01-21 16:30:00', 221),
(522, '2023-01-22 09:15:00', 222),
(523, '2023-01-23 10:45:00', 223),
(524, '2023-01-24 12:00:00', 224),
(525, '2023-01-25 14:30:00', 225),
(526, '2023-01-26 15:45:00', 226),
(527, '2023-01-27 17:00:00', 227),
(528, '2023-01-28 09:30:00', 228),
(529, '2023-01-29 11:15:00', 229),
(530, '2023-01-30 12:45:00', 230);

-- Inserting sample records into Feedback table 
INSERT INTO Feedback (FeedbackID, DateAndTime, FeedbackType, CustomerID) VALUES
(601, '2023-02-01 09:30:00', 'Positive', 201),
(602, '2023-02-02 10:45:00', 'Negative', 202),
(603, '2023-02-03 12:00:00', 'Neutral', 203),
(604, '2023-02-04 14:15:00', 'Positive', 204),
(605, '2023-02-05 15:30:00', 'Negative', 205),
(606, '2023-02-06 16:45:00', 'Positive', 206),
(607, '2023-02-07 09:15:00', 'Neutral', 207),
(608, '2023-02-08 10:30:00', 'Negative', 208),
(609, '2023-02-09 13:00:00', 'Positive', 209),
(610, '2023-02-10 14:30:00', 'Neutral', 210),
(611, '2023-02-11 16:00:00', 'Positive', 211),
(612, '2023-02-12 09:45:00', 'Negative', 212),
(613, '2023-02-13 11:15:00', 'Positive', 213),
(614, '2023-02-14 13:45:00', 'Neutral', 214),
(615, '2023-02-15 14:45:00', 'Negative', 215),
(616, '2023-02-16 16:30:00', 'Positive', 216),
(617, '2023-02-17 10:00:00', 'Neutral', 217),
(618, '2023-02-18 11:30:00', 'Positive', 218),
(619, '2023-02-19 13:45:00', 'Negative', 219),
(620, '2023-02-20 15:15:00', 'Positive', 220),
(621, '2023-02-21 16:45:00', 'Neutral', 221),
(622, '2023-02-22 09:30:00', 'Negative', 222),
(623, '2023-02-23 10:45:00', 'Positive', 223),
(624, '2023-02-24 12:15:00', 'Neutral', 224),
(625, '2023-02-25 14:30:00', 'Negative', 225),
(626, '2023-02-26 15:45:00', 'Positive', 226),
(627, '2023-02-27 17:00:00', 'Neutral', 227),
(628, '2023-02-28 09:45:00', 'Positive', 228),
(629, '2023-03-01 11:30:00', 'Negative', 229),
(630, '2023-03-02 13:00:00', 'Neutral', 230);


-- Inserting records into Branch table 
INSERT INTO Branch (BranchID, Location, ManagerID, NumberOfStaff, LocationID) VALUES
(701, 'Downtown', 301, 10, 101),
(702, 'Uptown', 302, 15, 102),
(703, 'Midtown', 303, 12, 103),
(704, 'West End', 304, 8, 104),
(705, 'East Side', 305, 18, 105),
(706, 'South Park', 306, 14, 106),
(707, 'North Hills', 307, 11, 107),
(708, 'Central Plaza', 308, 9, 108),
(709, 'Riverside', 309, 13, 109),
(710, 'Harbor View', 310, 16, 110),
(711, 'Sunset Valley', 311, 7, 111),
(712, 'Greenfield', 312, 20, 112),
(713, 'Maplewood', 313, 17, 113),
(714, 'Pinehurst', 314, 10, 114),
(715, 'Cedar Grove', 315, 14, 115),
(716, 'Lakeview', 316, 11, 116),
(717, 'Oak Ridge', 317, 9, 117),
(718, 'Willow Creek', 318, 12, 118),
(719, 'Rosewood', 319, 15, 119),
(720, 'Cherry Blossom', 320, 8, 120),
(721, 'Magnolia Park', 321, 13, 121),
(722, 'Sycamore Lane', 322, 16, 122),
(723, 'Hillcrest', 323, 7, 123),
(724, 'Golden Gate', 324, 19, 124),
(725, 'Silver Springs', 325, 12, 125),
(726, 'Diamond Heights', 326, 15, 126),
(727, 'Emerald Valley', 327, 11, 127),
(728, 'Ruby Ridge', 328, 14, 128),
(729, 'Sapphire Cove', 329, 8, 129),
(730, 'Topaz Terrace', 330, 10, 130);


-- Inserting sample records into WasteManagement table 
INSERT INTO WasteManagement (WasteID, DisposalMethod, DisposalCost, DisposalDate) VALUES
(801, 'Landfill', 100, '2023-01-01'),
(802, 'Recycling', 50, '2023-01-02'),
(803, 'Incineration', 120, '2023-01-03'),
(804, 'Composting', 80, '2023-01-04'),
(805, 'Landfill', 110, '2023-01-05'),
(806, 'Recycling', 60, '2023-01-06'),
(807, 'Incineration', 130, '2023-01-07'),
(808, 'Composting', 90, '2023-01-08'),
(809, 'Landfill', 120, '2023-01-09'),
(810, 'Recycling', 70, '2023-01-10'),
(811, 'Incineration', 140, '2023-01-11'),
(812, 'Composting', 100, '2023-01-12'),
(813, 'Landfill', 130, '2023-01-13'),
(814, 'Recycling', 80, '2023-01-14'),
(815, 'Incineration', 150, '2023-01-15'),
(816, 'Composting', 110, '2023-01-16'),
(817, 'Landfill', 140, '2023-01-17'),
(818, 'Recycling', 90, '2023-01-18'),
(819, 'Incineration', 160, '2023-01-19'),
(820, 'Composting', 120, '2023-01-20'),
(821, 'Landfill', 150, '2023-01-21'),
(822, 'Recycling', 100, '2023-01-22'),
(823, 'Incineration', 170, '2023-01-23'),
(824, 'Composting', 130, '2023-01-24'),
(825, 'Landfill', 160, '2023-01-25'),
(826, 'Recycling', 110, '2023-01-26'),
(827, 'Incineration', 180, '2023-01-27'),
(828, 'Composting', 140, '2023-01-28'),
(829, 'Landfill', 170, '2023-01-29'),
(830, 'Recycling', 120, '2023-01-30');


-- Inserting sample records into OnlineOrder table w
INSERT INTO OnlineOrder (OrderID, OrderDate, CustomerID, WasteID) VALUES
(901, '2023-02-01 09:30:00', 201, 801),
(902, '2023-02-02 10:45:00', 202, 802),
(903, '2023-02-03 12:00:00', 203, 803),
(904, '2023-02-04 14:15:00', 204, 804),
(905, '2023-02-05 15:30:00', 205, 805),
(906, '2023-02-06 16:45:00', 206, 806),
(907, '2023-02-07 09:15:00', 207, 807),
(908, '2023-02-08 10:30:00', 208, 808),
(909, '2023-02-09 13:00:00', 209, 809),
(910, '2023-02-10 14:30:00', 210, 810),
(911, '2023-02-11 16:00:00', 211, 811),
(912, '2023-02-12 09:45:00', 212, 812),
(913, '2023-02-13 11:15:00', 213, 813),
(914, '2023-02-14 13:45:00', 214, 814),
(915, '2023-02-15 14:45:00', 215, 815),
(916, '2023-02-16 16:30:00', 216, 816),
(917, '2023-02-17 10:00:00', 217, 817),
(918, '2023-02-18 11:30:00', 218, 818),
(919, '2023-02-19 13:45:00', 219, 819),
(920, '2023-02-20 15:15:00', 220, 820),
(921, '2023-02-21 16:45:00', 221, 821),
(922, '2023-02-22 09:30:00', 222, 822),
(923, '2023-02-23 10:45:00', 223, 823),
(924, '2023-02-24 12:15:00', 224, 824),
(925, '2023-02-25 14:30:00', 225, 825),
(926, '2023-02-26 15:45:00', 226, 826),
(927, '2023-02-27 17:00:00', 227, 827),
(928, '2023-02-28 09:45:00', 228, 828),
(929, '2023-03-01 11:30:00', 229, 829),
(930, '2023-03-02 13:00:00', 230, 830);



-- Inserting sample records into Inventory table
INSERT INTO Inventory (InventoryID, QuantityOnHand, RecorderPoint, StockAlerts, LocationInStore, ProductID, SupplierID) VALUES
(1001, 50, '2023-01-01 10:00:00', '2023-01-01 15:00:00', 'Section A', 2001, 401),
(1002, 75, '2023-01-02 11:00:00', '2023-01-02 16:00:00', 'Section B', 2002, 402),
(1003, 60, '2023-01-03 12:00:00', '2023-01-03 17:00:00', 'Section C', 2003, 403),
(1004, 85, '2023-01-04 13:00:00', '2023-01-04 18:00:00', 'Section D', 2004, 404),
(1005, 70, '2023-01-05 14:00:00', '2023-01-05 19:00:00', 'Section E', 2005, 405),
(1006, 95, '2023-01-06 15:00:00', '2023-01-06 20:00:00', 'Section F', 2006, 406),
(1007, 80, '2023-01-07 16:00:00', '2023-01-07 21:00:00', 'Section G', 2007, 407),
(1008, 105, '2023-01-08 17:00:00', '2023-01-08 22:00:00', 'Section H', 2008, 408),
(1009, 120, '2023-01-09 18:00:00', '2023-01-09 23:00:00', 'Section I', 2009, 409),
(1010, 115, '2023-01-10 19:00:00', '2023-01-10 23:59:59', 'Section J', 2010, 410),
(1011, 130, '2023-01-11 20:00:00', '2023-01-11 23:59:59', 'Section A', 2011, 411),
(1012, 145, '2023-01-12 21:00:00', '2023-01-12 23:59:59', 'Section B', 2012, 412),
(1013, 160, '2023-01-13 22:00:00', '2023-01-13 23:59:59', 'Section C', 2013, 413),
(1014, 175, '2023-01-14 23:00:00', '2023-01-14 23:59:59', 'Section D', 2014, 414),
(1015, 190, '2023-01-15 00:00:00', '2023-01-15 23:59:59', 'Section E', 2015, 415),
(1016, 205, '2023-01-16 01:00:00', '2023-01-16 23:59:59', 'Section F', 2016, 416),
(1017, 220, '2023-01-17 02:00:00', '2023-01-17 23:59:59', 'Section G', 2017, 417),
(1018, 235, '2023-01-18 03:00:00', '2023-01-18 23:59:59', 'Section H', 2018, 418),
(1019, 250, '2023-01-19 04:00:00', '2023-01-19 23:59:59', 'Section I', 2019, 419),
(1020, 265, '2023-01-20 05:00:00', '2023-01-20 23:59:59', 'Section J', 2020, 420),
(1021, 280, '2023-01-21 06:00:00', '2023-01-21 23:59:59', 'Section A', 2021, 421),
(1022, 295, '2023-01-22 07:00:00', '2023-01-22 23:59:59', 'Section B', 2022, 422),
(1023, 310, '2023-01-23 08:00:00', '2023-01-23 23:59:59', 'Section C', 2023, 423),
(1024, 325, '2023-01-24 09:00:00', '2023-01-24 23:59:59', 'Section D', 2024, 424),
(1025, 340, '2023-01-25 10:00:00', '2023-01-25 23:59:59', 'Section E', 2025, 425),
(1026, 355, '2023-01-26 11:00:00', '2023-01-26 23:59:59', 'Section F', 2026, 426),
(1027, 370, '2023-01-27 12:00:00', '2023-01-27 23:59:59', 'Section G', 2027, 427),
(1028, 385, '2023-01-28 13:00:00', '2023-01-28 23:59:59', 'Section H', 2028, 428),
(1029, 400, '2023-01-29 14:00:00', '2023-01-29 23:59:59', 'Section I', 2029, 429),
(1030, 415, '2023-01-30 15:00:00', '2023-01-30 23:59:59', 'Section J', 2030, 430);


-- Inserting sample records into Product table 
INSERT INTO Product (ProductID, Name, Description, Size, Color, Price) VALUES
(2001, 'Product 1', 'Description 1', 10, 'Red', 20),
(2002, 'Product 2', 'Description 2', 15, 'Blue', 30),
(2003, 'Product 3', 'Description 3', 12, 'Green', 25),
(2004, 'Product 4', 'Description 4', 18, 'Yellow', 40),
(2005, 'Product 5', 'Description 5', 14, 'Purple', 35),
(2006, 'Product 6', 'Description 6', 20, 'Orange', 50),
(2007, 'Product 7', 'Description 7', 16, 'Pink', 45),
(2008, 'Product 8', 'Description 8', 22, 'Brown', 60),
(2009, 'Product 9', 'Description 9', 28, 'Black', 75),
(2010, 'Product 10', 'Description 10', 24, 'White', 70),
(2011, 'Product 11', 'Description 11', 30, 'Gray', 85),
(2012, 'Product 12', 'Description 12', 26, 'Beige', 80),
(2013, 'Product 13', 'Description 13', 32, 'Cyan', 95),
(2014, 'Product 14', 'Description 14', 38, 'Magenta', 110),
(2015, 'Product 15', 'Description 15', 34, 'Turquoise', 105),
(2016, 'Product 16', 'Description 16', 40, 'Lime', 120),
(2017, 'Product 17', 'Description 17', 36, 'Indigo', 115),
(2018, 'Product 18', 'Description 18', 42, 'Violet', 130),
(2019, 'Product 19', 'Description 19', 48, 'Amber', 145),
(2020, 'Product 20', 'Description 20', 44, 'Sapphire', 140),
(2021, 'Product 21', 'Description 21', 50, 'Ruby', 155),
(2022, 'Product 22', 'Description 22', 46, 'Emerald', 150),
(2023, 'Product 23', 'Description 23', 52, 'Topaz', 165),
(2024, 'Product 24', 'Description 24', 58, 'Pearl', 180),
(2025, 'Product 25', 'Description 25', 54, 'Opal', 175),
(2026, 'Product 26', 'Description 26', 60, 'Garnet', 190),
(2027, 'Product 27', 'Description 27', 56, 'Aquamarine', 185),
(2028, 'Product 28', 'Description 28', 62, 'Peridot', 200),
(2029, 'Product 29', 'Description 29', 68, 'Citrine', 215),
(2030, 'Product 30', 'Description 30', 64, 'Amethyst', 210);

SELECT * FROM TransactionHistory;


-- Check existing records in the Inventory table
SELECT * FROM Inventory;
-- Show constraints on the Inventory table
SHOW CREATE TABLE Inventory;

ALTER TABLE Inventory
DROP ProductID;

-- Add missing foreign key relationship
ALTER TABLE Inventory
ADD FOREIGN KEY (ProductID) REFERENCES Product(ProductID);

DROP TABLE Product;
DROP TABLE Inventory;

INSERT INTO Employee (EmployeeID, FirstName, LastName, Role, PhoneNumber, Email, Gender, BranchID, AccessID, TransactionHistoryID)
VALUES
(3001, 'John', 'Doe', 'Manager', '555-1234', 'john.doe@example.com', 'Male', 701, 301, 501),
(3002, 'Jane', 'Smith', 'Salesperson', '555-5678', 'jane.smith@example.com', 'Female', 702, 302, 502),
(3003, 'Mike', 'Johnson', 'Technician', '555-8765', 'mike.johnson@example.com', 'Male', 703, 303, 503),
(3004, 'Emily', 'Williams', 'Accountant', '555-4321', 'emily.williams@example.com', 'Female', 704, 304, 504),
(3005, 'David', 'Brown', 'Supervisor', '555-9876', 'david.brown@example.com', 'Male', 705, 305, 505),
(3006, 'Olivia', 'Miller', 'Clerk', '555-2345', 'olivia.miller@example.com', 'Female', 706, 306, 506),
(3007, 'Daniel', 'Davis', 'Engineer', '555-8765', 'daniel.davis@example.com', 'Male', 707, 307, 507),
(3008, 'Sophia', 'Wilson', 'Analyst', '555-3456', 'sophia.wilson@example.com', 'Female', 708, 308, 508),
(3009, 'Matthew', 'Moore', 'Developer', '555-6543', 'matthew.moore@example.com', 'Male', 709, 309, 509),
(3010, 'Emma', 'Taylor', 'Designer', '555-7890', 'emma.taylor@example.com', 'Female', 710, 310, 510),
(3011, 'William', 'Anderson', 'Manager', '555-2345', 'william.anderson@example.com', 'Male', 711, 311, 511),
(3012, 'Isabella', 'Harris', 'Salesperson', '555-8765', 'isabella.harris@example.com', 'Female', 712, 312, 512),
(3013, 'James', 'Clark', 'Technician', '555-3456', 'james.clark@example.com', 'Male', 713, 313, 513),
(3014, 'Ava', 'King', 'Accountant', '555-9876', 'ava.king@example.com', 'Female', 714, 314, 514),
(3015, 'Logan', 'Baker', 'Supervisor', '555-4321', 'logan.baker@example.com', 'Male', 715, 315, 515),
(3016, 'Ella', 'White', 'Clerk', '555-1234', 'ella.white@example.com', 'Female', 716, 316, 516),
(3017, 'Benjamin', 'Hill', 'Engineer', '555-5678', 'benjamin.hill@example.com', 'Male', 717, 317, 517),
(3018, 'Grace', 'Scott', 'Analyst', '555-2345', 'grace.scott@example.com', 'Female', 718, 318, 518),
(3019, 'Andrew', 'Young', 'Developer', '555-7890', 'andrew.young@example.com', 'Male', 719, 319, 519),
(3020, 'Chloe', 'Hall', 'Designer', '555-6543', 'chloe.hall@example.com', 'Female', 720, 320, 520),
(3021, 'Isaac', 'Parker', 'Manager', '555-666-7777', 'isaac.parker@example.com', 'Male', 721, 321, 521),
(3022, 'Athena', 'Baker', 'Salesperson', '999-111-2222', 'athena.baker@example.com', 'Female', 722, 322, 522),
(3023, 'Eli', 'Wright', 'Technician', '333-777-8888', 'eli.wright@example.com', 'Male', 723, 323, 523),
(3024, 'Zoe', 'Young', 'Accountant', '444-222-5555', 'zoe.young@example.com', 'Female', 724, 324, 524),
(3025, 'Mason', 'Turner', 'Supervisor', '666-888-1111', 'mason.turner@example.com', 'Male', 725, 325, 525),
(3026, 'Aurora', 'Carter', 'Clerk', '777-111-3333', 'aurora.carter@example.com', 'Female', 726, 326, 526),
(3027, 'Lucas', 'Garcia', 'Engineer', '888-444-5555', 'lucas.garcia@example.com', 'Male', 727, 327, 527),
(3028, 'Nova', 'Fisher', 'Analyst', '111-222-3333', 'nova.fisher@example.com', 'Female', 728, 328, 528),
(3029, 'Elijah', 'Ward', 'Developer', '222-333-4444', 'elijah.ward@example.com', 'Male', 729, 329, 529),
(3030, 'Scarlett', 'Cole', 'Designer', '333-444-5555', 'scarlett.cole@example.com', 'Female', 730, 330, 530);


-- Drop the foreign key constraint
ALTER TABLE TransactionHistory
DROP FOREIGN KEY TransactionHistory_ibfk_2;

-- Remove EmployeeID from TransactionHistory table
ALTER TABLE TransactionHistoryAccess
DROP COLUMN EmployeeID;


SELECT * FROM TransactionHistory;


ALTER TABLE Employee
ADD COLUMN DateOfBirth DATE;

UPDATE Employee SET DateOfBirth = '1990-05-15' WHERE EmployeeID = 3001;
UPDATE Employee SET DateOfBirth = '1988-09-28' WHERE EmployeeID = 3002;
UPDATE Employee SET DateOfBirth = '1995-03-10' WHERE EmployeeID = 3003;
UPDATE Employee SET DateOfBirth = '1987-07-22' WHERE EmployeeID = 3004;
UPDATE Employee SET DateOfBirth = '1992-11-05' WHERE EmployeeID = 3005;
UPDATE Employee SET DateOfBirth = '1993-01-18' WHERE EmployeeID = 3006;
UPDATE Employee SET DateOfBirth = '1989-06-30' WHERE EmployeeID = 3007;
UPDATE Employee SET DateOfBirth = '1991-04-12' WHERE EmployeeID = 3008;
UPDATE Employee SET DateOfBirth = '1994-08-03' WHERE EmployeeID = 3009;
UPDATE Employee SET DateOfBirth = '1986-12-25' WHERE EmployeeID = 3010;
UPDATE Employee SET DateOfBirth = '1997-02-08' WHERE EmployeeID = 3011;
UPDATE Employee SET DateOfBirth = '1985-10-14' WHERE EmployeeID = 3012;
UPDATE Employee SET DateOfBirth = '1996-09-01' WHERE EmployeeID = 3013;
UPDATE Employee SET DateOfBirth = '1998-07-04' WHERE EmployeeID = 3014;
UPDATE Employee SET DateOfBirth = '1990-03-19' WHERE EmployeeID = 3015;
UPDATE Employee SET DateOfBirth = '1988-11-22' WHERE EmployeeID = 3016;
UPDATE Employee SET DateOfBirth = '1992-01-06' WHERE EmployeeID = 3017;
UPDATE Employee SET DateOfBirth = '1987-05-28' WHERE EmployeeID = 3018;
UPDATE Employee SET DateOfBirth = '1993-08-11' WHERE EmployeeID = 3019;
UPDATE Employee SET DateOfBirth = '1991-06-24' WHERE EmployeeID = 3020;
UPDATE Employee SET DateOfBirth = '1989-09-07' WHERE EmployeeID = 3021;
UPDATE Employee SET DateOfBirth = '1995-12-30' WHERE EmployeeID = 3022;
UPDATE Employee SET DateOfBirth = '1986-04-02' WHERE EmployeeID = 3023;
UPDATE Employee SET DateOfBirth = '1994-02-15' WHERE EmployeeID = 3024;
UPDATE Employee SET DateOfBirth = '1996-10-18' WHERE EmployeeID = 3025;
UPDATE Employee SET DateOfBirth = '1985-07-01' WHERE EmployeeID = 3026;
UPDATE Employee SET DateOfBirth = '1997-09-14' WHERE EmployeeID = 3027;
UPDATE Employee SET DateOfBirth = '1988-03-27' WHERE EmployeeID = 3028;
UPDATE Employee SET DateOfBirth = '1990-08-09' WHERE EmployeeID = 3029;
UPDATE Employee SET DateOfBirth = '1999-01-31' WHERE EmployeeID = 3030;

-- Update the existing Branch table to include BranchManager and BranchContact
ALTER TABLE Branch
ADD COLUMN BranchManager VARCHAR(45) NOT NULL,
ADD COLUMN BranchContact VARCHAR(15) NOT NULL;

-- Insert 30 unique sample records into the Branch table with distinct BranchID values starting from 701
UPDATE Branch SET
    BranchManager = CASE
        WHEN BranchID = 701 THEN 'Manager 1'
        WHEN BranchID = 702 THEN 'Manager 2'
        WHEN BranchID = 703 THEN 'Manager 3'
        WHEN BranchID = 704 THEN 'Manager 4'
        WHEN BranchID = 705 THEN 'Manager 5'
        WHEN BranchID = 706 THEN 'Manager 6'
        WHEN BranchID = 707 THEN 'Manager 7'
        WHEN BranchID = 708 THEN 'Manager 8'
        WHEN BranchID = 709 THEN 'Manager 9'
        WHEN BranchID = 710 THEN 'Manager 10'
        WHEN BranchID = 711 THEN 'Manager 11'
        WHEN BranchID = 712 THEN 'Manager 12'
        WHEN BranchID = 713 THEN 'Manager 13'
        WHEN BranchID = 714 THEN 'Manager 14'
        WHEN BranchID = 715 THEN 'Manager 15'
        WHEN BranchID = 716 THEN 'Manager 16'
        WHEN BranchID = 717 THEN 'Manager 17'
        WHEN BranchID = 718 THEN 'Manager 18'
        WHEN BranchID = 719 THEN 'Manager 19'
        WHEN BranchID = 720 THEN 'Manager 20'
        WHEN BranchID = 721 THEN 'Manager 21'
        WHEN BranchID = 722 THEN 'Manager 22'
        WHEN BranchID = 723 THEN 'Manager 23'
        WHEN BranchID = 724 THEN 'Manager 24'
        WHEN BranchID = 725 THEN 'Manager 25'
        WHEN BranchID = 726 THEN 'Manager 26'
        WHEN BranchID = 727 THEN 'Manager 27'
        WHEN BranchID = 728 THEN 'Manager 28'
        WHEN BranchID = 729 THEN 'Manager 29'
        WHEN BranchID = 730 THEN 'Manager 30'
    END,
    BranchContact = CASE
        WHEN BranchID = 701 THEN 'Contact 1'
        WHEN BranchID = 702 THEN 'Contact 2'
        WHEN BranchID = 703 THEN 'Contact 3'
        WHEN BranchID = 704 THEN 'Contact 4'
        WHEN BranchID = 705 THEN 'Contact 5'
        WHEN BranchID = 706 THEN 'Contact 6'
        WHEN BranchID = 707 THEN 'Contact 7'
        WHEN BranchID = 708 THEN 'Contact 8'
        WHEN BranchID = 709 THEN 'Contact 9'
        WHEN BranchID = 710 THEN 'Contact 10'
        WHEN BranchID = 711 THEN 'Contact 11'
        WHEN BranchID = 712 THEN 'Contact 12'
        WHEN BranchID = 713 THEN 'Contact 13'
        WHEN BranchID = 714 THEN 'Contact 14'
        WHEN BranchID = 715 THEN 'Contact 15'
        WHEN BranchID = 716 THEN 'Contact 16'
        WHEN BranchID = 717 THEN 'Contact 17'
        WHEN BranchID = 718 THEN 'Contact 18'
        WHEN BranchID = 719 THEN 'Contact 19'
        WHEN BranchID = 720 THEN 'Contact 20'
        WHEN BranchID = 721 THEN 'Contact 21'
        WHEN BranchID = 722 THEN 'Contact 22'
        WHEN BranchID = 723 THEN 'Contact 23'
        WHEN BranchID = 724 THEN 'Contact 24'
        WHEN BranchID = 725 THEN 'Contact 25'
        WHEN BranchID = 726 THEN 'Contact 26'
        WHEN BranchID = 727 THEN 'Contact 27'
        WHEN BranchID = 728 THEN 'Contact 28'
        WHEN BranchID = 729 THEN 'Contact 29'
        WHEN BranchID = 730 THEN 'Contact 30'
    END
WHERE BranchID >= 701 AND BranchID <= 730;



-- Add ProductCategory and BuyingPrice attributes to Supplier table
ALTER TABLE Supplier
ADD COLUMN ProductCategory VARCHAR(45),
ADD COLUMN BuyingPrice INT;

-- Update ProductCategory and BuyingPrice columns with 30 unique sample values
UPDATE Supplier SET
    ProductCategory = CASE
        WHEN SupplierID = 401 THEN 'Clothing 1'
        WHEN SupplierID = 402 THEN 'Clothing 2'
        WHEN SupplierID = 403 THEN 'Clothing 3'
        WHEN SupplierID = 404 THEN 'Clothing 4'
        WHEN SupplierID = 405 THEN 'Clothing 5'
        WHEN SupplierID = 406 THEN 'Clothing 6'
        WHEN SupplierID = 407 THEN 'Clothing 7'
        WHEN SupplierID = 408 THEN 'Clothing 8'
        WHEN SupplierID = 409 THEN 'Clothing 9'
        WHEN SupplierID = 410 THEN 'Clothing 10'
        WHEN SupplierID = 411 THEN 'Clothing 11'
        WHEN SupplierID = 412 THEN 'Clothing 12'
        WHEN SupplierID = 413 THEN 'Clothing 13'
        WHEN SupplierID = 414 THEN 'Clothing 14'
        WHEN SupplierID = 415 THEN 'Clothing 15'
        WHEN SupplierID = 416 THEN 'Clothing 16'
        WHEN SupplierID = 417 THEN 'Clothing 17'
        WHEN SupplierID = 418 THEN 'Clothing 18'
        WHEN SupplierID = 419 THEN 'Clothing 19'
        WHEN SupplierID = 420 THEN 'Clothing 20'
        WHEN SupplierID = 421 THEN 'Clothing 21'
        WHEN SupplierID = 422 THEN 'Clothing 22'
        WHEN SupplierID = 423 THEN 'Clothing 23'
        WHEN SupplierID = 424 THEN 'Clothing 24'
        WHEN SupplierID = 425 THEN 'Clothing 25'
        WHEN SupplierID = 426 THEN 'Clothing 26'
        WHEN SupplierID = 427 THEN 'Clothing 27'
        WHEN SupplierID = 428 THEN 'Clothing 28'
        WHEN SupplierID = 429 THEN 'Clothing 29'
        WHEN SupplierID = 430 THEN 'Clothing 30'
    END,
    BuyingPrice = CASE
        WHEN SupplierID = 401 THEN 500
        WHEN SupplierID = 402 THEN 30
        WHEN SupplierID = 403 THEN 200
        WHEN SupplierID = 404 THEN 300
        WHEN SupplierID = 405 THEN 15
        WHEN SupplierID = 406 THEN 25
        WHEN SupplierID = 407 THEN 50
        WHEN SupplierID = 408 THEN 150
        WHEN SupplierID = 409 THEN 40
        WHEN SupplierID = 410 THEN 120
        WHEN SupplierID = 411 THEN 100
        WHEN SupplierID = 412 THEN 80
        WHEN SupplierID = 413 THEN 35
        WHEN SupplierID = 414 THEN 10
        WHEN SupplierID = 415 THEN 75
        WHEN SupplierID = 416 THEN 60
        WHEN SupplierID = 417 THEN 45
        WHEN SupplierID = 418 THEN 20
        WHEN SupplierID = 419 THEN 18
        WHEN SupplierID = 420 THEN 90
        WHEN SupplierID = 421 THEN 30
        WHEN SupplierID = 422 THEN 200
        WHEN SupplierID = 423 THEN 22
        WHEN SupplierID = 424 THEN 250
        WHEN SupplierID = 425 THEN 70
        WHEN SupplierID = 426 THEN 55
        WHEN SupplierID = 427 THEN 120
        WHEN SupplierID = 428 THEN 40
        WHEN SupplierID = 429 THEN 150
        WHEN SupplierID = 430 THEN 28
    END
WHERE SupplierID BETWEEN 401 AND 430;


-- Add PurchaseDate attribute to Customer table
ALTER TABLE Customer
ADD COLUMN PurchaseDate DATE;

-- Update PurchaseDate column with 30 unique sample values
UPDATE Customer SET
    PurchaseDate = CASE
        WHEN CustomerID = 201 THEN '2023-01-01'
        WHEN CustomerID = 202 THEN '2023-01-02'
        WHEN CustomerID = 203 THEN '2023-01-03'
        WHEN CustomerID = 204 THEN '2023-01-04'
        WHEN CustomerID = 205 THEN '2023-01-05'
        WHEN CustomerID = 206 THEN '2023-01-06'
        WHEN CustomerID = 207 THEN '2023-01-07'
        WHEN CustomerID = 208 THEN '2023-01-08'
        WHEN CustomerID = 209 THEN '2023-01-09'
        WHEN CustomerID = 210 THEN '2023-01-10'
        WHEN CustomerID = 211 THEN '2023-01-11'
        WHEN CustomerID = 212 THEN '2023-01-12'
        WHEN CustomerID = 213 THEN '2023-01-13'
        WHEN CustomerID = 214 THEN '2023-01-14'
        WHEN CustomerID = 215 THEN '2023-01-15'
        WHEN CustomerID = 216 THEN '2023-01-16'
        WHEN CustomerID = 217 THEN '2023-01-17'
        WHEN CustomerID = 218 THEN '2023-01-18'
        WHEN CustomerID = 219 THEN '2023-01-19'
        WHEN CustomerID = 220 THEN '2023-01-20'
        WHEN CustomerID = 221 THEN '2023-01-21'
        WHEN CustomerID = 222 THEN '2023-01-22'
        WHEN CustomerID = 223 THEN '2023-01-23'
        WHEN CustomerID = 224 THEN '2023-01-24'
        WHEN CustomerID = 225 THEN '2023-01-25'
        WHEN CustomerID = 226 THEN '2023-01-26'
        WHEN CustomerID = 227 THEN '2023-01-27'
        WHEN CustomerID = 228 THEN '2023-01-28'
        WHEN CustomerID = 229 THEN '2023-01-29'
        WHEN CustomerID = 230 THEN '2023-01-30'
    END
WHERE CustomerID BETWEEN 201 AND 230;

-- Add ProductType attribute to Inventory table
ALTER TABLE Inventory
ADD COLUMN ProductType VARCHAR(45);

-- Update ProductType column with 30 unique sample values
UPDATE Inventory SET
    ProductType = CASE
        WHEN InventoryID = 1001 THEN 'Clothing 1'
        WHEN InventoryID = 1002 THEN 'Clothing 2'
        WHEN InventoryID = 1003 THEN 'Clothing 3'
        WHEN InventoryID = 1004 THEN 'Clothing 4'
        WHEN InventoryID = 1005 THEN 'Clothing 5'
        WHEN InventoryID = 1006 THEN 'Clothing 6'
        WHEN InventoryID = 1007 THEN 'Clothing 7'
        WHEN InventoryID = 1008 THEN 'Clothing 8'
        WHEN InventoryID = 1009 THEN 'Clothing 9'
        WHEN InventoryID = 1010 THEN 'Clothing 10'
        WHEN InventoryID = 1011 THEN 'Clothing 11'
        WHEN InventoryID = 1012 THEN 'Clothing 12'
        WHEN InventoryID = 1013 THEN 'Clothing 13'
        WHEN InventoryID = 1014 THEN 'Clothing 14'
        WHEN InventoryID = 1015 THEN 'Clothing 15'
        WHEN InventoryID = 1016 THEN 'Clothing 16'
        WHEN InventoryID = 1017 THEN 'Clothing 17'
        WHEN InventoryID = 1018 THEN 'Clothing 18'
        WHEN InventoryID = 1019 THEN 'Clothing 19'
        WHEN InventoryID = 1020 THEN 'Clothing 20'
        WHEN InventoryID = 1021 THEN 'Clothing 21'
        WHEN InventoryID = 1022 THEN 'Clothing 22'
        WHEN InventoryID = 1023 THEN 'Clothing 23'
        WHEN InventoryID = 1024 THEN 'Clothing 24'
        WHEN InventoryID = 1025 THEN 'Clothing 25'
        WHEN InventoryID = 1026 THEN 'Clothing 26'
        WHEN InventoryID = 1027 THEN 'Clothing 27'
        WHEN InventoryID = 1028 THEN 'Clothing 28'
        WHEN InventoryID = 1029 THEN 'Clothing 29'
        WHEN InventoryID = 1030 THEN 'Clothing 30'
    END
WHERE InventoryID BETWEEN 1001 AND 1030;

-- Add ProductName and SellingPrice attributes to Inventory table
ALTER TABLE Inventory
ADD COLUMN ProductName VARCHAR(45),
ADD COLUMN SellingPrice DECIMAL(10, 2);

-- Update ProductName, SellingPrice, and ProductType columns with 30 unique sample values
UPDATE Inventory SET
    ProductName = CASE
        WHEN InventoryID = 1001 THEN 'Blue Jeans'
        WHEN InventoryID = 1002 THEN 'Leather Jacket'
        WHEN InventoryID = 1003 THEN 'Cotton T-shirt'
        WHEN InventoryID = 1004 THEN 'Striped Dress'
        WHEN InventoryID = 1005 THEN 'Wool Sweater'
        WHEN InventoryID = 1006 THEN 'Denim Shorts'
        WHEN InventoryID = 1007 THEN 'Knit Cardigan'
        WHEN InventoryID = 1008 THEN 'Silk Blouse'
        WHEN InventoryID = 1009 THEN 'Plaid Skirt'
        WHEN InventoryID = 1010 THEN 'Hooded Sweatshirt'
        WHEN InventoryID = 1011 THEN 'Velvet Pants'
        WHEN InventoryID = 1012 THEN 'Linen Shirt'
        WHEN InventoryID = 1013 THEN 'Chiffon Dress'
        WHEN InventoryID = 1014 THEN 'Cashmere Scarf'
        WHEN InventoryID = 1015 THEN 'Athletic Leggings'
        WHEN InventoryID = 1016 THEN 'Ruffled Top'
        WHEN InventoryID = 1017 THEN 'Leopard Print Coat'
        WHEN InventoryID = 1018 THEN 'Cargo Pants'
        WHEN InventoryID = 1019 THEN 'Satin Pajamas'
        WHEN InventoryID = 1020 THEN 'Faux Fur Jacket'
        WHEN InventoryID = 1021 THEN 'Embroidered Jeans'
        WHEN InventoryID = 1022 THEN 'Sequined Blazer'
        WHEN InventoryID = 1023 THEN 'Floral Maxi Dress'
        WHEN InventoryID = 1024 THEN 'Corduroy Overalls'
        WHEN InventoryID = 1025 THEN 'Knit Beanie'
        WHEN InventoryID = 1026 THEN 'Tie-Dye Hoodie'
        WHEN InventoryID = 1027 THEN 'Puffer Vest'
        WHEN InventoryID = 1028 THEN 'Velour Tracksuit'
        WHEN InventoryID = 1029 THEN 'Turtleneck Sweater'
        WHEN InventoryID = 1030 THEN 'Lace Camisole'
    END,
    SellingPrice = CASE
        WHEN InventoryID = 1001 THEN 29.99
        WHEN InventoryID = 1002 THEN 39.99
        WHEN InventoryID = 1003 THEN 49.99
        WHEN InventoryID = 1004 THEN 59.99
        WHEN InventoryID = 1005 THEN 69.99
        WHEN InventoryID = 1006 THEN 79.99
        WHEN InventoryID = 1007 THEN 89.99
        WHEN InventoryID = 1008 THEN 99.99
        WHEN InventoryID = 1009 THEN 109.99
        WHEN InventoryID = 1010 THEN 119.99
        WHEN InventoryID = 1011 THEN 129.99
        WHEN InventoryID = 1012 THEN 139.99
        WHEN InventoryID = 1013 THEN 149.99
        WHEN InventoryID = 1014 THEN 159.99
        WHEN InventoryID = 1015 THEN 169.99
        WHEN InventoryID = 1016 THEN 179.99
        WHEN InventoryID = 1017 THEN 189.99
        WHEN InventoryID = 1018 THEN 199.99
        WHEN InventoryID = 1019 THEN 209.99
        WHEN InventoryID = 1020 THEN 219.99
        WHEN InventoryID = 1021 THEN 229.99
        WHEN InventoryID = 1022 THEN 239.99
        WHEN InventoryID = 1023 THEN 249.99
        WHEN InventoryID = 1024 THEN 259.99
        WHEN InventoryID = 1025 THEN 269.99
        WHEN InventoryID = 1026 THEN 279.99
        WHEN InventoryID = 1027 THEN 289.99
        WHEN InventoryID = 1028 THEN 299.99
        WHEN InventoryID = 1029 THEN 309.99
        WHEN InventoryID = 1030 THEN 319.99
    END
WHERE InventoryID BETWEEN 1001 AND 1030;

-- Add new attributes to TransactionHistory table
ALTER TABLE TransactionHistory
ADD COLUMN Amount DECIMAL(10, 2),
ADD COLUMN PaymentMethod VARCHAR(45),
ADD COLUMN Qty INT,
ADD COLUMN TransactionStatus VARCHAR(45);

-- Update new attributes with 30 sample records
UPDATE TransactionHistory SET
    Amount = ROUND(RAND() * 1000, 2),
    PaymentMethod = CASE
        WHEN TransactionID BETWEEN 501 AND 515 THEN 'Credit Card'
        WHEN TransactionID BETWEEN 516 AND 530 THEN 'Cash'
    END,
    Qty = ROUND(RAND() * 10),
    TransactionStatus = CASE
        WHEN TransactionID BETWEEN 501 AND 515 THEN 'Completed'
        WHEN TransactionID BETWEEN 516 AND 530 THEN 'Pending'
    END
WHERE TransactionID BETWEEN 501 AND 530;

-- Add ProductID as a foreign key to TransactionHistory table
ALTER TABLE TransactionHistory
ADD COLUMN ProductID INT,
ADD FOREIGN KEY (ProductID) REFERENCES Product(ProductID);

-- Update ProductID with sequential values from 2001 to 2030
UPDATE TransactionHistory
SET ProductID = TransactionID + 1500
WHERE TransactionID BETWEEN 501 AND 530;


-- Add EmployeeID as a foreign key to TransactionHistory table
ALTER TABLE TransactionHistory
ADD COLUMN EmployeeID INT,
ADD FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);

-- Update EmployeeID with sequential values from 3001 to 3030
UPDATE TransactionHistory
SET EmployeeID = TransactionID + 3000
WHERE TransactionID BETWEEN 501 AND 530;




-- Display the updated records
SELECT * FROM TransactionHistory;


-- Find the foreign key constraint names
SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'TransactionHistory' AND COLUMN_NAME = 'employeeID';


-- Drop the foreign key constraint by name
ALTER TABLE TransactionHistory DROP FOREIGN KEY TransactionHistory_ibfk_3;

-- Drop the ProductID column
ALTER TABLE TransactionHistory DROP COLUMN EmployeeID;



SHOW TABLES;
