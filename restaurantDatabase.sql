CREATE DATABASE restaurant_reservations;

USE restaurant_reservations;

CREATE TABLE Customers (
    customerId INT NOT NULL UNIQUE AUTO_INCREMENT,
    customerName VARCHAR(45) NOT NULL,
    contactInfo VARCHAR(200),
    PRIMARY KEY (customerId)
);

CREATE TABLE Reservations (
    reservationId INT NOT NULL UNIQUE AUTO_INCREMENT,
    customerId INT NOT NULL,
    reservationTime DATETIME NOT NULL,
    numberOfGuests INT NOT NULL,
    specialRequests VARCHAR(200),
    PRIMARY KEY (reservationId),
    FOREIGN KEY (customerId) REFERENCES Customers(customerId)
);

CREATE TABLE DiningPreferences (
    preferenceId INT NOT NULL UNIQUE AUTO_INCREMENT,
    customerId INT NOT NULL,
    favoriteTable VARCHAR(45),
    dietaryRestrictions VARCHAR(200),
    PRIMARY KEY (preferenceId),
    FOREIGN KEY (customerId) REFERENCES Customers(customerId)
);

DELIMITER //
CREATE PROCEDURE findReservations(IN inputCustomerId INT)
BEGIN
    SELECT * FROM Reservations
    WHERE customerId = inputCustomerId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE addSpecialRequest(IN inputReservationId INT, IN requests VARCHAR(200))
BEGIN
    UPDATE Reservations
    SET specialRequests = requests
    WHERE reservationId = inputReservationId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE addReservation(
    IN customerName VARCHAR(45),
    IN contactInfo VARCHAR(200),
    IN reservationTime DATETIME,
    IN numberOfGuests INT,
    IN specialRequests VARCHAR(200)
)
BEGIN
    DECLARE customerId INT;
    
    -- Check if customer exists
    SELECT c.customerId INTO customerId
    FROM Customers c
    WHERE c.customerName = customerName AND c.contactInfo = contactInfo;
    
    -- If not, create the customer
    IF customerId IS NULL THEN
        INSERT INTO Customers (customerName, contactInfo) VALUES (customerName, contactInfo);
        SET customerId = LAST_INSERT_ID();
    END IF;
    
    -- Add the reservation
    INSERT INTO Reservations (customerId, reservationTime, numberOfGuests, specialRequests)
    VALUES (customerId, reservationTime, numberOfGuests, specialRequests);
END //
DELIMITER ;

INSERT INTO Customers (customerName, contactInfo) VALUES
('Sir Galahad', 'galahad@roundtable.com'),
('Lady Guinevere', 'guinevere@avalon.org'),
('Merlin the Wise', '+123456789'),
('King Arthur', 'arthur@camelot.kingdom'),
('Queen Morgana', 'morgana@darkmagic.net'),
('Lancelot du Lac', '+987654321'),
('Sir Percival', 'percival@grailquest.org'),
('The Black Knight', 'blackknight@unknown.domain');

INSERT INTO Reservations (customerId, reservationTime, numberOfGuests, specialRequests) VALUES
(1, '2024-12-12 19:00:00', 4, 'Seating near the fireplace'),
(2, '2024-12-12 20:00:00', 2, 'Vegetarian meal'),
(3, '2024-12-13 18:30:00', 1, 'Quiet corner'),
(4, '2024-12-14 19:00:00', 5, 'Royal treatment requested'),
(5, '2024-12-15 20:00:00', 3, 'Privacy is a must'),
(6, '2024-12-16 18:45:00', 2, 'Seating in the shadows'),
(7, '2024-12-17 19:30:00', 1, 'A glass of mead on arrival'),
(8, '2024-12-18 20:15:00', 6, 'Celebration with music');

INSERT INTO DiningPreferences (customerId, favoriteTable, dietaryRestrictions) VALUES
(1, 'Table 5', 'No nuts'),
(2, 'Table 3', 'Gluten-free'),
(3, 'Table 7', 'No dairy'),
(4, 'Table 1', 'No garlic'),
(5, 'Table 9', 'Vegan'),
(6, 'Table 6', 'No seafood'),
(7, 'Table 10', 'No pork'),
(8, 'Table 12', 'No alcohol');

-- View for Customers Table
CREATE VIEW View_Customers AS
SELECT customerId, customerName, contactInfo
FROM Customers;

-- View for Reservations Table
CREATE VIEW View_Reservations AS
SELECT r.reservationId, c.customerName, r.reservationTime, r.numberOfGuests, r.specialRequests
FROM Reservations r
JOIN Customers c ON r.customerId = c.customerId;

-- View for DiningPreferences Table
CREATE VIEW View_DiningPreferences AS
SELECT d.preferenceId, c.customerName, d.favoriteTable, d.dietaryRestrictions
FROM DiningPreferences d
JOIN Customers c ON d.customerId = c.customerId;

SELECT * FROM View_Customers;
SELECT * FROM View_Reservations;
SELECT * FROM View_DiningPreferences;
