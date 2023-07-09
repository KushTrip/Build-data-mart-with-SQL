DROP DATABASE IF EXISTS airbnb_booking_system;
CREATE DATABASE airbnb_booking_system;
USE airbnb_booking_system;

-- User table
CREATE TABLE User (
  UserID INT PRIMARY KEY,
  Name VARCHAR(255),
  Email VARCHAR(255),
  Password VARCHAR(255),
  PhoneNumber VARCHAR(20)
);

-- Guest table
CREATE TABLE Guest (
  GuestID INT PRIMARY KEY,
  ProfilePicture VARCHAR(255),
  SocialNetworkLink VARCHAR(255),
  UserID INT,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Host table
CREATE TABLE Host (
  HostID INT PRIMARY KEY,
  ProfilePicture VARCHAR(255),
  PhoneNumber VARCHAR(20),
  UserID INT,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Location table
CREATE TABLE Location (
  LocationID INT PRIMARY KEY,
  City VARCHAR(100),
  Country VARCHAR(100)
);


-- Hotel Room table
CREATE TABLE HotelRoom (
  RoomID INT PRIMARY KEY,
  Description VARCHAR(255),
  Amenities VARCHAR(255),
  Price DECIMAL(10, 2),
  LocationID INT,
  FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);


-- Credit Card table
CREATE TABLE CreditCard (
  CardID INT PRIMARY KEY,
  CardNumber VARCHAR(16),
  ExpiryDate DATE,
  CVV VARCHAR(3)
);


-- Booking table
CREATE TABLE Booking (
  BookingID INT PRIMARY KEY,
  CheckInDate DATE,
  CheckOutDate DATE,
  Amount DECIMAL(10, 2),
  PaymentStatus VARCHAR(20),
  GuestID INT,
  HostID INT,
  RoomID INT,
  CardID INT,
  FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
  FOREIGN KEY (HostID) REFERENCES Host(HostID),
  FOREIGN KEY (RoomID) REFERENCES HotelRoom(RoomID),
  FOREIGN KEY (CardID) REFERENCES CreditCard(CardID)
);


-- Review table
CREATE TABLE Review (
  ReviewID INT PRIMARY KEY,
  Review VARCHAR(500),
  GuestID INT,
  RoomID INT,
  FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
  FOREIGN KEY (RoomID) REFERENCES HotelRoom(RoomID)
);

-- Social Network table
-- Create the 'SocialNetwork' table with an auto-incrementing primary key
CREATE TABLE SocialNetwork (
   NetworkID INT AUTO_INCREMENT PRIMARY KEY,
   NetworkName VARCHAR(255),
   GuestID INT,
   FOREIGN KEY (GuestID) REFERENCES Guest(GuestID)
);

-- Communication table
-- Create the 'Communication' table with BookingID as a foreign key
CREATE TABLE Communication (
   CommunicationID INT AUTO_INCREMENT PRIMARY KEY,
   BookingID INT,
   Method VARCHAR(255),
   FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);


-- Calculation table
CREATE TABLE Calculation (
  CalculationID INT PRIMARY KEY,
  ExpectedIncome DECIMAL(10, 2),
  HostID INT,
  FOREIGN KEY (HostID) REFERENCES Host(HostID)
);

-- Availability table
CREATE TABLE Availability (
  AvailabilityID INT PRIMARY KEY,
  StartDate DATE,
  EndDate DATE,
  RoomID INT,
  FOREIGN KEY (RoomID) REFERENCES HotelRoom(RoomID)
);

-- Photograph table
CREATE TABLE Photograph (
  PhotographID INT PRIMARY KEY,
  Image BLOB,
  RoomID INT,
  FOREIGN KEY (RoomID) REFERENCES HotelRoom(RoomID)
);

-- Profile table
CREATE TABLE Profile (
  ProfileID INT PRIMARY KEY,
  UserID INT,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Rating table
CREATE TABLE Rating (
  RatingID INT PRIMARY KEY,
  Value INT,
  GuestID INT,
  FOREIGN KEY (GuestID) REFERENCES Guest(GuestID)
);


-- Feedback table
CREATE TABLE Feedback (
  FeedbackID INT PRIMARY KEY,
  Content TEXT,
  GuestID INT,
  FOREIGN KEY (GuestID) REFERENCES Guest(GuestID)
);

-- Confirmation table
CREATE TABLE Confirmation (
  ConfirmationID INT PRIMARY KEY,
  status VARCHAR(20),
  BookingID INT,
  FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

-- Inquiry table
CREATE TABLE Inquiry (
  InquiryID INT PRIMARY KEY,
  Content TEXT,
  BookingID INT,
  FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

-- Payment table
CREATE TABLE Payment (
  PaymentID INT PRIMARY KEY,
  Date DATE,
  Amount DECIMAL(10, 2),
  BookingID INT,
  FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);


-- Income table
CREATE TABLE Income (
  IncomeID INT PRIMARY KEY,
  Amount DECIMAL(10, 2),
  HostID INT,
  FOREIGN KEY (HostID) REFERENCES Host(HostID)
);

-- dummy data section
INSERT INTO User (UserID, Name, Email, Password, PhoneNumber)
VALUES
  (1, 'John Doe', 'johndoe@gmail.com', 'password123', '1234567890'),
  (2, 'Jane Smith', 'janesmith@gmail.com', 'pass123', '9876543210'),
  (3, 'Michael Johnson', 'michael@hotmail.com', 'testpass', '5555555555'),
  (4, 'Emily Davis', 'emily@yahoo.com', 'pass456', '8888888888'),
  (5, 'David Wilson', 'david@gmail.com', 'test123', '1111111111'),
  (6, 'Sophia Lee', 'sophia@example.com', 'pass789', '2222222222'),
  (7, 'Matthew Thompson', 'matthew@example.com', 'password456', '3333333333'),
  (8, 'Olivia Garcia', 'olivia@gmail.com', 'testpass789', '4444444444'),
  (9, 'Daniel Hernandez', 'daniel@example.com', 'pass999', '6666666666'),
  (10, 'Isabella Clark', 'isabella@gmail.com', 'password789', '7777777777'),
  (11, 'Alexander Hall', 'alexander@gmail.com', 'pass123456', '9999999999'),
  (12, 'Ava Young', 'ava@example.com', 'testpass123', '3334445555'),
  (13, 'William Turner', 'william@example.com', 'pass234', '1112223333'),
  (14, 'Mia Baker', 'mia@example.com', 'password987', '4445556666'),
  (15, 'James Walker', 'james@example.com', 'pass567', '7778889999'),
  (16, 'Sophia Hill', 'sophia@example.com', 'testpass123456', '2221113333'),
  (17, 'Ethan Carter', 'ethan@example.com', 'pass7891011', '5554443333'),
  (18, 'Charlotte Mitchell', 'charlotte@example.com', 'password456789', '8887776666'),
  (19, 'Benjamin Green', 'benjamin@gmail.com', 'testpass234', '9998887777'),
  (20, 'Amelia Adams', 'amelia@gmail.com', 'pass345', '1110002222');
  
    INSERT INTO Guest (GuestID, ProfilePicture, SocialNetworkLink, UserID) 
    VALUES
(1, 'profile1.jpg', 'https://www.facebook.com/johndoe', 1),
(2, 'profile2.jpg', 'https://www.facebook.com/janesmith', 2),
(3, 'profile3.jpg', 'https://www.facebook.com/davidjohnson', 3),
(4, 'profile4.jpg', 'https://www.facebook.com/emilybrown', 4),
(5, 'profile5.jpg', 'https://www.facebook.com/michaelwilson', 5),
(6, 'profile6.jpg', 'https://www.facebook.com/sarahdavis', 6),
(7, 'profile7.jpg', 'https://www.facebook.com/jennifermiller', 7),
(8, 'profile8.jpg', 'https://www.facebook.com/williamanderson', 8),
(9, 'profile9.jpg', 'https://www.facebook.com/jessicathomas', 9),
(10, 'profile10.jpg', 'https://www.facebook.com/danieljackson', 10),
(11, 'profile11.jpg', 'https://www.facebook.com/oliviamartinez', 11),
(12, 'profile12.jpg', 'https://www.facebook.com/jameswilson', 12),
(13, 'profile13.jpg', 'https://www.facebook.com/sophiaclark', 13),
(14, 'profile14.jpg', 'https://www.facebook.com/andrewturner', 14),
(15, 'profile15.jpg', 'https://www.facebook.com/emmarodriguez', 15),
(16, 'profile16.jpg', 'https://www.facebook.com/christopheryoung', 16),
(17, 'profile17.jpg', 'https://www.facebook.com/madisonlee', 17),
(18, 'profile18.jpg', 'https://www.facebook.com/joshuawalker', 18),
(19, 'profile19.jpg', 'https://www.facebook.com/avahernandez', 19),
(20, 'profile20.jpg', 'https://www.facebook.com/matthewgreen', 20);
  
    INSERT INTO Host (HostID, ProfilePicture, PhoneNumber, UserID) VALUES
(1, 'profile21.jpg', '1234567890', 1),
(2, 'profile22.jpg', '9876543210', 2),
(3, 'profile23.jpg', '5555555555', 3),
(4, 'profile24.jpg', '9999999999', 4),
(5, 'profile25.jpg', '1111111111', 5),
(6, 'profile26.jpg', '2222222222', 6),
(7, 'profile27.jpg', '3333333333', 7),
(8, 'profile28.jpg', '4444444444', 8),
(9, 'profile29.jpg', '7777777777', 9),
(10, 'profile30.jpg', '8888888888', 10),
(11, 'profile31.jpg', '6666666666', 11),
(12, 'profile32.jpg', '5555555555', 12),
(13, 'profile33.jpg', '4444444444', 13),
(14, 'profile34.jpg', '3333333333', 14),
(15, 'profile35.jpg', '2222222222', 15),
(16, 'profile36.jpg', '1111111111', 16),
(17, 'profile37.jpg', '8888888888', 17),
(18, 'profile38.jpg', '7777777777', 18),
(19, 'profile39.jpg', '6666666666', 19),
(20, 'profile40.jpg', '5555555555', 20);


INSERT INTO Location (LocationID, City, Country)
VALUES
  (1, 'New York', 'United States'),
  (2, 'Paris', 'France'),
  (3, 'London', 'United Kingdom'),
  (4, 'Tokyo', 'Japan'),
  (5, 'Rome', 'Italy'),
  (6, 'Sydney', 'Australia'),
  (7, 'Cape Town', 'South Africa'),
  (8, 'Rio de Janeiro', 'Brazil'),
  (9, 'Barcelona', 'Spain'),
  (10, 'Dubai', 'United Arab Emirates'),
  (11, 'Berlin', 'Germany'),
  (12, 'Amsterdam', 'Netherlands'),
  (13, 'Bangkok', 'Thailand'),
  (14, 'Toronto', 'Canada'),
  (15, 'Mumbai', 'India'),
  (16, 'Hawaii', 'United States'),
  (17, 'Kathmandu', 'Nepal'),
  (18, 'Pokhara', 'Nepal'),
  (19, 'Ottawa', 'Canada'),
  (20, 'wellington', 'Australia');

  
  INSERT INTO HotelRoom (RoomID, Description, Amenities, Price, LocationID) 
  VALUES
(1, 'Cozy apartment in the heart of the city', 'WiFi, Kitchen, TV', 100.00, 1),
(2, 'Charming studio with a view', 'WiFi, Air conditioning, Gym', 80.00, 2),
(3, 'Luxurious penthouse with panoramic city views', 'WiFi, Swimming pool, Jacuzzi', 250.00, 3),
(4, 'Traditional Japanese ryokan with tatami rooms', 'WiFi, Hot springs, Traditional breakfast', 150.00, 4),
(5, 'Elegant suite in a historic building', 'WiFi, Room service, Minibar', 180.00, 5),
(6, 'Spacious beachfront villa with private pool', 'WiFi, BBQ, Beach access', 350.00, 6),
(7, 'Comfortable apartment near major attractions', 'WiFi, Parking, Elevator', 90.00, 7),
(8, 'Stylish apartment in a modern skyscraper', 'WiFi, Gym, 24-hour security', 120.00, 8),
(9, 'Cozy cottage in a peaceful countryside', 'WiFi, Fireplace, Garden', 80.00, 9),
(10, 'Modern condo in the heart of downtown', 'WiFi, Rooftop terrace, Concierge', 160.00, 10),
(11, 'Bright and spacious loft with city views', 'WiFi, Balcony, Air conditioning', 130.00, 11),
(12, 'Beachfront apartment with stunning sunset views', 'WiFi, Swimming pool, Beach access', 200.00, 12),
(13, 'Safari tent in a nature reserve', 'WiFi, Campfire, Wildlife tours', 100.00, 13),
(14, 'Charming apartment in the Gothic Quarter', 'WiFi, Historic building, Restaurants nearby', 110.00, 14),
(15, 'Cozy houseboat on a picturesque canal', 'WiFi, Terrace, Bicycles included', 180.00, 15),
(16, 'Modern studio in the bustling city center', 'WiFi, Kitchenette, Public transportation nearby', 95.00, 16),
(17, 'Luxury hotel room with panoramic city views', 'WiFi, Spa, Room service', 250.00, 17),
(18, 'Comfortable apartment with city skyline views', 'WiFi, Gym, 24-hour concierge', 120.00, 18),
(19, 'Traditional Korean hanok in a peaceful neighborhood', 'WiFi, Courtyard, Traditional tea ceremony', 140.00, 19),
(20, 'Cozy casa particular in the heart of Old Havana', 'WiFi, Air conditioning, Breakfast included', 90.00, 20);
  

INSERT INTO CreditCard (CardID, CardNumber, ExpiryDate, CVV)
VALUES
  (1, '1234567812345678', '2025-06-01', '123'),
  (2, '2345678923456789', '2024-09-01', '234'),
  (3, '3456789034567890', '2023-12-01', '345'),
  (4, '4567890145678901', '2025-03-01', '456'),
  (5, '5678901256789012', '2024-06-01', '567'),
  (6, '6789012367890123', '2023-09-01', '678'),
  (7, '7890123478901234', '2025-12-01', '789'),
  (8, '8901234589012345', '2024-03-01', '890'),
  (9, '9012345690123456', '2023-06-01', '901'),
  (10, '0123456701234567', '2025-09-01', '012'),
  (11, '1234567812345678', '2024-12-01', '123'),
  (12, '2345678923456789', '2023-03-01', '234'),
  (13, '3456789034567890', '2025-06-01', '345'),
  (14, '4567890145678901', '2024-09-01', '456'),
  (15, '5678901256789012', '2023-12-01', '567'),
  (16, '6789012367890123', '2025-03-01', '678'),
  (17, '7890123478901234', '2024-06-01', '789'),
  (18, '8901234589012345', '2023-09-01', '890'),
  (19, '9012345690123456', '2025-12-01', '901'),
  (20, '0123456701234567', '2024-03-01', '012');

  
  INSERT INTO Booking (BookingID, CheckInDate, CheckOutDate, Amount, PaymentStatus, GuestID, HostID, RoomID, CardID) 
  VALUES
(1, '2023-08-15', '2023-08-20', 500.00, 'Paid', 1, 1, 1, 1),
(2, '2023-09-10', '2023-09-15', 400.00, 'Paid', 2, 2, 2, 2),
(3, '2023-07-01', '2023-07-05', 320.00, 'Paid', 3, 3, 3, 3),
(4, '2023-12-20', '2023-12-27', 1750.00, 'Paid', 4, 4, 4, 4),
(5, '2024-03-05', '2024-03-10', 900.00, 'Paid', 5, 5, 5, 5),
(6, '2023-10-15', '2023-10-20', 1050.00, 'Paid', 6, 6, 6, 6),
(7, '2023-11-01', '2023-11-05', 360.00, 'Paid', 7, 7, 7, 7),
(8, '2024-02-10', '2024-02-15', 480.00, 'Paid', 8, 8, 8, 8),
(9, '2023-09-01', '2023-09-07', 560.00, 'Paid', 9, 9, 9, 9),
(10, '2023-08-25', '2023-08-30', 800.00, 'Paid', 10, 10, 10, 10),
(11, '2024-06-15', '2024-06-20', 650.00, 'Paid', 11, 11, 11, 11),
(12, '2023-05-10', '2023-05-15', 900.00, 'Paid', 12, 12, 12, 12),
(13, '2024-01-01', '2024-01-07', 500.00, 'Paid', 13, 13, 13, 13),
(14, '2023-07-20', '2023-07-27', 1250.00, 'Paid', 14, 14, 14, 14),
(15, '2024-04-05', '2024-04-10', 720.00, 'Paid', 15, 15, 15, 15),
(16, '2023-12-01', '2023-12-05', 400.00, 'Paid', 16, 16, 16, 16),
(17, '2023-10-10', '2023-10-15', 1000.00, 'Paid', 17, 17, 17, 17),
(18, '2024-03-20', '2024-03-25', 560.00, 'Paid', 18, 18, 18, 18),
(19, '2023-11-15', '2023-11-20', 700.00, 'Paid', 19, 19, 19, 19),
(20, '2023-08-05', '2023-08-12', 1500.00, 'Paid', 20, 20, 20, 20);
  
  
  
   INSERT INTO Review (ReviewID, Review, GuestID, RoomID) VALUES
(1, 'Great experience! The apartment was clean and comfortable.', 1, 1),
(2, 'Wonderful stay! The studio had amazing views of the city.', 2, 2),
(3, 'Excellent service and amenities. Highly recommend.', 3, 3),
(4, 'Absolutely loved the traditional Japanese ryokan.', 4, 4),
(5, 'The elegant suite exceeded our expectations. Fantastic!', 5, 5),
(6, 'The beachfront villa was paradise. We did not want to leave.', 6, 6),
(7, 'Convenient location and comfortable apartment.', 7, 7),
(8, 'Modern and stylish apartment with great facilities.', 8, 8),
(9, 'The cozy cottage provided a peaceful getaway.', 9, 9),
(10, 'The modern condo was perfect for exploring the city.', 10, 10),
(11, 'Spacious loft with stunning city views. Highly recommended.', 11, 11),
(12, 'The beachfront apartment was a dream come true.', 12, 12),
(13, 'Amazing experience in the safari tent. Truly unique.', 13, 13),
(14, 'The charming apartment in the Gothic Quarter was perfect.', 14, 14),
(15, 'We loved staying on the cozy houseboat. Such a unique experience.', 15, 15),
(16, 'The modern studio was convenient and comfortable.', 16, 16),
(17, 'Luxury hotel room with excellent amenities.', 17, 17),
(18, 'Great apartment with stunning city skyline views.', 18, 18),
(19, 'The traditional Korean hanok was a cultural delight.', 19, 19),
(20, 'Enjoyed the cozy casa particular in Old Havana.', 20, 20);

  
   INSERT INTO SocialNetwork (NetworkID, NetworkName, GuestID)
VALUES
  (1, 'Facebook', 1),
  (2, 'Instagram', 2),
  (3, 'Twitter', 3),
  (4, 'LinkedIn', 4),
  (5, 'Facebook', 5),
  (6, 'Instagram', 6),
  (7, 'Twitter', 7),
  (8, 'Linkedin', 8),
  (9, 'Facebook', 9),
  (10, 'Instagram', 10),
  (11, 'Twitter', 11),
  (12, 'Linkedin', 12),
  (13, 'Facebook', 13),
  (14, 'Instagram', 14),
  (15, 'Twitter', 15),
  (16, 'Linkedin', 16),
  (17, 'Facebook', 17),
  (18, 'Instagram', 18),
  (19, 'Twitter', 19),
  (20, 'Linkedin', 20);
  
  INSERT INTO Communication (CommunicationID, Method, BookingID)
VALUES
  (1, 'Phone Call', 1),
  (2, 'Email', 2),
  (3, 'SMS', 3),
  (4, 'WhatsApp', 4),
  (5, 'Video Call', 5),
  (6, 'In-person Meeting', 6),
  (7, 'SMS', 7),
  (8, 'Messenger', 8),
  (9, 'Fax', 9),
  (10, 'Postal Mail', 10),
  (11, 'Voice Message', 11),
  (12, 'Messenger', 12),
  (13, 'Conference Call', 13),
  (14, 'Voice over IP', 14),
  (15, 'Vi', 15),
  (16, 'Phone call', 16),
  (17, 'Whatsapp', 17),
  (18, 'Email', 18),
  (19, 'Phone call', 19),
  (20, 'SMS', 20);
  
  INSERT INTO Calculation (CalculationID, ExpectedIncome, HostID)
VALUES
  (21, 1500.00, 1),
  (22, 1200.00, 2),
  (23, 960.00, 3),
  (24, 5250.00, 4),
  (25, 2700.00, 5),
  (26, 3150.00, 6),
  (27, 1080.00, 7),
  (28, 1440.00, 8),
  (29, 1680.00, 9),
  (30, 2400.00, 10),
  (31, 1950.00, 11),
  (32, 2700.00, 12),
  (33, 1500.00, 13),
  (34, 3750.00, 14),
  (35, 2160.00, 15),
  (36, 480.00, 16),
  (37, 2000.00, 17),
  (38, 1120.00, 18),
  (39, 1400.00, 19),
  (40, 3000.00, 20);

  
   INSERT INTO Availability (AvailabilityID, StartDate, EndDate, RoomID)
VALUES
    (21, '2023-08-01', '2023-08-31', 1),
    (22, '2023-09-01', '2023-09-30', 2),
    (23, '2023-07-01', '2023-07-31', 3),
    (24, '2023-12-01', '2023-12-31', 4),
    (25, '2024-03-01', '2024-03-31', 5),
    (26, '2023-10-01', '2023-10-31', 6),
    (27, '2023-11-01', '2023-11-30', 7),
    (28, '2024-02-01', '2024-02-29', 8),
    (29, '2023-09-01', '2023-09-30', 9),
    (30, '2023-08-01', '2023-08-31', 10),
    (31, '2024-06-01', '2024-06-30', 11),
    (32, '2023-05-01', '2023-05-31', 12),
    (33, '2024-01-01', '2024-01-31', 13),
    (34, '2023-07-01', '2023-07-31', 14),
    (35, '2024-04-01', '2024-04-30', 15),
    (36, '2023-12-01', '2023-12-31', 16),
    (37, '2023-10-01', '2023-10-31', 17),
    (38, '2024-03-01', '2024-03-31', 18),
    (39, '2023-11-01', '2023-11-30', 19),
    (40, '2023-08-01', '2023-08-31', 20);

  
  INSERT INTO Photograph (PhotographID, Image, RoomID)
VALUES
    (21, 'image1.jpg', 1),
    (22, 'image2.jpg', 2),
    (23, 'image3.jpg', 3),
    (24, 'image4.jpg', 4),
    (25, 'image5.jpg', 5),
    (26, 'image6.jpg', 6),
    (27, 'image7.jpg', 7),
    (28, 'image8.jpg', 8),
    (29, 'image9.jpg', 9),
    (30, 'image10.jpg', 10),
    (31, 'image11.jpg', 11),
    (32, 'image12.jpg', 12),
    (33, 'image13.jpg', 13),
    (34, 'image14.jpg', 14),
    (35, 'image15.jpg', 15),
    (36, 'image16.jpg', 16),
    (37, 'image17.jpg', 17),
    (38, 'image18.jpg', 18),
    (39, 'image19.jpg', 19),
    (40, 'image20.jpg', 20);

  
  INSERT INTO Profile (ProfileID, UserID)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10),
  (11, 11),
  (12, 12),
  (13, 13),
  (14, 14),
  (15, 15),
  (16, 16),
  (17, 17),
  (18, 18),
  (19, 19),
  (20, 20);
  
  
 

  
 INSERT INTO Calculation (CalculationID, ExpectedIncome, HostID) VALUES
(1, 1500.00, 1),
(2, 1200.00, 2),
(3, 960.00, 3),
(4, 5250.00, 4),
(5, 2700.00, 5),
(6, 3150.00, 6),
(7, 1080.00, 7),
(8, 1440.00, 8),
(9, 1680.00, 9),
(10, 2400.00, 10),
(11, 1950.00, 11),
(12, 2700.00, 12),
(13, 1500.00, 13),
(14, 3750.00, 14),
(15, 2160.00, 15),
(16, 480.00, 16),
(17, 2000.00, 17),
(18, 1120.00, 18),
(19, 1400.00, 19),
(20, 3000.00, 20);
  
 
 INSERT INTO Availability (AvailabilityID, StartDate, EndDate, RoomID) VALUES
(1, '2023-08-01', '2023-08-31', 1),
(2, '2023-09-01', '2023-09-30', 2),
(3, '2023-07-01', '2023-07-31', 3),
(4, '2023-12-01', '2023-12-31', 4),
(5, '2024-03-01', '2024-03-31', 5),
(6, '2023-10-01', '2023-10-31', 6),
(7, '2023-11-01', '2023-11-30', 7),
(8, '2024-02-01', '2024-02-29', 8),
(9, '2023-09-01', '2023-09-30', 9),
(10, '2023-08-01', '2023-08-31', 10),
(11, '2024-06-01', '2024-06-30', 11),
(12, '2023-05-01', '2023-05-31', 12),
(13, '2024-01-01', '2024-01-31', 13),
(14, '2023-07-01', '2023-07-31', 14),
(15, '2024-04-01', '2024-04-30', 15),
(16, '2023-12-01', '2023-12-31', 16),
(17, '2023-10-01', '2023-10-31', 17),
(18, '2024-03-01', '2024-03-31', 18),
(19, '2023-11-01', '2023-11-30', 19),
(20, '2023-08-01', '2023-08-31', 20);

INSERT INTO Photograph (PhotographID, Image, RoomID) VALUES
(1, 'image1.jpg', 1),
(2, 'image2.jpg', 2),
(3, 'image3.jpg', 3),
(4, 'image4.jpg', 4),
(5, 'image5.jpg', 5),
(6, 'image6.jpg', 6),
(7, 'image7.jpg', 7),
(8, 'image8.jpg', 8),
(9, 'image9.jpg', 9),
(10, 'image10.jpg', 10),
(11, 'image11.jpg', 11),
(12, 'image12.jpg', 12),
(13, 'image13.jpg', 13),
(14, 'image14.jpg', 14),
(15, 'image15.jpg', 15),
(16, 'image16.jpg', 16),
(17, 'image17.jpg', 17),
(18, 'image18.jpg', 18),
(19, 'image19.jpg', 19),
(20, 'image20.jpg', 20);


INSERT INTO Profile (ProfileID, UserID) VALUES
    (21, 1),
    (22, 2),
    (23, 3),
    (24, 4),
    (25, 5),
    (26, 6),
    (27, 7),
    (28, 8),
    (29, 9),
    (30, 10),
    (31, 11),
    (32, 12),
    (33, 13),
    (34, 14),
    (35, 15),
    (36, 16),
    (37, 17),
    (38, 18),
    (39, 19),
    (40, 20);

  
  INSERT INTO Rating (RatingID, Value, GuestID) 
  VALUES
(1, 4, 1),
(2, 5, 2),
(3, 4, 3),
(4, 4, 4),
(5, 5, 5),
(6, 3, 6),
(7, 4, 7),
(8, 5, 8),
(9, 4, 9),
(10, 5, 10),
(11, 3, 11),
(12, 4, 12),
(13, 5, 13),
(14, 4, 14),
(15, 5, 15),
(16, 3, 16),
(17, 4, 17),
(18, 5, 18),
(19, 4, 19),
(20, 5, 20);
  
    INSERT INTO Feedback (FeedbackID, Content, GuestID) VALUES
(1, 'Great experience overall!', 1),
(2, 'Highly recommend this host!', 2),
(3, 'Good value for money.', 3),
(4, 'Excellent service and amenities.', 4),
(5, 'Could not have asked for a better stay!', 5),
(6, 'Average experience, could be improved.', 6),
(7, 'Decent place to stay for a short trip.', 7),
(8, 'Host was very responsive and helpful.', 8),
(9, 'Enjoyed our stay. Thank you!', 9),
(10, 'Fantastic experience. Would book again.', 10),
(11, 'Not the best experience. Room was not clean.', 11),
(12, 'Host was welcoming and provided great tips.', 12),
(13, 'Absolutely loved our stay. Highly recommended!', 13),
(14, 'Good location and comfortable accommodation.', 14),
(15, 'Unique and memorable experience.', 15),
(16, 'Could use some improvements in cleanliness.', 16),
(17, 'Wonderful hotel with excellent service.', 17),
(18, 'Great apartment with modern amenities.', 18),
(19, 'Authentic cultural experience at the hanok.', 19),
(20, 'Lovely casa particular in a convenient location.', 20);
  
  INSERT INTO Confirmation (ConfirmationID, Status, BookingID) VALUES
(1, 'Confirmed', 1),
(2, 'Confirmed', 2),
(3, 'Confirmed', 3),
(4, 'Confirmed', 4),
(5, 'Confirmed', 5),
(6, 'Confirmed', 6),
(7, 'Confirmed', 7),
(8, 'Confirmed', 8),
(9, 'Confirmed', 9),
(10, 'Confirmed', 10),
(11, 'Confirmed', 11),
(12, 'Confirmed', 12),
(13, 'Confirmed', 13),
(14, 'Confirmed', 14),
(15, 'Confirmed', 15),
(16, 'Confirmed', 16),
(17, 'Confirmed', 17),
(18, 'Confirmed', 18),
(19, 'Confirmed', 19),
(20, 'Confirmed', 20);
  
  INSERT INTO Inquiry (InquiryID, Content, BookingID) VALUES
(1, 'Can I request a late check-in?', 1),
(2, 'Is there parking available?', 2),
(3, 'Can I bring my pet with me?', 3),
(4, 'Are there any nearby restaurants?', 4),
(5, 'Can I get a refund if I cancel?', 5),
(6, 'Is early check-in possible?', 6),
(7, 'Can I have a late check-out?', 7),
(8, 'Are there any additional fees?', 8),
(9, 'Can you recommend local attractions?', 9),
(10, 'Is there a minimum stay requirement?', 10),
(11, 'Can I change my reservation dates?', 11),
(12, 'Do you provide airport transfers?', 12),
(13, 'Are there laundry facilities available?', 13),
(14, 'Can I request a baby crib?', 14),
(15, 'Are there any discounts for long stays?', 15),
(16, 'Can I host a small gathering?', 16),
(17, 'Is the swimming pool open all year?', 17),
(18, 'Are there any nearby grocery stores?', 18),
(19, 'Can I request daily housekeeping?', 19),
(20, 'Do you provide airport pick-up?', 20);
  
   INSERT INTO Payment (PaymentID, Date, Amount, BookingID) VALUES
(1, '2023-08-20', 500.00, 1),
(2, '2023-09-15', 400.00, 2),
(3, '2023-07-05', 320.00, 3),
(4, '2023-12-27', 1750.00, 4),
(5, '2024-03-10', 900.00, 5),
(6, '2023-10-20', 1050.00, 6),
(7, '2023-11-05', 360.00, 7),
(8, '2024-02-15', 480.00, 8),
(9, '2023-09-07', 560.00, 9),
(10, '2023-08-30', 800.00, 10),
(11, '2024-06-20', 650.00, 11),
(12, '2023-05-15', 900.00, 12),
(13, '2024-01-07', 500.00, 13),
(14, '2023-07-27', 1250.00, 14),
(15, '2024-04-10', 720.00, 15),
(16, '2023-12-05', 400.00, 16),
(17, '2023-10-15', 1000.00, 17),
(18, '2024-03-25', 560.00, 18),
(19, '2023-11-20', 700.00, 19),
(20, '2025-02-05', 230.25, 20);
  
  INSERT INTO Income (IncomeID, Amount, HostID) VALUES
(1, 1500.00, 1),
(2, 1200.00, 2),
(3, 960.00, 3),
(4, 5250.00, 4),
(5, 2700.00, 5),
(6, 3150.00, 6),
(7, 1080.00, 7),
(8, 1440.00, 8),
(9, 1680.00, 9),
(10, 2400.00, 10),
(11, 1950.00, 11),
(12, 2700.00, 12),
(13, 1500.00, 13),
(14, 3750.00, 14),
(15, 2160.00, 15),
(16, 480.00, 16),
(17, 2000.00, 17),
(18, 1120.00, 18),
(19, 1400.00, 19),
(20, 3000.00, 20);
  
  