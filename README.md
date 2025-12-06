# Airbnb Booking System – Relational Database Project

## Overview

This project implements a relational Airbnb-style booking database in SQL, covering user management, listings, bookings, payments, reviews, and host income analytics. It includes schema definition, realistic dummy data for 20 core entities, and a separate suite of test queries to validate functionality and performance.

## Features

- 20 normalized tables covering the full Airbnb workflow:
  - `User`, `Guest`, `Host`, `Location`, `HotelRoom`, `CreditCard`, `Booking`, `Review`, `SocialNetwork`, `Communication`, `Calculation`, `Availability`, `Photograph`, `Profile`, `Rating`, `Feedback`, `Confirmation`, `Inquiry`, `Payment`, and `Income`. [file:1][file:2][file:4]
- Referential integrity enforced via foreign keys between users, guests, hosts, rooms, bookings, and financial entities. [file:1][file:2][file:4]
- Realistic sample data (around 20 rows per table) for users, rooms, bookings, reviews, payments, ratings, and more to support meaningful querying and analysis. 
- Dedicated `test-queries.sql` file with targeted `SELECT` and `JOIN` queries to exercise individual entities and complex multi-table joins.

## Schema Overview

### Core Identity Layer

- **User**  
  Stores basic user information such as `UserID`, `Name`, `Email`, `Password`, and `PhoneNumber`. [file:1][file:4]

- **Guest** and **Host**  
  Extend `User` via a `UserID` foreign key. `Guest` adds profile picture and social network link, while `Host` adds profile picture and phone number for contact. 

### Listings and Locations

- **Location**  
  Stores `City` and `Country` metadata for each listing. 

- **HotelRoom**  
  Represents individual listings with `Description`, `Amenities`, `Price`, and a foreign key to `Location`. 

- **Availability**  
  Stores availability ranges (`StartDate`, `EndDate`) per room via `RoomID`. 

- **Photograph**  
  Stores image references (file names / URLs) for each room through `RoomID`. 

### Transactions and Money Flow

- **CreditCard**  
  Contains basic card metadata (`CardNumber`, `ExpiryDate`, `CVV`) used in bookings. 

- **Booking**  
  Central transactional table linking `Guest`, `Host`, `HotelRoom`, and `CreditCard` with `CheckInDate`, `CheckOutDate`, `Amount`, and `PaymentStatus`. 

- **Payment**  
  Stores monetary transactions with `Date`, `Amount`, and a foreign key to `Booking`. 

- **Income** and **Calculation**  
  Track host-level income and expected income calculations through a foreign key to `Host`.

### User Experience and Feedback

- **Review** and **Rating**  
  Store textual reviews and numeric rating values for stays, linked to guests and rooms. 

- **Feedback**  
  Additional guest feedback content, often analyzed together with `Rating`. 

- **Confirmation** and **Inquiry**  
  `Confirmation` records booking confirmation status, while `Inquiry` captures guest questions and requests linked to bookings. 

- **Communication** and **SocialNetwork**  
  `Communication` logs methods used per booking (e.g., phone, email), and `SocialNetwork` links guests to their social profiles. 

- **Profile**  
  Connects additional profile entries to users via `UserID`. 

## Repository Structure

- `airbnb-booking-system.sql`  
  - Creates the `airbnbbookingsystem` database.  
  - Defines all 20 tables with primary keys and foreign key constraints.  
  - Populates each table with realistic dummy data (approximately 20 rows per table). 

- `test-queries.sql`  
  - Contains:
    - A complex `SELECT` using multiple `JOIN`s across `Booking`, `Host`, `HotelRoom`, `Payment`, and `Guest` to display a consolidated booking view. [file:2][file:3][file:4]
    - Per-entity queries to validate behavior, such as:
      - Users filtered by phone number pattern. 
      - Guests filtered by social network link. 
      - Rooms joined with locations and filtered by country and price. 
      - Bookings and Payments filtered by `Amount` and `Date`. 
      - Reviews and Feedback filtered by text content or rating value. 
      - Queries over `Confirmation`, `Inquiry`, `Income`, and other support entities. 

## Installation

### Prerequisites

- A relational database server compatible with this SQL dialect (e.g., MySQL or MariaDB-style environment).
- A SQL client (CLI or GUI such as MySQL Workbench, DBeaver, phpMyAdmin, etc.).

### Setup Steps

1. **Create / configure a database user**  
   Ensure the user has permission to create and drop databases, and create tables. 

2. **Run the main schema and data script**

   - Open `airbnb-booking-system.sql` in your SQL client. 
   - Execute the whole script:
     - Drops any existing `airbnbbookingsystem` database.  
     - Creates the `airbnbbookingsystem` database.  
     - Creates all 20 tables with their primary and foreign keys.  
     - Inserts all sample data rows into each table. 

3. **Verify the installation**

   In your SQL client, run:
   USE airbnbbookingsystem;
```
SELECT COUNT() AS user_count FROM User;
SELECT COUNT() AS booking_count FROM Booking;
```

You should observe approximately 20 rows for these core tables (and similar counts for other entities). 

## Running the Test Queries

1. **Select the database**

The test script already includes:
USE airbnbbookingsystem;


at the top. Make sure the database is created and populated before running it. 

2. **Execute `test-queries.sql`**

- Open `test-queries.sql` in your SQL client and execute all statements. 
- This will:
  - Run a multi-join query across `Booking`, `Host`, `HotelRoom`, `Payment`, and `Guest`, showing combined booking, host, room, payment, and guest details.
  - Execute specific tests per entity:
    - `User`: select users where `PhoneNumber` matches a pattern (e.g., containing `555`). 
    - `Guest`: select guests based on `SocialNetworkLink` values (e.g., links that contain “facebook”). 
    - `Host`: select hosts filtered by phone number pattern.
    - `HotelRoom` + `Location`: join rooms with locations, filter by country and price. 
    - `Booking`: select bookings above a certain `Amount`. 
    - `CreditCard`: select cards by `ExpiryDate`.
    - `Review`: filter reviews containing certain keywords. 
    - `SocialNetwork`, `Communication`, `Calculation`, `Availability`, `Photograph`, `Profile`, `Rating`, `Feedback`, `Confirmation`, `Inquiry`, `Payment`, `Income`: each has at least one test query to verify data and relationships.

## Example Use Cases

Below are typical analytical and operational questions that this database can answer. 
- **High-value bookings**  
Retrieve all bookings above a certain amount along with payment status to analyze high-value stays. 
- **Available rooms by location**  
Join `HotelRoom`, `Location`, and `Availability` to list currently available rooms in a specific city or country.
- **Host performance**  
Use `Income`, `Booking`, and `Calculation` to compute and compare income across hosts. 

- **Guest satisfaction**  
Combine `Review`, `Rating`, and `Feedback` to study satisfaction scores and comments per room or host. 

- **Communication and support analysis**  
Analyze `Communication` and `Inquiry` data to understand how guests interact with hosts and what questions are most frequent. 

## Project Goals and Learning Outcomes

The main goals of this project are: 

- To design a normalized, relational data model for an Airbnb-like booking platform (conceptual to logical schema). 
- To implement the schema using SQL with proper primary and foreign keys and maintain referential integrity across 20 tables. 
- To populate the database with realistic dummy data that supports non-trivial queries and analysis. 
- To validate the design using a structured set of test queries, including complex joins and filtered selections, demonstrating the robustness and expressiveness of the schema.
This database provides a solid foundation for experimenting with SQL querying, performance analysis, reporting, and potential integration into higher-level applications or dashboards. 
