USE ismgroup30;
SHOW DATABASES;

SET FOREIGN_KEY_CHECKS=1;
/*DROP TABLE User;*/
CREATE TABLE User (
    username VARCHAR(20) NOT NULL,
    passward VARCHAR(30),
    role VARCHAR(30),
    PRIMARY KEY (username)
);

/*DROP TABLE Hotel;*/
CREATE TABLE Hotel (
    username VARCHAR(20) NOT NULL,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phoneNumber INT NOT NULL,
    head VARCHAR(50) NOT NULL,
    logo VARCHAR(50) NOT NULL,
    description TINYTEXT,
    FOREIGN KEY (username)
        REFERENCES User (username)
);

/*DROP TABLE Agency;*/ 
CREATE TABLE Agency (
    name VARCHAR(50) NOT NULL,
    telephone INT NOT NULL,
    mail VARCHAR(50) NOT NULL,
    vatNumber VARCHAR(50) NOT NULL,
    registrationDate DATE,
    username VARCHAR(20) NOT NULL,
    FOREIGN KEY (username)
		REFERENCES User (username)
);
             
/*DROP TABLE Reservation;*/  
CREATE TABLE Reservation (
    reservationId INT NOT NULL,
    arrivalDate VARCHAR(30) NOT NULL,
    arrivalTime VARCHAR(50) NOT NULL,
    departureDate VARCHAR(30) NOT NULL,
    departureTime VARCHAR(50) NOT NULL,
    numberOfPeople INT NOT NULL,
    totalCost DOUBLE,
    submittedOn DATE NOT NULL,
    comments TINYTEXT,
    checkin BOOLEAN,
    chekout BOOLEAN,
    username_hotel VARCHAR(20) NOT NULL,
    username_agency VARCHAR(20) NOT NULL,
    PRIMARY KEY (reservationId),
    FOREIGN KEY (username_hotel)
        REFERENCES Hotel (username),
    FOREIGN KEY (username_agency)
        REFERENCES Agency (username)
);

/*DROP TABLE Service;*/
CREATE TABLE Service (
    serviceId INT NOT NULL,
    name VARCHAR(50),
    PRIMARY KEY (serviceId)
);
             
/*DROP TABLE Group_Customer;*/             
CREATE TABLE Group_Customer (
    customerId INT NOT NULL,
    name VARCHAR(50),
    surname VARCHAR(50),
    telephone VARCHAR(50),
    email VARCHAR(50),
    identityNumber VARCHAR(50),
    reservationId INT NOT NULL,
    PRIMARY KEY (customerId),
    FOREIGN KEY (reservationId)
        REFERENCES Reservation (reservationId)
);
                            
/*DROP TABLE Room;*/
CREATE TABLE Room (
    number INT NOT NULL,
    username VARCHAR(20) NOT NULL,
    type VARCHAR(30),
    floor INT,
    PRIMARY KEY (number , username),
    FOREIGN KEY (username)
        REFERENCES Hotel (username)
);

/*DROP TABLE Criterion;*/
CREATE TABLE Criterion (
	criterionId INT NOT NULL,
    name VARCHAR(50),
    min INT,
    max INT, 
	username VARCHAR(20) NOT NULL,
    PRIMARY KEY (criterionId),
    FOREIGN KEY (username)
		REFERENCES Hotel (username)
);

/*DROP TABLE Review;*/
CREATE TABLE Review (
	datetime DATETIME NOT NULL,
    comments VARCHAR(250),
    reservationId INT,
    PRIMARY KEY (datetime),
    FOREIGN KEY (reservationId)
		REFERENCES Reservation (reservationId)
);

/*DROP TABLE RoomType;*/
CREATE TABLE RoomType (
	type VARCHAR(50) NOT NULL,
    numberOfRooms INT,
    price DOUBLE,
    reservationId INT,
    PRIMARY KEY (type, reservationId),
    FOREIGN KEY (reservationId)
		REFERENCES Reservation (reservationId) 
);

/*DROP TABLE Customer_Room;*/
CREATE TABLE Customer_Room (
	customerId INT NOT NULL,
    number INT NOT NULL,
    PRIMARY KEY (customerId, number),
    FOREIGN KEY (customerId)
		REFERENCES Group_Customer (customerId),
	FOREIGN KEY (number)
		REFERENCES Room (number)
);             

/*DROP TABLE Hotel_Service;*/ 
CREATE TABLE Hotel_Service (
    username VARCHAR(20) NOT NULL,
    serviceId INT NOT NULL,
    PRIMARY KEY (username , serviceId),
    FOREIGN KEY (username)
        REFERENCES Hotel (username),
    FOREIGN KEY (serviceId)
        REFERENCES Service (serviceId)
);
             
 /*DROP TABLE Reservation_Service;*/ 
CREATE TABLE Reservation_Service (
    reservationId INT NOT NULL,
    serviceId INT NOT NULL,
    value BOOLEAN NOT NULL,
    PRIMARY KEY (reservationId , serviceId),
    FOREIGN KEY (reservationId)
        REFERENCES Reservation (reservationId),
    FOREIGN KEY (serviceId)
        REFERENCES Service (serviceId)
);
			             
 /*DROP TABLE Review_Criterion;*/ 
CREATE TABLE Review_Criterion (
    criterionId INT NOT NULL,
    score INT NOT NULL,
    datetime DATETIME NOT NULL,
    PRIMARY KEY (datetime),
    FOREIGN KEY (criterionId)
        REFERENCES Criterion (criterionId)
);
            
            
