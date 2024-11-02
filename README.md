
# Customer 360 for Retail E-commerce Data Warehouse

## Overview

This project is a **Customer 360 Data Warehouse** solution built to consolidate and analyze e-commerce customer data. The goal is to create a unified view of each customer by integrating data from various sources, enabling targeted marketing, improved customer experiences, and data-driven decision-making.

## Table of Contents

- [Case Study](#case-study)
- [Problem Statement](#problem-statement)
- [Project Goals](#project-goals)
- [Solution Outline](#solution-outline)
- [Star Schema Design](#star-schema-design)
  - [Dimension and Fact Tables](#dimension-and-fact-tables)
- [Project Structure](#project-structure)
- [Requirements](#requirements)
- [Setup and Installation](#setup-and-installation)
- [Usage](#usage)
- [SQL Analysis](#sql-analysis)
- [Expected Outcomes](#expected-outcomes)
- [Future Enhancements](#future-enhancements)
- [Contributing](#contributing)

---

## Case Study

### Background
An e-commerce company specializing in unique all-occasion gifts serves customers across the UK and internationally. The company’s customer data is spread across multiple systems (CRM, marketing platforms, and sales databases), which makes it difficult to obtain a complete view of each customer. This fragmentation results in inconsistent customer experiences and limits the company’s ability to execute targeted marketing effectively.

### Problem Statement
The company struggles to deliver personalized customer experiences due to siloed data across multiple systems, which leads to:
- Inefficiencies in understanding customer needs.
- Missed opportunities for targeted product recommendations.
- Inconsistent messaging across customer touchpoints.

## Project Goals

The primary objectives of this project are to:
1. **Create a Unified Customer View**: Consolidate data on demographics, purchase history, preferences, and interactions to gain a complete view of each customer.
2. **Improve Customer Segmentation**: Segment customers based on demographics, shopping behaviors, and preferences.
3. **Enhance Marketing Campaigns**: Use customer segments for targeted marketing, increasing the likelihood of conversions.
4. **Provide Personalized Recommendations**: Enable the use of recommendation algorithms to suggest relevant products to customers.

## Solution Outline

### Data Collection:
- Collect customer data from the e-commerce system, CRM, and marketing platforms.
- Use the **Online Retail II** dataset (UCI Machine Learning Repository) for this project, containing:
  - Customer Information: ID, demographic details, location.
  - Purchase History: Product details, quantities, and purchase amounts.
  - Sales Transactions: Dates and itemized transaction details.

### Data Transformation (Star Schema Design):
- **Fact Table**:
  - Sales Fact Table with details like InvoiceNo, Quantity, UnitPrice, CustomerID, StockCode, InvoiceDate.
- **Dimension Tables**:
  - Customer Dimension: `CustomerID`, `Country`, and demographic data.
  - Product Dimension: `StockCode` and `Description`.
  - Date Dimension: Breakdown of `InvoiceDate` into `Year`, `Month`, `Day`, and `Time`.

### Data Loading:
- Load transformed data into MySQL with foreign key relationships between the fact table and dimension tables.

### Data Analysis and Reporting:
- Generate insights on customer behavior, segmentation, high-value customers, and marketing effectiveness.
- Create dashboards to visualize metrics like customer lifetime value, retention rates, and product affinities.

---

## Star Schema Design

This schema consolidates customer data, product information, time details, regional data, and sales transactions into a unified structure. Below is a description of each table in the schema.

### Dimension and Fact Tables

#### 1. Customer Dimension (`Customer_Details`)
Captures unique information about each customer, enabling analysis based on location and purchasing behavior.

**Columns:**
- `customer_id`: Primary Key, unique identifier for each customer.
- `customer_name`: Customer's name.
- `city`, `state`, `region`: Geographic details.

#### 2. Product Dimension (`Product`)
Contains product categories and subcategories, allowing for product-level insights.

**Columns:**
- `product_id`: Primary Key, unique identifier for each product.
- `category`, `subcategory`: Classification of products.

#### 3. Time Dimension (`Time`)
Breaks down transaction dates for time-based analysis.

**Columns:**
- `time_id`: Primary Key, unique identifier for each date.
- `order_date`, `day`, `month`, `quarter`, `year`: Date components.

#### 4. Region Dimension (`Region`)
Stores unique regions for geographic analysis.

**Columns:**
- `region_id`: Primary Key, unique identifier for each region.
- `region_name`: Name of the region.

#### 5. Fact Table (`Sales`)
Central table that records transactional data, linked to all dimension tables.

**Columns:**
- `order_id`: Primary Key, unique identifier for each order.
- Foreign Keys: `customer_id`, `product_id`, `time_id`, `region_id`.
- `sales`, `discount`, `profit`: Transactional metrics.

---

## Project Structure

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

Install the required Python libraries:

```bash
pip install -r requirements.txt
```

## Setup and Installation

1. **Set up MySQL Database**:
   - Create a MySQL database named `customer360`:
     ```sql
     CREATE DATABASE customer360;
     ```

2. **Run SQL Scripts**:
   - Execute `create_tables.sql` to create the tables.
   - Run `insert_data.sql` to insert data.

3. **Configure Database Connection**:
   - Ensure the MySQL credentials in `Customer 360.ipynb` are correct.

4. **Load Data via Jupyter Notebook**:
   - Open `Customer 360.ipynb`.
   - Run each cell to process and load data into MySQL tables.

## Usage

### Run Analysis Queries

1. **Open `analysis_queries.sql`** and run each query in MySQL Workbench or another SQL editor.

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

## Expected Outcomes

- **Improved Customer Experience**: Personalized interactions across customer touchpoints.
- **Increased Sales**: Through targeted marketing and recommendations.
- **Operational Efficiency**: Reduced data handling and increased insight accuracy.

## Future Enhancements

- **Integration with BI Tools**: Connect to BI tools like Tableau or Power BI for visualization.
- **Additional Dimensions**: Add more dimensions (e.g., `Product Supplier`, `Customer Loyalty`).
- **Data Refresh Automation**: Automate the ETL process for regular data updates.
