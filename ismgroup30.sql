USE ismgroup30;
SHOW DATABASES;

SET FOREIGN_KEY_CHECKS=1;
/*DROP TABLE Hotel;*/
CREATE TABLE Hotel (
    hotelId INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phoneNumber INT NOT NULL,
    head VARCHAR(50) NOT NULL,
    logo VARCHAR(50) NOT NULL,
    description TINYTEXT,
    PRIMARY KEY (hotelId)
);

/*DROP TABLE Agency;*/ 
CREATE TABLE Agency (
    agencyId INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    telephone INT NOT NULL,
    mail VARCHAR(50) NOT NULL,
    vatNumber VARCHAR(50) NOT NULL,
    registrationDate DATE,
    hotelId INT,
    PRIMARY KEY (agencyId),
    FOREIGN KEY (hotelId)
		REFERENCES Hotel (hotelId)
);
             
/*DROP TABLE Reservation;*/  
CREATE TABLE Reservation (
    reservationId INT NOT NULL,
    arrivalDate DATE NOT NULL,
    arrivalTime VARCHAR(50) NOT NULL,
    departureDate DATE NOT NULL,
    departureTime VARCHAR(50) NOT NULL,
    numberOfPeople INT NOT NULL,
    totalCost DOUBLE,
    submittedOn DATE NOT NULL,
    comments TINYTEXT,
    hotelId INT NOT NULL,
    agencyId INT NOT NULL,
    PRIMARY KEY (reservationId),
    FOREIGN KEY (hotelId)
        REFERENCES Hotel (hotelId),
    FOREIGN KEY (agencyId)
        REFERENCES Agency (agencyId)
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
                            
 /*DROP TABLE Payment;*/            
CREATE TABLE Payment (
    paymentId INT NOT NULL,
    responsible VARCHAR(50),
    date DATETIME,
    method BOOLEAN,
    card VARCHAR(50),
    amount DOUBLE,
    reservationId INT NOT NULL,
    PRIMARY KEY (paymentID),
    FOREIGN KEY (reservationId)
        REFERENCES Reservation (reservationId)
);
            
/*DROP TABLE Room;*/
CREATE TABLE Room (
    number INT NOT NULL,
    hotelId INT NOT NULL,
    type VARCHAR(30),
    floor INT,
    PRIMARY KEY (number , hotelId),
    FOREIGN KEY (hotelId)
        REFERENCES Hotel (hotelId)
);

/*DROP TABLE Criterion;*/
CREATE TABLE Criterion (
	criterionId INT NOT NULL,
    name VARCHAR(50),
    min INT,
    max INT, 
	hotelId INT,
    PRIMARY KEY (criterionId),
    FOREIGN KEY (hotelId)
		REFERENCES Hotel(hotelId)
);

/*DROP TABLE Assessment;*/
CREATE TABLE Assessment (
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
    hotelId INT NOT NULL,
    serviceId INT NOT NULL,
    PRIMARY KEY (hotelId , serviceId),
    FOREIGN KEY (hotelId)
        REFERENCES Hotel (hotelId),
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
			             
 /*DROP TABLE Assessment_Criterion;*/ 
CREATE TABLE Assessment_Criterion (
    criterionId INT NOT NULL,
    score INT NOT NULL,
    datetime DATETIME NOT NULL,
    PRIMARY KEY (datetime),
    FOREIGN KEY (criterionId)
        REFERENCES Criterion (criterionId)
);
            
            
