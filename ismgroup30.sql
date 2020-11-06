USE ismgroup30;
SHOW DATABASES;
/*DROP TABLE Hotel;*/
CREATE TABLE Hotel(
             hotelId INT NOT NULL,
             name VARCHAR (50) NOT NULL,
             address VARCHAR (50) NOT NULL,
             phoneNumber INT NOT NULL,
             Head VARCHAR (50) NOT NULL,
             logo VARCHAR (50) NOT NULL,
             discription TINYTEXT,
             PRIMARY KEY (hotelId));
             
/*DROP TABLE Agency;*/ 
CREATE TABLE Agency(
             agencyId INT NOT NULL,
             name VARCHAR (50) NOT NULL,
             telephone INT NOT NULL,
             mail VARCHAR (50) NOT NULL,
             vatNumber VARCHAR (50) NOT NULL,
             registrationDate DATE,
             PRIMARY KEY (agencyId));
             
/*DROP TABLE Reservation;*/    
CREATE TABLE Reservation(
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
             FOREIGN KEY (hotelId) REFERENCES Hotel(hotelId),
             FOREIGN KEY (agencyId) REFERENCES Agency(agencyId));
             
             
             
             
            
             
             
             

