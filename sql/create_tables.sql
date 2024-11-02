-- Create Customer_Details table
CREATE TABLE IF NOT EXISTS Customer_Details (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(50)
);

-- Create Product table
CREATE TABLE IF NOT EXISTS Product (
    product_id INT PRIMARY KEY,
    category VARCHAR(100),
    subcategory VARCHAR(100)
);

-- Create Time table
CREATE TABLE IF NOT EXISTS Time (
    time_id INT PRIMARY KEY,
    order_date DATE,
    day INT,
    month INT,
    quarter INT,
    year INT
);

-- Create Region table
CREATE TABLE IF NOT EXISTS Region (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(50)
);

-- Create Sales table (fact table)
CREATE TABLE IF NOT EXISTS Sales (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    time_id INT,
    region_id INT,
    sales DECIMAL(10, 2),
    discount DECIMAL(10, 2),
    profit DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customer_Details(customer_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (time_id) REFERENCES Time(time_id),
    FOREIGN KEY (region_id) REFERENCES Region(region_id)
);
