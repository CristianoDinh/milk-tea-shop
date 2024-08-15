GO
CREATE DATABASE [PRJ302-MilkTeaShop]
GO
USE [PRJ302-MilkTeaShop]
GO

-- Quan he Role(1) - User(M)
CREATE TABLE [Roles] (
	RoleID varchar(150) PRIMARY KEY NOT NULL,
	[Name] varchar(150) ,
	[Status] varchar(50)
)
INSERT INTO Roles(RoleID,[Name],[Status])
VALUES	('AD','Admin','Active'),
		('US','User','Inactive'),
		('GU','Guest','Pending'),
		('SA','Super Admin','Archived')

CREATE TABLE [Users] (
	UserID varchar(150) PRIMARY KEY NOT NULL,
	RoleID varchar(150) FOREIGN KEY REFERENCES [Roles](RoleID),
	[FullName] varchar(150) UNIQUE,
	[Password] varchar(150),
	[Address] varchar(250),
	[Status] varchar(50)
)
INSERT INTO [Users](UserID,RoleID,[FullName],[Password],[Address],[Status])
VALUES ('admin','AD','Toi la Admin','1',N'Ha Tinh','Active'),
		('user1','US','User 1','2',N'Ha Noi','Inactive'),
		('user2','US','User 2','2',N'Hai Phong','Inactive'),
		('user3','US','User 3','2',N'Ho Chi Minh','Inactive')
		
-- Quan he Category(1) - TeaProducts(M)
CREATE TABLE Categories (
	CategoryID varchar(50) PRIMARY KEY NOT NULL,
	CategoryName varchar(150)
)
INSERT INTO Categories(CategoryID,CategoryName)
VALUES ('MK','Milk Tea'),
		('FT','Fruit Tea'),
		('SMT','Smoothies'),
		('HD','Hot Drinks'),
		('SP','Special Drinks')
CREATE TABLE Drinks (
	DrinksID varchar(50) PRIMARY KEY NOT NULL,
	DrinksName varchar(150),
	Quantity int,
	UnitPrice decimal(4,1),
	CategoryID varchar(50) REFERENCES Categories(CategoryID)
)
INSERT INTO Drinks(DrinksID,DrinksName,Quantity,UnitPrice,CategoryID)
VALUES ('MK01','Traditional Milk Tea',100,1.5,'MK'),
		('MK02','Olong Milk Tea',100,2,'MK'),
		('FT01','Peach Tea',80,1.5,'FT'),
		('FT02','Passion Tea',80,1.5,'FT'),
		('FT03','Strawberry Tea',80,1.5,'FT'),
		('SMT01','Custard Apple Smoothies',80,3,'SMT'),
		('SMT02','Mango Smoothies',80,3,'SMT'),
		('SMT03','Avocado Smoothies',80,3,'SMT'),
		('HD01','Black Coffee',80,1.5,'HD'),
		('HD02','Brown Coffe',80,1.5,'HD'),
		('SP01','Negroni Cocktail',80,5,'SP'),
		('SP02','Pisco Sour',80,5,'SP')
--Quan he Order(M) - Drinks(M) => OrderDetail
CREATE TABLE [Orders] (
	OrderID varchar(50) PRIMARY KEY NOT NULL,
	UserID varchar(150) FOREIGN KEY REFERENCES [Users](UserID),
	Total decimal(18,3),
	[Date Purchased] datetime,
	[Status] varchar(50)
)
--------------------------------
CREATE TABLE OrderDetails (
	OrderID varchar(50) FOREIGN KEY REFERENCES [Orders](OrderID),
	DrinksID varchar(50) FOREIGN KEY REFERENCES Drinks(DrinksID),
	PRIMARY KEY(OrderID, DrinksID),
	-------------- Thuoc tinh phat sinh -------------------
	Price decimal(18,3),
	Quantity int, 
	[Status] varchar(50)
)


---------------------------------------------------------------------------------------------
-----									INSERT VALUE									-----
---------------------------------------------------------------------------------------------




---------------------------------------------------------------------------------------------
-----								QUERYING STATEMENTS									-----
---------------------------------------------------------------------------------------------

-- LIST_DRINKS:
SELECT DrinksID,DrinksName,Quantity,UnitPrice FROM Drinks WHERE Quantity > 0

select * from Users

select * from Orders
select * from OrderDetails

INSERT INTO Drinks(DrinksID,DrinksName,Quantity,UnitPrice,CategoryID)
VALUES ('SMT03','Avocado Smoothies',80,3,'SMT')