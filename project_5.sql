

CREATE TABLE Books (
    ID INT PRIMARY KEY NOT NULL,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    Genre VARCHAR(255) NOT NULL,
    Publication_year DATETIME NOT NULL,
    Availability_status VARCHAR(255) NOT NULL
);

CREATE TABLE Members (
    ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Contact_information VARCHAR(255) NOT NULL,
    Membership_Type VARCHAR(255) NOT NULL,
    Registration_date DATE NOT NULL
);


CREATE TABLE Library_staff (
    ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Contact_info VARCHAR(255) NOT NULL,
    Assigned_section VARCHAR(255) NOT NULL,
    Employment_date DATETIME NOT NULL
);

CREATE TABLE Financial_fines (
    ID INT PRIMARY KEY NOT NULL,
    Member_ID INT,
    Amount DECIMAL,
    Payment_status VARCHAR(250),
    FOREIGN KEY (Member_ID) REFERENCES Members(ID)
);
CREATE TABLE Categories (
    ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Description VARCHAR(255) NOT NULL
);
CREATE TABLE Borrowing (
    ID INT PRIMARY KEY NOT NULL,
    Member_ID INT NOT NULL,
    Book_ID INT NOT NULL,
    Borrowing_date DATETIME NOT NULL,
    Due_date DATETIME NOT NULL,
    Return_date DATETIME,
    FOREIGN KEY (Book_ID) REFERENCES Books(ID),
    FOREIGN KEY (Member_ID) REFERENCES Members(ID)
);

CREATE TABLE Reservation (
    ID INT PRIMARY KEY NOT NULL,
    Member_ID INT NOT NULL,
    Book_ID INT NOT NULL,
    Reservation_date DATETIME NOT NULL,
    Status VARCHAR(255) NOT NULL,
    FOREIGN KEY (Member_ID) REFERENCES Members(ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(ID)
);




CREATE TABLE Genre (
    Book_ID INT NOT NULL,
    Categorie_ID INT NOT NULL,
    FOREIGN KEY (Book_ID) REFERENCES Books(ID),
    FOREIGN KEY (Categorie_ID) REFERENCES Categories(ID)
);




-- Insert into Books
INSERT INTO Books (ID, Title, Author, Genre, Publication_year, Availability_status) VALUES 
(1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', '1960-07-11', 'Available'),
(2, '1984', 'George Orwell', 'Dystopian', '1949-06-08', 'Borrowed'),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', '1925-04-10', 'Available'),
(4, 'Moby Dick', 'Herman Melville', 'Adventure', '1851-10-18', 'Reserved'),
(5, 'Pride and Prejudice', 'Jane Austen', 'Romance', '1813-01-28', 'Available');

-- Insert into Members with updated Membership_Type
INSERT INTO Members (ID, Name, Contact_information, Membership_Type, Registration_date) VALUES 
(1, 'Ali Ahmed', 'ali@gmail.com', 'Teacher', '2023-05-12'),
(2, 'Sara Khan', 'sara@yahoo.com', 'Student', '2022-11-20'),
(3, 'Omar Hassan', 'omar@gmail.com', 'Visitor', '2021-08-15'),
(4, 'Lina Saeed', 'lina@hotmail.com', 'Teacher', '2020-03-10'),
(5, 'Hassan Raza', 'hassan@mail.com', 'Student', '2024-01-05');

-- Insert into Library_staff
INSERT INTO Library_staff (ID, Name, Contact_info, Assigned_section, Employment_date) VALUES 
(1, 'John Doe', 'john@library.com', 'Fiction', '2018-06-01'),
(2, 'Mary Smith', 'mary@library.com', 'Research', '2019-09-15'),
(3, 'Ahmed Ali', 'ahmed@library.com', 'Magazines', '2020-02-20'),
(4, 'Fatima Noor', 'fatima@library.com', 'Children', '2021-07-30'),
(5, 'James Wilson', 'james@library.com', 'History', '2017-12-10');

-- Insert into Categories
INSERT INTO Categories (ID, Name, Description) VALUES 
(1, 'Fiction', 'Books with imaginary stories'),
(2, 'Non-Fiction', 'Books based on real events'),
(3, 'Science', 'Books related to scientific studies'),
(4, 'History', 'Books on historical events'),
(5, 'Philosophy', 'Books discussing philosophical ideas');

-- Insert into Borrowing
INSERT INTO Borrowing (ID, Member_ID, Book_ID, Borrowing_date, Due_date, Return_date) VALUES 
(1, 1, 2, '2024-02-01 10:00:00', '2024-02-15 10:00:00', NULL),
(2, 2, 4, '2024-01-15 12:30:00', '2024-01-29 12:30:00', '2024-01-27 15:00:00'),
(3, 3, 1, '2024-02-05 14:45:00', '2024-02-19 14:45:00', NULL),
(4, 4, 3, '2024-02-07 09:20:00', '2024-02-21 09:20:00', '2024-02-19 11:00:00'),
(5, 5, 5, '2024-02-10 16:10:00', '2024-02-24 16:10:00', NULL);

-- Insert into Reservation with "Canceled" option added
INSERT INTO Reservation (ID, Member_ID, Book_ID, Reservation_date, Status) VALUES 
(1, 1, 3, '2024-02-01 09:00:00', 'Pending'),
(2, 2, 5, '2024-01-20 11:30:00', 'Completed'),
(3, 3, 2, '2024-02-05 14:00:00', 'Canceled'),
(4, 4, 1, '2024-02-08 10:15:00', 'Completed'),
(5, 5, 4, '2024-02-12 13:45:00', 'Pending');

-- Insert into Genre
INSERT INTO Genre (Book_ID, Categorie_ID) VALUES 
(1, 1),
(2, 2),
(3, 1),
(4, 3),
(5, 4);

INSERT INTO Books (ID, Title, Author, Genre, Publication_year, Availability_status)
VALUES (6, 'SQL Mastery', 'John Doe', 'Technology', '2020-01-15', 'Available');
select * from Books

INSERT INTO Members (ID, Name, Contact_information, Membership_Type, Registration_date, Email)
VALUES (7, 'Alice Johnson', 'alice@example.com', 'Student', '2023-05-10', 'Suhaibzyad@gmail.com');

INSERT INTO Borrowing (ID, Member_ID, Book_ID, Borrowing_date, Due_date, Return_date) VALUES 
(6, 7, 6, '2024-01-01 10:00:00', '2024-01-15 10:00:00', '2024-01-14 12:00:00'),
(7, 7, 6, '2024-02-01 10:00:00', '2024-02-15 10:00:00', '2024-02-14 12:00:00'),
(8, 7, 6, '2024-03-01 10:00:00', '2024-03-15 10:00:00', '2024-03-14 12:00:00'),
(9, 7, 6, '2024-04-01 10:00:00', '2024-04-15 10:00:00', '2024-04-14 12:00:00');

INSERT INTO Borrowing (ID, Member_ID, Book_ID, Borrowing_date, Due_date, Return_date)
VALUES 
(10, 2, 1, '2024-01-01 10:00:00', '2024-01-15 10:00:00', '2024-01-20 10:00:00');

SELECT *
from Members where Members.Registration_date= '2023-05-12 '


SELECT *
from Books where Books.Title = 'The Great Gatsby'

ALTER table Members add Email varchar(250);

INSERT Members values (6, 'Omar' , '9876543210' , 'Student' , '5-6-2024', 'Omar@gmail.com' );

--Select * 
--From Members
--inner join Reservation on Members.ID = Reservation.Member_ID
--where Status = 'Completed'

SELECT DISTINCT Members.*
FROM Members
INNER JOIN Reservation ON Members.ID = Reservation.Member_ID;


SELECT * 
From Members
inner join Borrowing on Members.ID = Borrowing.Member_ID
inner join Books on Borrowing.Book_ID = Books.ID
where Title = 'To Kill a Mockingbird' 

Select *
from Members
inner join Borrowing on Members.ID = Borrowing.Member_ID
inner join Books on Borrowing.Book_ID = Books.ID
where title = 'Moby Dick' and Return_date = '2023-05-12'

SELECT *
FROM Members
INNER JOIN Borrowing ON Members.ID = Borrowing.Member_ID
WHERE Borrowing.Return_date > Borrowing.Due_date;




SELECT Books.ID, Books.Title, COUNT(Borrowing.Book_ID) AS Borrowed_Times
FROM Borrowing
INNER JOIN Books ON Borrowing.Book_ID = Books.ID
GROUP BY Books.ID, Books.Title
HAVING COUNT(Borrowing.Book_ID) > 3;


SELECT *
FROM Members
INNER JOIN Borrowing ON Members.ID = Borrowing.Member_ID
WHERE Borrowing.Borrowing_date BETWEEN '2024-01-01' AND '2024-01-10';


SELECT COUNT(*) AS Total_Books
FROM Books
WHERE Availability_status = 'Available';


SELECT Members.*, Borrowing.Book_ID, Borrowing.Borrowing_date
FROM Members
INNER JOIN Borrowing ON Members.ID = Borrowing.Member_ID
WHERE Borrowing.Return_date IS NULL;


SELECT DISTINCT Members.*
FROM Members
INNER JOIN Borrowing ON Members.ID = Borrowing.Member_ID
INNER JOIN Books ON Borrowing.Book_ID = Books.ID
INNER JOIN Genre ON Books.ID = Genre.Book_ID
INNER JOIN Categories ON Genre.Categorie_ID = Categories.ID
WHERE Categories.Name = 'Fiction';

