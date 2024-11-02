-- Insert data into Customer_Details table
INSERT INTO Customer_Details (customer_id, customer_name, city, state, region)
VALUES
(1, 'Harish', 'Vellore', 'Tamil Nadu', 'North'),
(2, 'Sudha', 'Krishnagiri', 'Tamil Nadu', 'South'),
(3, 'Hussain', 'Perambalur', 'Tamil Nadu', 'West');

-- Insert data into Product table
INSERT INTO Product (product_id, category, subcategory)
VALUES
(1, 'Oil & Masala', 'Masalas'),
(2, 'Beverages', 'Health Drinks'),
(3, 'Food Grains', 'Atta & Flour');

-- Insert data into Time table
INSERT INTO Time (time_id, order_date, day, month, quarter, year)
VALUES
(1, '2017-11-08', 8, 11, 4, 2017),
(2, '2017-06-12', 12, 6, 2, 2017),
(3, '2016-10-11', 11, 10, 4, 2016);

-- Insert data into Region table
INSERT INTO Region (region_id, region_name)
VALUES
(1, 'North'),
(2, 'South'),
(3, 'West');

-- Insert data into Sales table
INSERT INTO Sales (order_id, customer_id, product_id, time_id, region_id, sales, discount, profit)
VALUES
(1, 1, 1, 1, 1, 1254.00, 0.12, 401.28),
(2, 2, 2, 2, 2, 1500.00, 0.15, 500.00),
(3, 3, 3, 3, 3, 2000.00, 0.10, 700.00);
