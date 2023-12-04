CREATE TABLE CLIENT(
	Client_Id VARCHAR(15) NOT NULL,
	Id VARCHAR(15) NOT NULL,
	Passward VARCHAR(15) NOT NULL,
	Location_x NUMBER(7,4),
	Location_y NUMBER(7,4),
	PRIMARY KEY(Client_Id),
	UNIQUE (Id)
);

CREATE TABLE PORDER(
	Order_Id VARCHAR(15) NOT NULL,
	Product_Quantity NUMBER(5) NOT NULL,
	Arrival_Time DATE,
	Arrival_State VARCHAR(10),
	Store_Id VARCHAR(15) NOT NULL,
	Owner_Id VARCHAR(15) NOT NULL,
	Product_Id VARCHAR(15) NOT NULL,
 	CHECK ((Product_Quantity >= 0 and Product_Quantity <= 99999) and (Arrival_State in ('Waiting', 'Delivering', 'Complete'))),
	PRIMARY KEY(Order_Id)
);

CREATE TABLE OWNER(
	Owner_Id VARCHAR(15) NOT NULL,
	Id VARCHAR(15) NOT NULL,
	Password VARCHAR(15) NOT NULL,
	PRIMARY KEY(Owner_Id),
	UNIQUE (Id)
);

CREATE TABLE STORE(
	Store_Id VARCHAR(15) NOT NULL,
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(200),
	PhoneNumber VARCHAR(15),
	Location_x NUMBER(7,4),
	Location_y NUMBER(7,4),
	Owner_Id VARCHAR(15) NOT NULL,
	Image_Url VARCHAR(255),
	PRIMARY KEY(Store_Id)
);

CREATE TABLE PAYMENT(
	Payment_Id VARCHAR(15) NOT NULL,
	Product_Quantity NUMBER(5) NOT NULL,
	Store_Id VARCHAR(15) NOT NULL,
 	Product_Id VARCHAR(15) NOT NULL,
	CHECK (Product_Quantity >= 0 and Product_Quantity <= 99999),
	PRIMARY KEY(Payment_Id)
);

CREATE TABLE PRODUCT(
	Product_Id VARCHAR(15) NOT NULL,
	Name VARCHAR(50) NOT NULL,
	Price NUMBER(10) NOT NULL,
	Category VARCHAR(30) NOT NULL,
	Image_Url VARCHAR(255),
 	CHECK (Category IN ('alcoholic beverages', 'beverages', 'medical supplies', 'cigarette', 'household goods', 'snack', 'dairy product', 'frozen food', 'food', 'etc')),
	PRIMARY KEY(Product_Id),
	UNIQUE (Name)
);

CREATE TABLE FAVORITE(
	Client_Id VARCHAR(15) NOT NULL,
	Store_Id VARCHAR(15) NOT NULL,
	Product_Id VARCHAR(15) NOT NULL,
	PRIMARY KEY(Client_Id, Store_Id,Product_Id)
);

CREATE TABLE EVENT(
	Event_Id VARCHAR(15) NOT NULL,
	Name VARCHAR(100) NOT NULL,
	Policy CLOB NOT NULL,
	Estart DATE,
	Eend DATE,
	Image_Url VARCHAR(255),
    PRIMARY KEY(Event_Id)
);

CREATE TABLE HAS(
	Product_Id VARCHAR(15) NOT NULL,
	Store_Id VARCHAR(15) NOT NULL,
	Quantity NUMBER(5) NOT NULL,
	PRIMARY KEY(Product_Id,Store_Id)
);

CREATE TABLE CONTAIN(
	Product_Id VARCHAR(15) NOT NULL,
	Event_Id VARCHAR(15) NOT NULL,
	PRIMARY KEY(Product_Id, Event_Id)
);