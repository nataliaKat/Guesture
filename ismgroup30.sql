USE ismgroup30;
SHOW DATABASES;

SET FOREIGN_KEY_CHECKS=1;
/*DROP TABLE User;*/
CREATE TABLE User (
    username VARCHAR(20) NOT NULL,
    password VARCHAR(30),
    role VARCHAR(30),
    PRIMARY KEY (username)
);

/*DROP TABLE Hotel;*/
CREATE TABLE Hotel (
    username VARCHAR(20) NOT NULL,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phoneNumber BIGINT NOT NULL,
    head VARCHAR(50) NOT NULL,
    logo VARCHAR(50) NOT NULL,
    description TINYTEXT,
    FOREIGN KEY (username)
        REFERENCES User (username)
);

/*DROP TABLE Agency;*/ 
CREATE TABLE Agency (
    name VARCHAR(50) NOT NULL,
    telephone BIGINT NOT NULL,
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
    arrivalDate DATE NOT NULL,
    arrivalTime VARCHAR(50) NOT NULL,
    departureDate DATE NOT NULL,
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


/*INSERTS*/
INSERT INTO User(username, password, role)
VALUES ('luxury@gmail.com', '11111', 'Hotel'),
       ('marysrooms@yahoo.com', '14523', 'Hotel'),
       ('acropolisv@gmail.com', '45236', 'Hotel'),
       ('homepoetry@gmail.com', '15236', 'Hotel'),
       ('sweethome@yahoo.com', '78562', 'Hotel'),
       ('iraklion@gmail.com', '12546', 'Hotel'),
       ('portoven@gmail.com', '45623', 'Hotel'),
       ('oreakomot@gmail.com', '45638', 'Agency'),
       ('pamediak@yahoo.com', '45821', 'Agency'),
       ('peripatos@yahoo.com', '45629', 'Agency'),
       ('planet@gmail.com', '78542', 'Agency'),
       ('plantrips@gmail.com', '85479', 'Agency'),
       ('pamekromi@gmail.com', '428510', 'Agency'),
       ('summer@yahoo.com', '45845', 'Agency'),
       ('taxidi@gmail.com', '45879', 'Agency'),
       ('holidays@gmail.com', '56458', 'Agency'),
       ('memorablet@yahoo.com', '87452', 'Agency'),
       ('taxidiot@gmail.com', '85743', 'Agency'),
       ('tours@gmail.com', '52169', 'Agency'),
       ('travel@gmail.com', '40236', 'Agency'),
       ('travelling@gmail.com', '10258', 'Agency'),
       ('vacay@yahoo.com', '20789', 'Agency');

INSERT INTO Hotel (username, name, address, phoneNumber, head, logo, description)
VALUES ('luxury@gmail.com', 'Luxury', 'Ροδόπης 4, Κομοτηνή', 2565241236, 'Ανδρέας Γεωργίου', 'Lux', ''),
	   ('marysrooms@yahoo.com', 'Marys Rooms', 'Κολοκοτρώνη 40, Βόλος', 2152365236, 'Ελένη Παπαδοπούλου', 'MRooms', ''),
       ('acropolisv@gmail.com', 'Acropolis View Hotel', 'Ανδριανού 50, Πλάκα', 2194526325, 'Γιώργος Λινός', 'AVH', ''),
       ('homepoetry@gmail.com', 'Home and Poetry', 'Ερμού 114, Αθήνα', 2198545632, 'Δήμητρα Σωτηρίου', 'Home & Poetry', ''),
       ('sweethome@yahoo.com', 'Sweet Home Hotel', 'Κανάρη 56, Θησείο', 1254563289, 'Chris Green', 'SW', ''),
       ('iraklion@gmail.com', 'Iraklion Hotel', 'Καλοκαιρινού 128, Ηράκλειο', 2563245639, 'Σωτήρης Φανταράκης', 'Iraklion', ''),
       ('portoven@gmail.com', 'Porto Veneziano Hotel', 'Ακτή Ενώσεως και Γλαύκου, Χανιά', 2569685632, 'Μαρία Κωσταντάκη', 'Porto Veneziano', '');
            
INSERT INTO Agency (name, telephone, mail, vatNumber, registrationDate, username)
VALUES ('Holidays', 2562532145, 'holidays@gmail.com', 'GR52125232', '2008-10-16', 'holidays@gmail.com'),
        ('Memorable Trips', 2152025458, 'memorablet@yahoo.com', 'GR85426312', '2008-12-19','memorablet@yahoo.com'),
        ('Orea Komotini', 2115256342, 'oreakomot@gmail.com', 'GR10205623', '2020-10-02', 'oreakomot@gmail.com'),
        ('Pame Diakopes', 2102587965, 'pamediak@yahoo.com', 'GR10854569', '2008-12-13', 'pamediak@yahoo.com'),
        ('Pame Ekdromi', 2152545857, 'pamekromi@gmail.com', 'GR45137291', '2009-01-12', 'pamekromi@gmail.com'),
        ('Peripatos', 2125245857, 'peripatos@yahoo.com', 'GR78451263', '2012-08-06', 'peripatos@yahoo.com'),
        ('Planet', 2105428536, 'planet@gmail.com', 'GR78562380', '2012-12-02', 'planet@gmail.com'),
        ('Planning Trips', 1524585796, 'plantrips@gmail.com', 'GR78234130', '2012-12-18', 'plantrips@gmail.com'),
        ('Summer Trips', 2563245236, 'summer@yahoo.com', 'GR47639420', '2010-03-17', 'summer@yahoo.com'),
        ('Taxidi', 2152442258, 'taxidi@gmail.com', 'GR12037812', '2008-11-28', 'taxidi@gmail.com'),
        ('Taxidiotiko', 2514587968, 'taxidiot@gmail.com','GR84239712', '2009-09-15', 'taxidiot@gmail.com'),
        ('Tour', 2142585796, 'tours@gmail.com', 'GR85246253', '2010-10-14', 'tours@gmail.com'),
        ('Travel', 2104258892, 'travel@gmail.com', 'GR45282365', '2011-07-25', 'travel@gmail.com'),
        ('Travelling 24', 2174859565, 'travelling@gmail.com', 'GR45852360', '2012-09-23', 'travelling@gmail.com'),
        ('Vacation', 2152545225, 'vacay@yahoo.com', 'GR15214563', '2013-03-03', 'vacay@yahoo.com');
        
        
INSERT INTO Reservation (arrivalDate, arrivalTime, departureDate, departureTime, numberOfPeople, totalCost, submittedOn, comments, checkin, chekout, username_hotel, username_agency)
VALUES  ('2020-12-12', 'morning', '2020-12-20', 'morning', 32, 1000.99, '2020-11-10', 'All the rooms should be triples', FALSE, FALSE, 'luxury@gmail.com', 'holidays@gmail.com'),
('2020-12-23', 'evening', '2021-01-03', 'morning', 21, 865.32, '2020-11-29', 'Vegan menu for 3 customers', TRUE, FALSE, 'iraklion@gmail.com', 'vacay@yahoo.com'),
('2020-12-23', 'evening', '2021-01-03', 'morning', 45, 865.32, '2020-11-29', 'Vegan menu for 5 customers', TRUE, FALSE, 'sweethome@yahoo.com', 'travel@gmail.com'),
('2020-12-12', 'morning', '2020-12-20', 'evening', 29, 1000.99, '2020-11-10', 'All the rooms should be triples', FALSE, FALSE, 'sweethome@yahoo.com', 'taxidiot@gmail.com'),
('2020-11-29', 'evening', '2020-12-05', 'evening', 32, 1623.99, '2020-11-10', 'All the rooms should be doubles', TRUE, FALSE, 'sweethome@yahoo.com', 'holidays@gmail.com'),
('2020-12-30', 'evening', '2021-01-03', 'morning', 35, 1789.95, '2020-11-13', 'All the rooms should be doubles', TRUE, FALSE, 'sweethome@yahoo.com', 'peripatos@yahoo.com'),
('2020-11-30', 'evening', '2021-01-03', 'morning', 35, 421.95, '2020-11-13', 'All the rooms should be doubles', TRUE, FALSE, 'sweethome@yahoo.com', 'memorablet@yahoo.com'),
('2020-12-30', 'evening', '2021-01-03', 'morning', 35, 652.99, '2020-11-13', 'All the rooms should be triples', TRUE, TRUE, 'homepoetry@gmail.com', 'oreakomot@gmail.com') ;      
            
            
