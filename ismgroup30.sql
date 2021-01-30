USE ismgroup30;
 
DROP TABLE Reservation_Service;
DROP TABLE GroupCustomer;   
DROP TABLE Grouping;
DROP TABLE Room;
DROP TABLE Service;
DROP TABLE Reservation;  
DROP TABLE Agency; 
DROP TABLE Hotel;
DROP TABLE User;


CREATE TABLE User (
    username VARCHAR(100) NOT NULL,
    password VARCHAR(100),
    PRIMARY KEY (username)
);

CREATE TABLE Hotel (
    username VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phoneNumber VARCHAR(50) NOT NULL,
    head VARCHAR(100) NOT NULL,
    description VARCHAR(10000),
    priceSingle DOUBLE NOT NULL,
    priceDouble DOUBLE NOT NULL,
    priceTriple DOUBLE NOT NULL,
    priceQuadruple DOUBLE NOT NULL,
    photo_url VARCHAR(10000),
    FOREIGN KEY (username)
        REFERENCES User (username)
);
CREATE TABLE Agency (
    name VARCHAR(100) NOT NULL,
    telephone VARCHAR(50) NOT NULL,
    mail VARCHAR(100) NOT NULL,
    vatNumber VARCHAR(50) NOT NULL,
    registrationDate DATE,
    username VARCHAR(100) NOT NULL,
    FOREIGN KEY (username)
		REFERENCES User (username)
);
             
CREATE TABLE Reservation (
    reservationId INT NOT NULL auto_increment,
    arrivalDate DATE NOT NULL,
    arrivalTime VARCHAR(50) NOT NULL,
    departureDate DATE NOT NULL,
    departureTime VARCHAR(50) NOT NULL,
    submittedOn DATE NOT NULL,
    checkin BOOLEAN DEFAULT FALSE,
    chekout BOOLEAN DEFAULT FALSE,
    singleRooms INT NOT NULL, 
    doubleRooms INT NOT NULL,
	tripleRooms INT NOT NULL,
    quadrupleRooms INT NOT NULL,
    confirmed BOOLEAN,
    comments VARCHAR(1000),
    username_hotel VARCHAR(100) NOT NULL,
    username_agency VARCHAR(100) NOT NULL,
    PRIMARY KEY (reservationId),
    FOREIGN KEY (username_hotel)
        REFERENCES Hotel (username),
    FOREIGN KEY (username_agency)
        REFERENCES Agency (username)
);

CREATE TABLE Service (
    serviceId INT NOT NULL auto_increment,
    name VARCHAR(50),
    hotel_username varchar(100),
    PRIMARY KEY (serviceId),
    FOREIGN KEY (hotel_username)
		REFERENCES Hotel (username)
);
                                        
CREATE TABLE Room (
	roomId INT NOT NULL auto_increment,
    number INT NOT NULL,
    username VARCHAR(100) NOT NULL,
    type VARCHAR(30),
    floor INT,
    PRIMARY KEY (roomId),
    FOREIGN KEY (username)
        REFERENCES Hotel (username)
);

CREATE TABLE Grouping (
	groupingId INT NOT NULL auto_increment,
    roomId INT,
    reservationId INT NOT NULL,
	PRIMARY KEY(groupingId),
    FOREIGN KEY (roomId)
		REFERENCES Room (roomId),
     FOREIGN KEY (reservationId)
		REFERENCES Reservation (reservationId) 
        ON DELETE CASCADE
);         

CREATE TABLE GroupCustomer (
    customerId INT NOT NULL auto_increment,
    name VARCHAR(100),
    surname VARCHAR(100),
    telephone VARCHAR(50),
    email VARCHAR(100),
    identityNumber VARCHAR(50),
    groupingId INT NOT NULL,
    PRIMARY KEY (customerId),
	FOREIGN KEY (groupingId)
        REFERENCES Grouping (groupingId) 
        ON DELETE CASCADE
);
             
CREATE TABLE Reservation_Service (
    reservationId INT NOT NULL,
    serviceId INT NOT NULL,
    PRIMARY KEY (reservationId , serviceId),
    FOREIGN KEY (reservationId)
        REFERENCES Reservation (reservationId)
        ON DELETE CASCADE,
    FOREIGN KEY (serviceId)
        REFERENCES Service (serviceId)
);


/*INSERTS*/
INSERT INTO User(username, password)
VALUES ('luxury@gmail.com', '11111'),
       ('marysrooms@yahoo.com', '14523'),
       ('acropolisv@gmail.com', '45236'),
       ('homepoetry@gmail.com', '15236'),
       ('sweethome@yahoo.com', '78562'),
       ('iraklion@gmail.com', '12546'),
       ('portoven@gmail.com', '45623'),
       ('oreakomot@gmail.com', '45638'),
       ('pamediak@yahoo.com', '45821'),
       ('peripatos@yahoo.com', '45629'),
       ('planet@gmail.com', '78542'),
       ('plantrips@gmail.com', '85479'),
       ('pamekromi@gmail.com', '428510'),
       ('summer@yahoo.com', '45845'),
       ('taxidi@gmail.com', '45879'),
       ('holidays@gmail.com', '56458'),
       ('memorablet@yahoo.com', '87452'),
       ('taxidiot@gmail.com', '85743'),
       ('tours@gmail.com', '52169'),
       ('travel@gmail.com', '40236'),
       ('travelling@gmail.com', '10258'),
       ('vacay@yahoo.com', '20789');

INSERT INTO Hotel (username, name, address, phoneNumber, head, description, priceSingle, priceDouble, priceTriple, priceQuadruple, photo_url)
VALUES ('luxury@gmail.com', 'Luxury', 'Ροδόπης 4, Κομοτηνή', '2565241236', 'Ανδρέας Γεωργίου', 'An amazing hotel in the center of Komotini, near the square, with amazing view, friendly reception staff and a very warm atmosphere! An excellent choice for families with children! We guarantee you will have the time of your life! Visit us!', 35.50, 50.00, 75.50, 100.00, "https://i2.wp.com/itravelling.gr/wp-content/uploads/2019/08/Patriarca_AriaHotels_1.jpg?resize=1140%2C700&ssl=1"),
	   ('marysrooms@yahoo.com', 'Marys Rooms', 'Κολοκοτρώνη 40, Βόλος', '2152365236', 'Ελένη Παπαδοπούλου', 'Beautiful apartments in the city of Volos. Enjoy the quiet and friendly city in our modern apartments.', 30.00, 45.50, 60.00, 85.50, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGsjT9APoUYnGw2dajCInA4qXu6hNpal6QOA&usqp=CAU"),
       ('acropolisv@gmail.com', 'Acropolis View Hotel', 'Ανδριανού 50, Πλάκα', '2194526325', 'Γιώργος Λινός', '', 50.00, 75.50, 100.00, 130.00, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnZyIZM4HWe-GkpeTUcuAZmVuHuuIWQJJUQg&usqp=CAU"),
       ('homepoetry@gmail.com', 'Home and Poetry', 'Ερμού 114, Αθήνα', '2198545632', 'Δήμητρα Σωτηρίου', 'Ξενοδοχείο στο ιστορικό κέντρο της Αθήνας, μόλις 5 λεπτά από την κεντρική πλατεία Συντάγματος. Θα μείνετε ευχαριστημένοι από τις ανέσεις του ξενοδοχείου μας. Ελπίζουμε να απολαύσετε τις ομορφιές της Αθήνας!', 45.00, 63.50, 80.00, 105.50, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQba19kiOBlMoLonQlOs5AyBlw9rB7w1Bplxw&usqp=CAU"),
       ('sweethome@yahoo.com', 'Sweet Home Hotel', 'Κανάρη 56, Θησείο', '1254563289', 'Chris Green', 'Το πιο φιλόξενο ξενοδοχείο στο κέντρο της Αθήνας, με θέα στην Ακρόπολη και προσιτές τιμές.', 40.00, 55.50, 70.00, 100.00, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGqIP-ZOpHOLxxcNuldZ2ol1AquRmwBz3Bgw&usqp=CAU"),
       ('iraklion@gmail.com', 'Iraklion Hotel', 'Καλοκαιρινού 128, Ηράκλειο', '2563245639', 'Σωτήρης Φανταράκης', 'Enjoy your stay in the beautiful island of Crete!!! Activities as fishing, breakfast, tour of the island available!', 30.50, 40.50, 51.50, 65.00, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5T7W8bIylI6_RBfgeO2E9e-kB-rcKYacWXA&usqp=CAU"),
       ('portoven@gmail.com', 'Porto Veneziano Hotel', 'Ακτή Ενώσεως και Γλαύκου, Χανιά', '2569685632', 'Μαρία Κωσταντάκη', 'Visit Crete!', 37.50, 45.00, 52.50, 65.00, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUQ0px1iPAM2aNErpkn_3ih27Y-sBR_HHNYA&usqp=CAU");
            
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
        
        
INSERT INTO Reservation (arrivalDate, arrivalTime, departureDate, departureTime, submittedOn, checkin, chekout, singleRooms, doubleRooms, tripleRooms, quadrupleRooms, confirmed, comments, username_hotel, username_agency)
VALUES  ('2020-12-12', 'morning', '2020-12-20', 'morning', '2020-11-10', FALSE, FALSE, 10, 10, 5, 5, TRUE, "Θέα σε όλα τα δωμάτια", 'sweethome@yahoo.com', 'holidays@gmail.com'),
('2020-12-23', 'evening', '2021-01-03', 'morning', '2020-11-29', FALSE, FALSE, 15, 15, 10, 5, FALSE, " ", 'iraklion@gmail.com', 'vacay@yahoo.com'),
('2020-12-23', 'evening', '2021-01-03', 'morning', '2020-11-29', TRUE, FALSE, 7, 5, 3, 1, TRUE, "Θα προτιμούσαμε να υπάρχει θέα σε όλα τα δωμάτια και να είναι στον ίδιο όροφο.", 'sweethome@yahoo.com', 'travel@gmail.com'),
('2020-12-12', 'morning', '2020-12-20', 'evening', '2020-11-10', FALSE, FALSE, 10, 3, 5, 5,TRUE, "Πρόκειται για μαθητές γ' λυκείου.", 'sweethome@yahoo.com', 'taxidiot@gmail.com'),
('2020-11-29', 'evening', '2020-12-05', 'evening', '2020-11-10', FALSE, FALSE, 4, 1, 2, 0, FALSE, "Customers do not speak Greek", 'sweethome@yahoo.com', 'holidays@gmail.com'),
('2020-12-30', 'evening', '2021-01-03', 'morning', '2020-11-13', TRUE, FALSE, 10, 10, 7, 1, TRUE, "Μία πελάτισσα έχει αλλεργία στους ξηρούς καρπούς.", 'sweethome@yahoo.com', 'peripatos@yahoo.com'),
('2020-11-30', 'evening', '2021-01-03', 'morning', '2020-11-13', TRUE, TRUE, 6, 12, 7, 5, TRUE, "Πρόκειται για ΚΑΠΗ οπότε θα εκτιμούσαμε ιδιαίτερα να υπάρχει ησυχία στον όροφο.", 'sweethome@yahoo.com', 'memorablet@yahoo.com'),
('2020-12-30', 'evening', '2021-01-03', 'morning', '2020-11-13', FALSE, FALSE, 15, 15, 10, 5, FALSE, " ", 'homepoetry@gmail.com', 'holidays@gmail.com') ;      
            
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
('Spa','sweethome@yahoo.com'),
('Horse Riding','portoven@gmail.com');

INSERT INTO Room (number, username, type, floor)
VALUES (101, 'luxury@gmail.com', 'single', 1),
(710, 'iraklion@gmail.com', 'double', 7),
(101, 'sweethome@yahoo.com', 'single', 1),
(102, 'sweethome@yahoo.com', 'double', 1),
(103, 'sweethome@yahoo.com', 'triple', 1),
(104, 'sweethome@yahoo.com', 'quadruple', 1),
(105, 'sweethome@yahoo.com', 'single', 1),
(106, 'sweethome@yahoo.com', 'double', 1),
(107, 'sweethome@yahoo.com', 'triple', 1),
(201, 'sweethome@yahoo.com', 'single', 2),
(202, 'sweethome@yahoo.com', 'double', 2),
(203, 'sweethome@yahoo.com', 'single', 2),
(401, 'sweethome@yahoo.com', 'double', 4),
(402, 'sweethome@yahoo.com', 'quadruple', 4),
(402, 'sweethome@yahoo.com', 'quadruple', 4),
(403, 'sweethome@yahoo.com', 'single', 4),
(307, 'luxury@gmail.com', 'triple', 3),
(505, 'homepoetry@gmail.com', 'double', 5),
(208, 'iraklion@gmail.com', 'double', 2),
(401, 'marysrooms@yahoo.com', 'triple', 4),
(610, 'iraklion@gmail.com', 'quad', 6),
(303, 'luxury@gmail.com', 'quad', 3),
(106, 'luxury@gmail.com', 'double', 1);

INSERT INTO Grouping (reservationId, roomId)
VALUES (1, 4),
	   (1, 9),
       (1, 10),
       (1, 1);

INSERT INTO GroupCustomer (name, surname, telephone, email, identityNumber, groupingId)
VALUES ('Angeliki', 'Papadopoulou', '6947852369', 'angpapadop@gmail.com', 'AH859632', 1),
('Maria', 'Iwannidou', '6985214789', 'mariwan@hotmail.com', 'AZ8574152', 2),
('Panagiwths', 'Spyrou', 6932145823, 'panspyrou@gmail.com', 'AK963219', 2),
('Katerina', 'Kalogerakh', '6952391768', 'katekalog@gmail.com', 'AH851793', 3),
('Stavroula', 'Kalergh', '6954712695', 'kalerghhhh@hotmail.com', 'AX223964', 3),
('Alexis', 'Kwstopoulos', '697235648', 'alexkwst@gmail.com', 'AH765542', 3),
('Ahilleas', 'Gewrgiou', '6928346635', 'ahilleasgewr@hotmail.gr', 'AK932647', 4),
('Aristeidhs', 'Nikolaou', '6921053678', 'aristnikol@gmail.com', 'AM371420', 4),
('Kleiw', 'Vasilopoulou', '6930806004', 'kleiwvas@gmail.com', 'AH659841', 4),
('Foivos', 'Maroglou', '6975263104', 'foivmar@hotmail.com', 'AK203691', 4);

INSERT INTO Reservation_Service (reservationId, serviceId)
VALUES (1, 1),
(1, 2),
(1, 4),
(2, 1), 
(2, 2);



