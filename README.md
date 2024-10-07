

# Hotel Management Database

## Overview

The **Hotel Management Database** is designed to efficiently manage hotels, their rooms, staff, and guest bookings. This SQL-based system provides an organized structure to handle room availability, guest details, staff assignments, and booking records, ensuring smooth hotel operations and data retrieval.

## Database Schema

The database consists of several core tables to store essential information about rooms, staff, and guests, along with junction tables to handle many-to-many relationships between rooms and bookings, as well as rooms and staff.

### Core Tables

1. **HOTEL**: This table stores basic details about each hotel in the system, including the name, location, and the date it was established. Every hotel is identified by a unique hotel_id.

2. **ROOM**: This table contains details about each room in a hotel, such as the room number, type (e.g., single, double, suite), and rate per night. Each room is identified by a unique room_id.

3. **STAFF**: This table holds information about hotel staff, including staff name, position, and contact details. Each staff member has a unique staff_id.

4. **GUEST**: This table contains information about guests who stay at the hotel. Each guest has a unique guest_id, and additional details like name, email, and check-in date are captured for guest management.

![Reference](/creating.png)

### Junction Tables

1. **BOOKING**: This table establishes a many-to-many relationship between guests and rooms. A room can have multiple bookings, and a guest can book multiple rooms during different stays. The table includes the room_id, guest_id, check-in and check-out dates, and booking status (confirmed, cancelled, etc.).

2. **STAFF_ROOM**: This table tracks which staff members are responsible for which rooms (e.g., cleaning or room service). A staff member can manage multiple rooms, and a room can have multiple staff members assigned to it over time.

![Reference](/junction.png)

---

## ER Diagram

The **Entity-Relationship (ER) Diagram** visually depicts the relationships between the core entities: **HOTEL**, **ROOM**, **STAFF**, and **GUEST**. It also shows how the junction tables **BOOKING** and **STAFF_ROOM** establish the many-to-many relationships between guests, rooms, and staff. The diagram emphasizes how data is interconnected and highlights the use of foreign keys to ensure referential integrity throughout the system.

![Reference](/ER.png)

---

## Key Features

### Many-to-Many Relationships

The system supports many-to-many relationships between guests and rooms via the **BOOKING** table, and between staff and rooms via the **STAFF_ROOM** table. This allows flexible room assignments for guests and staff responsibilities, ensuring seamless operations.

### Room Availability and Booking Management

The system tracks room availability, including details about each booking (check-in and check-out dates), and maintains the current status (e.g., available, booked, under maintenance). This ensures that hotel staff can efficiently manage room allocations and guest stays.

### Staff Assignments

The system keeps track of which staff members are responsible for each room, helping to ensure that rooms are properly maintained and services are provided efficiently. Multiple staff members can be assigned to a room based on their roles (e.g., cleaning, room service).

## Demonstrated SQL Operations

The system demonstrates a variety of SQL operations for managing hotel data:

- **Inserting Data**: New hotels, rooms, staff, and guests can be added, along with booking records and room assignments for staff.
  
- **Updating Data**: Room details, staff assignments, and guest bookings can be updated as needed to accommodate changes, such as room upgrades or new staff members.

- **Deleting Records**: Booking records or old room assignments can be deleted to maintain the database's relevance and accuracy.



![Reference](/inserting1.png)
![Reference](/inserting2.png)
![Reference](/update%20&%20Delete.png)

---

### Transaction Management
- **Joining Data**: SQL joins can be used to retrieve comprehensive data, such as which rooms are booked by a specific guest, or which staff are responsible for certain rooms.

- **Subqueries**: Subqueries help filter data, such as finding rooms that are available within a specific date range or identifying high-demand room types.

The system supports transaction management using SQL commands like `BEGIN` and `COMMIT` to ensure that operations involving multiple updates (such as booking a guest into a room and assigning staff to that room) are processed together. This ensures data consistency and integrity, especially when handling guest check-ins or cancellations.

### Data Control Language (DCL)

Using **Data Control Language (DCL)** commands, the system demonstrates how to grant or revoke permissions to certain users. For example, certain users may only have read-only access to guest booking information, while others (e.g., hotel managers) may have full access to update room assignments and staff responsibilities.

![Reference](/last.png)

---

## Conclusion

The **Hotel Management Database** is a robust system that efficiently manages hotels, their rooms, staff, and guests. With many-to-many relationships, booking management, and staff assignment tracking, the system provides a flexible and reliable solution for hotel operations, ensuring that room availability, guest stays, and staff services are seamlessly coordinated.

---
 
