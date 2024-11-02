
# DataWarehouse Project - Customer 360

This project is a **Customer 360 Data Warehouse** designed to store and analyze e-commerce customer data. By consolidating data into a star schema, the warehouse supports efficient querying and insights into customer behaviors, sales trends, and product performance. The project utilizes MySQL for the data warehouse, Jupyter Notebook for data transformation, and SQL scripts for table creation, data insertion, and analysis.

## Table of Contents

- [Overview](#overview)
- [Data Model](#data-model)
- [Project Structure](#project-structure)
- [Requirements](#requirements)
- [Setup and Installation](#setup-and-installation)
- [Usage](#usage)
- [SQL Analysis](#sql-analysis)
- [Future Enhancements](#future-enhancements)
- [Contributing](#contributing)

## Overview

The objective of this project is to build a data warehouse that enables a **Customer 360° view** for an e-commerce retailer. This centralized repository of data supports complex queries for understanding customer demographics, sales trends, product performance, and regional sales distribution. It follows a **Star Schema** model with a central fact table and supporting dimension tables.

## Data Model

The data warehouse is structured as a **Star Schema** with one central fact table (`Sales`) and several dimension tables:

1. **Customer_Details** - Information about customers including location and demographics.
2. **Product** - Details of products categorized by type.
3. **Time** - Time information (day, month, quarter, year) for sales transactions.
4. **Region** - Regional grouping of customer locations.
5. **Sales (Fact Table)** - Central fact table containing transactional sales data.

### Schema Diagram

```
           Product
              |
Customer_Details---Sales---Time---Region
              |
            Region
```

## Project Structure

The project is organized as follows:

```plaintext
.
├── sql/
│   ├── create_tables.sql       # SQL script for creating tables
│   ├── insert_data.sql         # SQL script for inserting data
│   └── analysis_queries.sql    # SQL queries for analysis
├── Customer 360.ipynb          # Jupyter Notebook for data transformation
├── Customer 360 for Retail E-commerce.xlsx  # Raw dataset (Excel)
├── requirements.txt            # Python dependencies
└── README.md                   # Project documentation
```

## Requirements

- Python 3.8+
- Jupyter Notebook
- MySQL Server
- MySQL Connector for Python (`mysql-connector-python`)
- GitHub CLI (optional)

### Python Libraries

Install the required Python libraries by running:

```bash
pip install -r requirements.txt
```

## Setup and Installation

1. **Set up MySQL Database**:
   - Create a MySQL database named `customer360` using:
     ```sql
     CREATE DATABASE customer360;
     ```

2. **Run SQL Scripts**:
   - Execute `create_tables.sql` to create the tables.
   - Run `insert_data.sql` to insert data into the tables.

3. **Configure Database Connection**:
   - Ensure that the MySQL credentials in `Customer 360.ipynb` are correct for connecting to the database.

4. **Load Data via Jupyter Notebook**:
   - Open `Customer 360.ipynb` in Jupyter Notebook.
   - Run each cell to process, transform, and load data into the MySQL tables.

## Usage

1. **Exploratory Data Analysis**:
   - Run analysis queries from `analysis_queries.sql` for insights on sales, customer demographics, and product performance.
   
2. **Sample Queries**:
   - **Monthly Sales Analysis**:
     ```sql
     SELECT t.month, SUM(s.sales) AS monthly_sales
     FROM Sales s
     JOIN Time t ON s.time_id = t.time_id
     GROUP BY t.month;
     ```

   - **Top Selling Products**:
     ```sql
     SELECT p.category, SUM(s.sales) AS total_sales
     FROM Sales s
     JOIN Product p ON s.product_id = p.product_id
     GROUP BY p.category
     ORDER BY total_sales DESC
     LIMIT 5;
     ```

## SQL Analysis

The `analysis_queries.sql` file contains various SQL queries for analyzing the data warehouse:

- **Yearly Sales Growth**: Compare yearly sales growth across different regions and customer demographics.
- **Top-Selling Products by Category**: Identify popular product categories.
- **Customer Segmentation by Region**: Analyze customer buying patterns based on regional demographics.
- **Sales by Month and Quarter**: Analyze seasonal trends and peak purchasing periods.

### Key Analysis Queries

1. **Yearly Growth in Sales**:
   ```sql
   SELECT t1.year, SUM(t2.sales) AS total_sales
   FROM Time t1
   JOIN Sales s ON t1.time_id = s.time_id
   GROUP BY t1.year;
   ```

2. **Quarterly Sales**:
   ```sql
   SELECT t.quarter, SUM(s.sales) AS quarterly_sales
   FROM Sales s
   JOIN Time t ON s.time_id = t.time_id
   GROUP BY t.quarter;
   ```

## Future Enhancements

- **Integration with BI Tools**: Connect the data warehouse to business intelligence tools like Tableau or Power BI for enhanced visualization.
- **More Dimensions**: Add additional dimensions such as `Product Supplier` and `Customer Loyalty`.
- **Data Refresh Automation**: Set up an ETL pipeline to automate data extraction and transformation.

