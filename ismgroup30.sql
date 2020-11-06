USE ismgroup30;
SHOW DATABASES;
/*DROP TABLE Hotel;*/
CREATE TABLE Hotel (
    hotelId INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phoneNumber INT NOT NULL,
    Head VARCHAR(50) NOT NULL,
    logo VARCHAR(50) NOT NULL,
    discription TINYTEXT,
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
    PRIMARY KEY (agencyId)
);
             
/*DROP TABLE Reservation;*/    
CREATE TABLE Reservation (
    reservationId INT NOT NULL,
    arrivalDate DATE NOT NULL,
    arrivalTime TIME NOT NULL,
    departureDate DATE NOT NULL,
    departureTime TIME NOT NULL,
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
            
/*DROP TABLE Payment;*/
CREATE TABLE Room (
    number INT NOT NULL,
    hotelId INT NOT NULL,
    type VARCHAR(30),
    floor INT,
    PRIMARY KEY (number , hotelId),
    FOREIGN KEY (hotelId)
        REFERENCES Hotel (hotelId)
);

