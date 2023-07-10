USE airbnb_booking_system;
-- TEST QUERIES FOR CHECKING THE PERFORMANCE OF THE SQL CODE

-- TEEST QUERY WHICH USES MULTIPLE JOIN
USE airbnb_booking_system;
SELECT
  Booking.BookingID,
  Host.HostID,
  Host.ProfilePicture AS HostProfilePicture,
  Host.PhoneNumber AS HostPhoneNumber,
  HotelRoom.RoomID,
  HotelRoom.Description AS RoomDescription,
  HotelRoom.Amenities AS RoomAmenities,
  Payment.PaymentID,
  Payment.Date,
  Payment.Amount AS PaymentAmount,
  Guest.GuestID,
  Guest.ProfilePicture AS GuestProfilePicture,
  Guest.SocialNetworkLink AS GuestSocialNetworkLink
FROM
  Booking
JOIN
  Host ON Booking.HostID = Host.HostID
JOIN
  HotelRoom ON Booking.RoomID = HotelRoom.RoomID
JOIN
  Payment ON Booking.BookingID = Payment.PaymentID
JOIN
  Guest ON Booking.GuestID = Guest.GuestID;
  
  
  -- TEST QUERY FOR ENTITY USER 
  SELECT Name, Email, password
  FROM User
  WHERE PhoneNumber LIKE '555%';
  
  -- TEST QUERY FOR ENTITY GUEST
  SELECT GuestID, ProfilePicture
  FROM Guest
  WHERE SocialNetworkLink LIKE '%facebook%';
  
  -- TEST QUERY FOR ENTITY HOST
  SELECT HostID, ProfilePicture
  FROM HOST
  WHERE PhoneNumber LIKE '%8888';
  
  -- TEST QUERY FOR ENTITY HotelRoom
SELECT hr.RoomID, hr.Description, hr.Price, loc.City, loc.Country 
FROM HotelRoom hr 
JOIN Location loc ON loc.LocationID = hr.RoomID 
WHERE loc.Country LIKE 'U%';

-- TEST QUERY FOR ENTITY BOOKING
SELECT BookingID, CheckinDate, CheckoutDate, Amount, PaymentStatus
 FROM Booking 
WHERE Amount >= 600;


-- TEST QUERY FOR ENTITY BOOKING
SELECT CardID, CardNumber, ExpiryDate, CVV
FROM CreditCard 
WHERE ExpiryDate > '2024-06-01';


-- TEST QUERY FOR ENTITY REVIEW
SELECT ReviewID, Review 
FROM Review
WHERE Review LIKE '%excellent%'; 


-- TEST QUERY FOR ENTITY SOCIALNETWORK
SELECT *
FROM SocialNetwork
WHERE NetworkName = 'Facebook';

-- TEST QUERY FOR THE ENTITY COMMUNICATION
SELECT CommunicationID, Method
FROM Communication
WHERE Method IN ('Phone Call', 'SMS', 'Email')
ORDER BY CommunicationID DESC
LIMIT 5;


-- TEST QUERY FOR THE ENTITY CALCULATION
SELECT CalculationID, ExpectedIncome
FROM Calculation
WHERE ExpectedIncome > 1000
ORDER BY CalculationID ASC
LIMIT 5;


-- TEST QUERY FOR THE ENTITY AVAILABILITY
SELECT AvailabilityID, StartDate, EndDate
FROM Availability
WHERE StartDate >= '2023-09-01' AND EndDate <= '2023-10-31'
ORDER BY AvailabilityID ASC;


-- TEST QUERY FOR THE ENTITY PHOTOGRAPH
SELECT PhotographID, Image
FROM Photograph
WHERE Image LIKE '%image%'
ORDER BY PhotographID ASC
LIMIT 5;

-- TEST QUERY FOR THE ENTITY PROFILE
SELECT ProfileID, UserID
FROM Profile
WHERE UserID BETWEEN 1 AND 3
ORDER BY ProfileID DESC;


-- TEST QUERY FOR THE ENTITY RATING
SELECT *
FROM Rating
WHERE Value >= 4
ORDER BY RatingID ASC
LIMIT 5;


-- TEST QUERY FOR THE ENTITY FEEDBACK
SELECT F.FeedbackID, F.Content, R.Value
FROM Feedback F
JOIN Rating R ON F.FeedbackID = R.RatingID
ORDER BY R.Value DESC;


-- TEST QUERY FOR THE ENTITY CONFIRMATION
SELECT ConfirmationID, status
FROM Confirmation
WHERE status IN ('Confirmed')
ORDER BY ConfirmationID DESC;


-- TEST QUERY FOR THE ENTITY INQUIRY
SELECT InquiryID, Content
FROM Inquiry
WHERE LENGTH(Content) > 20
ORDER BY InquiryID DESC
LIMIT 5;


-- TEST QUERY FOR THE ENTITY PAYMENT
SELECT PaymentID, Date, Amount
FROM Payment
WHERE Amount > 200
ORDER BY Date ASC;


-- TEST QUERY FOR THE ENTITY INCOME
SELECT IncomeID, Amount
FROM Income
WHERE Amount > 800
ORDER BY Amount DESC
LIMIT 5;




  

  
