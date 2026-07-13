CREATE DATABASE RetailDB;
USE RetailDB;



-- ============================================================
-- Create Customers Table
-- ============================================================

CREATE TABLE Customers
(
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(100),
    city VARCHAR(50),
    state CHAR(2),
    zip_code INT
);

-- ============================================================
-- Create Sales Table
-- ============================================================

CREATE TABLE Sales
(
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    quantity INT,
    total_amount DECIMAL(10,2),

    CONSTRAINT FK_Customer
    FOREIGN KEY(customer_id)
    REFERENCES Customers(customer_id)
);


-- ============================================================
-- Insert Records into Customers Table (1-50)
-- ============================================================

INSERT INTO Customers VALUES
(1,'John','Smith','john.smith@domain.com','555-0001','123 Elm St','Springfield','IL',62701),
(2,'Emma','Jones','emma.jones@webmail.com','555-0002','456 Oak St','Centerville','OH',45459),
(3,'Olivia','Brown','olivia.brown@outlook.com','555-0003','789 Pine St','Greenville','SC',29601),
(4,'Liam','Johnson','liam.johnson@gmail.com','555-0004','101 Maple St','Riverside','CA',92501),
(5,'Noah','Williams','noah.williams@yahoo.com','555-0005','202 Birch St','Lakeside','TX',75001),
(6,'Alice','Miller','alice.miller@aol.com','555-0006','303 Cedar St','Oakland','CA',94601),
(7,'Isabella','Davis','isabella.davis@icloud.com','555-0007','404 Spruce St','Boise','ID',83701),
(8,'James','Martinez','james.martinez@live.com','555-0008','505 Walnut St','Des Moines','IA',50301),
(9,'Sophia','Garcia','sophia.garcia@zoho.com','555-0009','606 Cherry St','Albany','NY',12201),
(10,'Lucas','Rodriguez','lucas.rodriguez@hotmail.com','555-0010','707 Maple St','Portland','OR',97201),
(11,'Mia','Lopez','mia.lopez@mail.com','555-0011','808 Oak St','Miami','FL',33101),
(12,'William','Anderson','william.anderson@fastmail.com','555-0012','909 Pine St','Nashville','TN',37201),
(13,'Amelia','Thomas','amelia.thomas@protonmail.com','555-0013','1010 Elm St','Denver','CO',80201),
(14,'Ethan','Taylor','ethan.taylor@inbox.com','555-0014','1111 Birch St','Minneapolis','MN',55401),
(15,'Harper','Jackson','harper.jackson@outlook.com','555-0015','1212 Cedar St','Seattle','WA',98101),
(16,'Jackson','White','jackson.white@ymail.com','555-0016','1313 Spruce St','Atlanta','GA',30301),
(17,'Charlotte','Harris','charlotte.harris@webmail.com','555-0017','1414 Walnut St','San Diego','CA',92101),
(18,'Oliver','Martin','oliver.martin@icloud.com','555-0018','1515 Cherry St','Indianapolis','IN',46201),
(19,'Madison','Thompson','madison.thompson@gmail.com','555-0019','1616 Maple St','Charlotte','NC',28201),
(20,'Elijah','Garcia','elijah.garcia@zoho.com','555-0020','1717 Oak St','Detroit','MI',48201),
(21,'Scarlett','Wilson','scarlett.wilson@live.com','555-0021','1818 Pine St','Jacksonville','FL',32201),
(22,'Henry','Moore','henry.moore@yahoo.com','555-0022','1919 Elm St','Boston','MA',2101),
(23,'Evelyn','Lee','evelyn.lee@aol.com','555-0023','2020 Birch St','Pittsburgh','PA',15201),
(24,'Daniel','Walker','daniel.walker@fastmail.com','555-0024','2121 Cedar St','St. Louis','MO',63101),
(25,'Harper','Hall','harper.hall@inbox.com','555-0025','2222 Spruce St','Honolulu','HI',96801);
(26,'Matthew','Allen','matthew.allen@domain.com','555-0026','2323 Walnut St','Milwaukee','WI',53201),
(27,'Sofia','Young','sofia.young@webmail.com','555-0027','2424 Cherry St','San Antonio','TX',78201),
(28,'Leo','King','leo.king@outlook.com','555-0028','2525 Maple St','Las Vegas','NV',89101),
(29,'Nora','Wright','nora.wright@gmail.com','555-0029','2626 Oak St','Orlando','FL',32801),
(30,'David','Scott','david.scott@zoho.com','555-0030','2727 Pine St','Columbus','OH',43201),
(31,'Chloe','Adams','chloe.adams@aol.com','555-0031','2828 Elm St','San Jose','CA',95101),
(32,'James','Green','james.green@mail.com','555-0032','2929 Birch St','San Francisco','CA',94101),
(33,'Grace','Baker','grace.baker@live.com','555-0033','3030 Cedar St','Jackson','MS',39201),
(34,'Lucas','Mitchell','lucas.mitchell@gmail.com','555-0034','3131 Spruce St','Washington','DC',20001),
(35,'Harper','Mitchell','harper.mitchell@zoho.com','555-0035','3232 Walnut St','Philadelphia','PA',19101),
(36,'Mason','Campbell','mason.campbell@aol.com','555-0036','3333 Cherry St','Baltimore','MD',21201),
(37,'Avery','Allen','avery.allen@fastmail.com','555-0037','3434 Maple St','Charlotte','NC',28202),
(38,'Logan','Carter','logan.carter@gmail.com','555-0038','3535 Oak St','El Paso','TX',79901),
(39,'Aria','Davis','aria.davis@live.com','555-0039','3636 Pine St','Memphis','TN',38101),
(40,'Benjamin','Evans','benjamin.evans@zoho.com','555-0040','3737 Elm St','Denver','CO',80202),
(41,'Penelope','Roberts','penelope.roberts@aol.com','555-0041','3838 Birch St','Las Vegas','NV',89102),
(42,'Elijah','Young','elijah.young@gmail.com','555-0042','3939 Cedar St','Houston','TX',77001),
(43,'Lily','Turner','lily.turner@webmail.com','555-0043','4040 Spruce St','Chicago','IL',60601),
(44,'Daniel','Morris','daniel.morris@zoho.com','555-0044','4141 Walnut St','San Diego','CA',92102),
(45,'Charlotte','Wood','charlotte.wood@aol.com','555-0045','4242 Cherry St','New York','NY',10001),
(46,'Michael','Cooper','michael.cooper@fastmail.com','555-0046','4343 Maple St','Seattle','WA',98102),
(47,'Amelia','James','amelia.james@live.com','555-0047','4444 Oak St','San Antonio','TX',78202),
(48,'James','Walker','james.walker@gmail.com','555-0048','4545 Pine St','Dallas','TX',75201),
(49,'Elena','Gray','elena.gray@zoho.com','555-0049','4646 Elm St','Detroit','MI',48202),
(50,'Henry','Phillips','henry.phillips@aol.com','555-0050','4747 Birch St','Indianapolis','IN',46202);



-- ============================================================
-- Insert Records into Sales Table (1-50)
-- ============================================================

INSERT INTO Sales VALUES
(1,1,1,'2024-01-15',2,39.98),
(2,1,3,'2024-01-20',1,29.99),
(3,2,2,'2024-01-16',1,25.00),
(4,2,4,'2024-01-22',3,89.97),
(5,3,5,'2024-01-17',2,49.98),
(6,4,6,'2024-01-18',4,119.96),
(7,4,7,'2024-01-25',1,15.50),
(8,5,8,'2024-01-19',3,66.75),
(9,6,9,'2024-01-20',2,40.00),
(10,7,10,'2024-01-21',5,110.95),
(11,8,11,'2024-01-22',1,20.00),
(12,9,12,'2024-01-23',4,79.96),
(13,10,13,'2024-01-24',2,55.00),
(14,11,14,'2024-01-25',1,25.00),
(15,12,15,'2024-01-26',3,67.47),
(16,13,16,'2024-01-27',2,34.00),
(17,14,17,'2024-01-28',1,15.00),
(18,15,18,'2024-01-29',4,92.00),
(19,16,19,'2024-01-30',3,60.00),
(20,17,20,'2024-01-31',2,40.00),
(21,18,1,'2024-02-01',1,19.99),
(22,18,2,'2024-02-05',2,39.98),
(23,19,3,'2024-02-06',1,29.99),
(24,20,4,'2024-02-07',3,89.97),
(25,21,5,'2024-02-08',2,49.98);
(26,22,6,'2024-02-09',4,119.96),
(27,23,7,'2024-02-10',1,15.50),
(28,24,8,'2024-02-11',5,99.95),
(29,25,9,'2024-02-12',2,40.00),
(30,26,10,'2024-02-13',3,66.75),
(31,27,11,'2024-02-14',4,79.96),
(32,28,12,'2024-02-15',2,45.00),
(33,29,13,'2024-02-16',1,35.98),
(34,30,14,'2024-02-17',3,71.97),
(35,31,15,'2024-02-18',2,50.00),
(36,32,16,'2024-02-19',1,27.50),
(37,33,17,'2024-02-20',2,34.00),
(38,34,18,'2024-02-21',4,92.00),
(39,35,19,'2024-02-22',3,60.00),
(40,36,20,'2024-02-23',1,18.75),
(41,37,1,'2024-02-24',2,39.98),
(42,38,2,'2024-02-25',1,19.99),
(43,39,3,'2024-02-26',4,89.96),
(44,40,4,'2024-02-27',2,40.00),
(45,41,5,'2024-02-28',3,67.47),
(46,42,6,'2024-03-01',1,22.50),
(47,43,7,'2024-03-02',2,40.00),
(48,44,8,'2024-03-03',3,55.50),
(49,45,9,'2024-03-04',4,109.96),
(50,46,10,'2024-03-05',1,12.99);





-- ============================================================
-- Display Customers Table
-- ============================================================

SELECT * FROM Customers;

-- ============================================================
-- Display Sales Table
-- ============================================================

SELECT * FROM Sales;




-- ============================================================
-- Exercise 1: Total Order Amount for Each Customer
-- ============================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(s.total_amount) AS total_spend
FROM Customers c
INNER JOIN Sales s
ON c.customer_id = s.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY c.customer_id;




-- ============================================================
-- Exercise 2: Top 3 Customers by Total Spend
-- ============================================================

SELECT TOP 3
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(s.total_amount) AS total_spend
FROM Customers c
INNER JOIN Sales s
ON c.customer_id = s.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_spend DESC;




-- ============================================================
-- Exercise 3: Customers with No Orders
-- ============================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM Customers c
LEFT JOIN Sales s
ON c.customer_id = s.customer_id
WHERE s.customer_id IS NULL;




-- ============================================================
-- Exercise 4: City-wise Total Revenue
-- ============================================================

SELECT
    c.city,
    SUM(s.total_amount) AS total_revenue
FROM Customers c
INNER JOIN Sales s
ON c.customer_id = s.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC;



-- ============================================================
-- Exercise 5: Average Order Amount per Customer
-- ============================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    AVG(s.total_amount) AS average_order
FROM Customers c
INNER JOIN Sales s
ON c.customer_id = s.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY c.customer_id;







-- ============================================================
-- Exercise 6: Customers with More Than One Order
-- ============================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(s.sale_id) AS total_orders
FROM Customers c
INNER JOIN Sales s
ON c.customer_id = s.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(s.sale_id) > 1;





-- ============================================================
-- Exercise 7: Sort Customers by Total Spend Descending
-- ============================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(s.total_amount) AS total_spend
FROM Customers c
INNER JOIN Sales s
ON c.customer_id = s.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_spend DESC;

