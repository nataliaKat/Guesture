USE ismgroup30;
/*DROP TABLE Hotel;*/
CREATE TABLE Hotel(
             HotelId INT NOT NULL,
             Name VARCHAR (50) NOT NULL,
             Address VARCHAR (50) NOT NULL,
             PhoneNumber INT NOT NULL,
             Head VARCHAR (50) NOT NULL,
             Logo VARCHAR (50) NOT NULL,
             Discription TINYTEXT,
             PRIMARY KEY (HotelId));
             
/*DROP TABLE Agency;*/ 
CREATE TABLE Agency(
             AgencyId INT NOT NULL,
             Name VARCHAR (50) NOT NULL,
             Telephone INT NOT NULL,
             Mail VARCHAR (50) NOT NULL,
             VatNumber VARCHAR (50) NOT NULL,
             RegistrationDate DATE,
             PRIMARY KEY (AgencyId));
             
/*DROP TABLE Reservation;*/    
CREATE TABLE Reservation(
             ReservationId INT NOT NULL,
             ArrivalDate DATE NOT NULL,
             ArrivalTime TIME NOT NULL,
             DepartureDate DATE NOT NULL,
             DepartureTime TIME NOT NULL,
             NumberOfPeople INT NOT NULL,
             TotalCost DOUBLE,
             SubmittedOn DATE NOT NULL,
             Comments TINYTEXT,
             HotelId INT NOT NULL,
             AgencyId INT NOT NULL,
             PRIMARY KEY (ReservationId),
             FOREIGN KEY (HotelId) REFERENCES Hotel(HotelId),
             FOREIGN KEY (AgencyId) REFERENCES Agency(AgencyId));
             
             
             
             
            
             
             
             

