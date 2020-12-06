USE ismgroup30;

DROP TABLE Review_Criterion; 
DROP TABLE Reservation_Service;
DROP TABLE Customer_Room;
DROP TABLE RoomType;
DROP TABLE Review;
DROP TABLE Criterion;
DROP TABLE Room;
DROP TABLE Group_Customer;             
DROP TABLE Service;
DROP TABLE Reservation;  
DROP TABLE Agency; 
DROP TABLE Hotel;
DROP TABLE User;

CREATE TABLE User (
    username VARCHAR(20) NOT NULL,
    password VARCHAR(30),
    role VARCHAR(30),
    PRIMARY KEY (username)
);

CREATE TABLE Hotel (
    username VARCHAR(20) NOT NULL,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phoneNumber VARCHAR(50) NOT NULL,
    head VARCHAR(50) NOT NULL,
    description TINYTEXT,
    FOREIGN KEY (username)
        REFERENCES User (username)
);

CREATE TABLE Agency (
    name VARCHAR(50) NOT NULL,
    telephone VARCHAR(50) NOT NULL,
    mail VARCHAR(50) NOT NULL,
    vatNumber VARCHAR(50) NOT NULL,
    registrationDate DATE,
    username VARCHAR(20) NOT NULL,
    FOREIGN KEY (username)
		REFERENCES User (username)
);
             
CREATE TABLE Reservation (
    reservationId INT NOT NULL auto_increment,
    arrivalDate DATE NOT NULL,
    arrivalTime VARCHAR(50) NOT NULL,
    departureDate DATE NOT NULL,
    departureTime VARCHAR(50) NOT NULL,
    numberOfPeople INT NOT NULL,
    totalCost DOUBLE,
    submittedOn DATE NOT NULL,
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

CREATE TABLE Service (
    serviceId INT NOT NULL auto_increment,
    name VARCHAR(50),
    hotel_username varchar(50),
    PRIMARY KEY (serviceId),
    FOREIGN KEY (hotel_username)
		REFERENCES Hotel (username)
);
             
CREATE TABLE Group_Customer (
    customerId INT NOT NULL auto_increment,
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
                            
CREATE TABLE Room (
    number INT NOT NULL,
    username VARCHAR(20) NOT NULL,
    type VARCHAR(30),
    floor INT,
    PRIMARY KEY (number , username),
    FOREIGN KEY (username)
        REFERENCES Hotel (username)
);

CREATE TABLE Criterion (
	criterionId INT NOT NULL auto_increment,
    name VARCHAR(50),
    min INT,
    max INT, 
	username VARCHAR(20) NOT NULL,
    PRIMARY KEY (criterionId),
    FOREIGN KEY (username)
		REFERENCES Hotel (username)
);

CREATE TABLE Review (
	datetime DATETIME NOT NULL,
    comments VARCHAR(250),
    reservationId INT,
    PRIMARY KEY (datetime),
    FOREIGN KEY (reservationId)
		REFERENCES Reservation (reservationId)
);

CREATE TABLE RoomType (
	type VARCHAR(50) NOT NULL,
    numberOfRooms INT,
    price DOUBLE,
    reservationId INT,
    PRIMARY KEY (type, reservationId),
    FOREIGN KEY (reservationId)
		REFERENCES Reservation (reservationId) 
);

CREATE TABLE Customer_Room (
	customerId INT NOT NULL,
    number INT NOT NULL,
    PRIMARY KEY (customerId, number),
    FOREIGN KEY (customerId)
		REFERENCES Group_Customer (customerId),
	FOREIGN KEY (number)
		REFERENCES Room (number)
);             
             
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

INSERT INTO Hotel (username, name, address, phoneNumber, head, description)
VALUES ('luxury@gmail.com', 'Luxury', 'Ροδόπης 4, Κομοτηνή', '2565241236', 'Ανδρέας Γεωργίου', ''),
	   ('marysrooms@yahoo.com', 'Marys Rooms', 'Κολοκοτρώνη 40, Βόλος', '2152365236', 'Ελένη Παπαδοπούλου', ''),
       ('acropolisv@gmail.com', 'Acropolis View Hotel', 'Ανδριανού 50, Πλάκα', '2194526325', 'Γιώργος Λινός', ''),
       ('homepoetry@gmail.com', 'Home and Poetry', 'Ερμού 114, Αθήνα', '2198545632', 'Δήμητρα Σωτηρίου', ''),
       ('sweethome@yahoo.com', 'Sweet Home Hotel', 'Κανάρη 56, Θησείο', '1254563289', 'Chris Green', ''),
       ('iraklion@gmail.com', 'Iraklion Hotel', 'Καλοκαιρινού 128, Ηράκλειο', '2563245639', 'Σωτήρης Φανταράκης', ''),
       ('portoven@gmail.com', 'Porto Veneziano Hotel', 'Ακτή Ενώσεως και Γλαύκου, Χανιά', '2569685632', 'Μαρία Κωσταντάκη', '');
            
INSERT INTO Agency (name, telephone, mail, vatNumber, registrationDate, username)
VALUES ('Holidays', '2562532145', 'holidays@gmail.com', 'GR52125232', '2008-10-16', 'holidays@gmail.com'),
        ('Memorable Trips', '2152025458', 'memorablet@yahoo.com', 'GR85426312', '2008-12-19','memorablet@yahoo.com'),
        ('Orea Komotini', '2115256342', 'oreakomot@gmail.com', 'GR10205623', '2020-10-02', 'oreakomot@gmail.com'),
        ('Pame Diakopes', '2102587965', 'pamediak@yahoo.com', 'GR10854569', '2008-12-13', 'pamediak@yahoo.com'),
        ('Pame Ekdromi', '2152545857', 'pamekromi@gmail.com', 'GR45137291', '2009-01-12', 'pamekromi@gmail.com'),
        ('Peripatos', '2125245857', 'peripatos@yahoo.com', 'GR78451263', '2012-08-06', 'peripatos@yahoo.com'),
        ('Planet', '2105428536', 'planet@gmail.com', 'GR78562380', '2012-12-02', 'planet@gmail.com'),
        ('Planning Trips', '1524585796', 'plantrips@gmail.com', 'GR78234130', '2012-12-18', 'plantrips@gmail.com'),
        ('Summer Trips', '2563245236', 'summer@yahoo.com', 'GR47639420', '2010-03-17', 'summer@yahoo.com'),
        ('Taxidi', '2152442258', 'taxidi@gmail.com', 'GR12037812', '2008-11-28', 'taxidi@gmail.com'),
        ('Taxidiotiko', '2514587968', 'taxidiot@gmail.com','GR84239712', '2009-09-15', 'taxidiot@gmail.com'),
        ('Tour', '2142585796', 'tours@gmail.com', 'GR85246253', '2010-10-14', 'tours@gmail.com'),
        ('Travel', '2104258892', 'travel@gmail.com', 'GR45282365', '2011-07-25', 'travel@gmail.com'),
        ('Travelling 24', '2174859565', 'travelling@gmail.com', 'GR45852360', '2012-09-23', 'travelling@gmail.com'),
        ('Vacation', '2152545225', 'vacay@yahoo.com', 'GR15214563', '2013-03-03', 'vacay@yahoo.com');
        
        
INSERT INTO Reservation (arrivalDate, arrivalTime, departureDate, departureTime, numberOfPeople, totalCost, submittedOn, checkin, chekout, username_hotel, username_agency)
VALUES  ('2020-12-12', 'morning', '2020-12-20', 'morning', 32, 1000.99, '2020-11-10', FALSE, FALSE, 'luxury@gmail.com', 'holidays@gmail.com'),
('2020-12-23', 'evening', '2021-01-03', 'morning', 21, 865.32, '2020-11-29', TRUE, FALSE, 'iraklion@gmail.com', 'vacay@yahoo.com'),
('2020-12-23', 'evening', '2021-01-03', 'morning', 45, 865.32, '2020-11-29', TRUE, FALSE, 'sweethome@yahoo.com', 'travel@gmail.com'),
('2020-12-12', 'morning', '2020-12-20', 'evening', 29, 1000.99, '2020-11-10', FALSE, FALSE, 'sweethome@yahoo.com', 'taxidiot@gmail.com'),
('2020-11-29', 'evening', '2020-12-05', 'evening', 32, 1623.99, '2020-11-10', TRUE, FALSE, 'sweethome@yahoo.com', 'holidays@gmail.com'),
('2020-12-30', 'evening', '2021-01-03', 'morning', 35, 1789.95, '2020-11-13', TRUE, FALSE, 'sweethome@yahoo.com', 'peripatos@yahoo.com'),
('2020-11-30', 'evening', '2021-01-03', 'morning', 35, 421.95, '2020-11-13', TRUE, FALSE, 'sweethome@yahoo.com', 'memorablet@yahoo.com'),
('2020-12-30', 'evening', '2021-01-03', 'morning', 35, 652.99, '2020-11-13', TRUE, TRUE, 'homepoetry@gmail.com', 'oreakomot@gmail.com') ;      
            
INSERT INTO Service (name, hotel_username) VALUES ('Fishing','sweethome@yahoo.com'),
('Fishing','iraklion@gmail.com'),
('Breakfast','iraklion@gmail.com'),
('Breakfast','luxury@gmail.com'),
('Breakfast','marysrooms@yahoo.com'),
('Breakfast','sweethome@yahoo.com'),
('Breakfast','portoven@gmail.com'),
('Lunch','homepoetry@gmail.com'),
('Lunch','acropolisv@gmail.com'),
('Sightseeing','iraklion@gmail.com'),
('Sightseeing','acropolisv@gmail.com'),
('Sightseeing','portoven@gmail.com'),
('Massage & Spa','homepoetry@gmail.com'),
('Horse Riding','marysrooms@yahoo.com'),
('Horse Riding','portoven@gmail.com');

INSERT INTO Group_Customer (name, surname, telephone, email, identityNumber, reservationId)
VALUES ('Angeliki', 'Papadopoulou', '6947852369', 'angpapadop@gmail.com', 'AH859632', 1),
('Maria', 'Iwannidou', '6985214789', 'mariwan@hotmail.com', 'AZ8574152', 1),
('Panagiwths', 'Spyrou', 6932145823, 'panspyrou@gmail.com', 'AK963219', 1),
('Katerina', 'Kalogerakh', '6952391768', 'katekalog@gmail.com', 'AH851793', 1),
('Stavroula', 'Kalergh', '6954712695', 'kalerghhhh@hotmail.com', 'AX223964', 1),
('Alexis', 'Kwstopoulos', '697235648', 'alexkwst@gmail.com', 'AH765542', 2),
('Ahilleas', 'Gewrgiou', '6928346635', 'ahilleasgewr@hotmail.gr', 'AK932647', 2),
('Aristeidhs', 'Nikolaou', '6921053678', 'aristnikol@gmail.com', 'AM371420', 2),
('Kleiw', 'Vasilopoulou', '6930806004', 'kleiwvas@gmail.com', 'AH659841', 2),
('Foivos', 'Maroglou', '6975263104', 'foivmar@hotmail.com', 'AK203691', 2);

INSERT INTO Room (number, username, type, floor)
VALUES (101, 'luxury@gmail.com', 'single', 1),
(710, 'iraklion@gmail.com', 'double', 7),
(405, 'sweethome@yahoo.com', 'single', 4),
(307, 'luxury@gmail.com', 'triple', 3),
(505, 'homepoetry@gmail.com', 'double', 5),
(208, 'iraklion@gmail.com', 'double', 2),
(401, 'marysrooms@yahoo.com', 'triple', 4),
(610, 'iraklion@gmail.com', 'quad', 6),
(303, 'luxury@gmail.com', 'quad', 3),
(106, 'luxury@gmail.com', 'double', 1);

INSERT INTO Criterion (name, min, max, username)
VALUES ('Cleanness', 1, 10, 'luxury@gmail.com'),
('Reception staff', 1, 10, 'luxury@gmail.com'),
('Comfort', 1, 10, 'luxury@gmail.com'),
('Comfort', 1, 5,'iraklion@gmail.com'),
('Prices', 1, 5, 'iraklion@gmail.com'), 
('Breakfast', 1, 5, 'iraklion@gmail.com'),
('Cleanness', 1, 100, 'homepoetry@gmail.com');

INSERT INTO Review (datetime, comments, reservationId)
VALUES ('2020-07-10 14:55:30', 'Reception staff were friendly, rooms not clean enough', 1),
('2020-07-05 13:25:42', 'Breakfast was great, rooms were cold', 2),
('2020-06-29 10:36:51', 'TV broken in 3 rooms', 3),
('2020-06-25 17:19:19', 'Customers not satisfied from lunch', 4),
('2020-05-27 22:09:52', 'Great experience at your hotel!', 5),
('2020-05-16 20:15:36', 'prices too high!', 6),
('2020-05-04 11:45:26', 'excellent stay at your hotel', 7);

INSERT INTO Roomtype (type, numberOfRooms, price, reservationId)
VALUES ('single', 5, 155.60, 1),
('double', 10, 500, 1),
('triple', 2, 120.50, 1),
('single', 7, 215.30, 2),
('double', 3, 155.70, 2),
('triple', 1, 60.50, 2),
('quad', 1, 140.20, 2),
('double', 6, 325.75, 3),
('triple', 10, 750.25, 3),
('single', 15, 475.80, 4),
('triple', 5, 360.30, 4), 
('quad', 3, 205.10, 4);

INSERT INTO Customer_Room (customerId, number)
VALUES (1, 101),
(2, 101),
(3, 106),
(4, 208),
(5, 208),
(6, 307),
(7, 505),
(8, 405);

INSERT INTO Reservation_Service (reservationId, serviceId, value) 
VALUES (1, 1, TRUE),
(1, 2, FALSE),
(1, 4, TRUE),
(2, 1, TRUE), 
(2, 2, FALSE),
(2, 4, FALSE);

INSERT INTO Review_Criterion (criterionId, score, datetime)
VALUES (1, 10, '2020-07-05 13:25:42'),
(2, 7, '2020-06-05 13:25:42'), 
(4, 3, '2020-05-27 22:09:52'), 
(7, 50, '2020-05-04 11:45:26'), 
(7, 70, '2020-06-25 17:19:19'),
(6, 4,'2020-05-16 20:15:36'),
(5, 5, '2020-06-29 10:36:51');












