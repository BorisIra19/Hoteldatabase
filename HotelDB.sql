-- Create the HOTEL table
CREATE TABLE HOTEL (
    hotel_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    location VARCHAR2(255) NOT NULL,
    established_date DATE
);

-- Create the ROOM table
CREATE TABLE ROOM (
    room_id NUMBER PRIMARY KEY,
    room_number VARCHAR2(10) NOT NULL,
    room_type VARCHAR2(50) NOT NULL, -- e.g., Single, Double, Suite
    rate_per_night NUMBER(10, 2) NOT NULL,
    hotel_id NUMBER,
    FOREIGN KEY (hotel_id) REFERENCES HOTEL(hotel_id) ON DELETE CASCADE
);

-- Create the STAFF table
CREATE TABLE STAFF (
    staff_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    position VARCHAR2(50) NOT NULL, -- e.g., Receptionist, Housekeeping, Manager
    phone VARCHAR2(15),
    email VARCHAR2(100),
    hire_date DATE
);


-- Create the GUEST table
CREATE TABLE GUEST (
    guest_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100),
    phone VARCHAR2(15),
    check_in_date DATE
);



-- Create the BOOKING table (Many-to-Many between GUEST and ROOM)
CREATE TABLE BOOKING (
    booking_id NUMBER PRIMARY KEY,
    room_id NUMBER NOT NULL,
    guest_id NUMBER NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    status VARCHAR2(20) NOT NULL, -- e.g., Confirmed, Cancelled
    FOREIGN KEY (room_id) REFERENCES ROOM(room_id) ON DELETE CASCADE,
    FOREIGN KEY (guest_id) REFERENCES GUEST(guest_id) ON DELETE CASCADE
);

-- Create the STAFF_ROOM table (Many-to-Many between STAFF and ROOM)
CREATE TABLE STAFF_ROOM (
    staff_id NUMBER NOT NULL,
    room_id NUMBER NOT NULL,
    assignment_date DATE,
    PRIMARY KEY (staff_id, room_id),
    FOREIGN KEY (staff_id) REFERENCES STAFF(staff_id) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES ROOM(room_id) ON DELETE CASCADE
)






-- Insert sample data into the HOTEL table
INSERT INTO HOTEL (hotel_id, name, location, established_date)
VALUES (1, 'Luxury Suites', 'Downtown City Center', TO_DATE('2005-08-01', 'YYYY-MM-DD'));

INSERT INTO HOTEL (hotel_id, name, location, established_date)
VALUES (2, 'Ocean View Resort', 'Seaside Boulevard', TO_DATE('2010-05-15', 'YYYY-MM-DD'));


-- Insert sample data into the ROOM table
INSERT INTO ROOM (room_id, room_number, room_type, rate_per_night, hotel_id)
VALUES (1, '101', 'Single', 75.00, 1);

INSERT INTO ROOM (room_id, room_number, room_type, rate_per_night, hotel_id)
VALUES (2, '102', 'Double', 120.00, 1);

INSERT INTO ROOM (room_id, room_number, room_type, rate_per_night, hotel_id)
VALUES (3, '201', 'Suite', 300.00, 2);


-- Insert sample data into the STAFF table
INSERT INTO STAFF (staff_id, name, position, phone, email, hire_date)
VALUES (1, 'John Doe', 'Manager', '555-1234', 'john.doe@example.com', TO_DATE('2015-03-20', 'YYYY-MM-DD'));

INSERT INTO STAFF (staff_id, name, position, phone, email, hire_date)
VALUES (2, 'Jane Smith', 'Housekeeping', '555-5678', 'jane.smith@example.com', TO_DATE('2018-07-12', 'YYYY-MM-DD'));





-- Insert sample data into the GUEST table
INSERT INTO GUEST (guest_id, name, email, phone, check_in_date)
VALUES (1, 'Alice Johnson', 'alice.johnson@example.com', '555-9876', TO_DATE('2024-10-01', 'YYYY-MM-DD'));

INSERT INTO GUEST (guest_id, name, email, phone, check_in_date)
VALUES (2, 'Bob Brown', 'bob.brown@example.com', '555-6543', TO_DATE('2024-10-03', 'YYYY-MM-DD'));






-- Insert sample data into the STAFF_ROOM table
INSERT INTO STAFF_ROOM (staff_id, room_id, assignment_date)
VALUES (1, 1, TO_DATE('2024-10-01', 'YYYY-MM-DD'));

INSERT INTO STAFF_ROOM (staff_id, room_id, assignment_date)
VALUES (2, 2, TO_DATE('2024-10-02', 'YYYY-MM-DD'));

-- Commit the transaction
COMMIT;
 
 
 
-- Update the rate per night for the room with room_id = 1
UPDATE ROOM
SET rate_per_night = 80.00
WHERE room_id = 1;





-- Delete the guest with guest_id = 2
DELETE FROM GUEST
WHERE guest_id = 2;

 
 
 -- Select query with a join to retrieve booking details, guest name, and hotel name
SELECT B.booking_id, G.name AS guest_name, R.room_number, H.name AS hotel_name, B.check_in_date, B.check_out_date
FROM BOOKING B
JOIN GUEST G ON B.guest_id = G.guest_id
JOIN ROOM R ON B.room_id = R.room_id
JOIN HOTEL H ON R.hotel_id = H.hotel_id
WHERE B.status = 'Confirmed';





-- Grant SELECT permission to C##BORIS on the GUEST table
GRANT SELECT ON GUEST TO C##BORIS;



-- Start the transaction
BEGIN;

-- Insert a new guest into the GUEST table
INSERT INTO GUEST (guest_id, name, email, phone, check_in_date) 
VALUES (4, 'Michael Brown', 'michael.brown@email.com', '1234567890', TO_DATE('2024-01-01', 'YYYY-MM-DD'));

COMMIT;

