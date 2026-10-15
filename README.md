# Online_Retail_Analytics_Pipeline
End-to-end Data Analytics pipeline using Python, PostgreSQL, and Microsoft Power BI

**Project Overview**
This project analyzes historical online retail transaction data to explore sales performance, customer purchasing behavior, product performance, and sales trends over time.
The project follows an end-to-end data analytics workflow, starting with data cleaning and preparation in Python, continuing with data storage and querying in PostgreSQL, and concluding with interactive data visualization in Power BI.
The objective is to transform raw transactional data into meaningful insights that can support business analysis and decision-making.

**Objectives**
The main objectives of this project are to:

- Clean and prepare transactional data for analysis.
- Explore sales performance across different countries.
- Identify customers with the highest total purchase value.
- Analyze monthly sales trends and changes over time.
- Identify top-performing products based on transaction value.
- Explore purchasing activity by day of the week and hour.
- Build an interactive Power BI dashboard to communicate the results.

  **Dataset**
  -Source : [https://archive.ics.uci.edu/dataset/352/online+retail]
  
The dataset contains transactions from a UK-based online retail business between December 2010 and December 2011.
The original dataset contains 541,909 transaction records.
### Main fields

| Column         | Description |

| InvoiceNo      | Invoice identifier |
| StockCode      | Product identifier |
| Description    | Product description |
| Quantity       | Number of units purchased |
| InvoiceDate    | Date and time of the transaction |
| UnitPrice      | Price per unit |
| CustomerID     | Customer identifier |
| Country        | Customer's country |

Additional analytical fields were created during data preparation, including `total_amount`, `year`, `month`, `year_month`, `day_of_week`, and `hour`.

**Tools & Technologies**

### 1. Data Cleaning and Preparation — Python
The original dataset was inspected and processed using Python.

The preparation workflow included:

- Checking missing values and data quality.
- Removing records with missing customer identifiers.
- Excluding records with non-positive quantities.
- Excluding records with non-positive unit prices.
- Converting date and numerical columns to appropriate data types.
- Calculating transaction amounts using quantity multiplied by unit price.
- Creating additional date-related fields for time-based analysis.
- Exporting the processed dataset to CSV for further analysis.
  
  To ensure data quality and integrity, specific cleaning steps were applied in Python:

* **Removed Missing Customer IDs (~135,000 rows):** Records without a `CustomerID` were excluded because anonymous transactions prevent accurate customer segmentation and repeat purchase analysis.
* **Filtered Out Non-Positive Quantities & Prices (~10,000 rows):** 
  * Transactions with `Quantity <= 0` represented product returns or order cancellations (e.g., invoices starting with 'C'). These were removed to analyze **Net Revenue** and avoid distorting total sales volume.
  * Records with `UnitPrice <= 0` were removed as they represented inventory adjustments or system errors rather than real commercial transactions.
* **Deduplication (~5,200 rows):** Identified and removed identical duplicate records to avoid double-counting sales.
* **Final Clean Dataset:** **397,884 verified records** ready for analysis.

### 2. Database Setup — PostgreSQL
A PostgreSQL database named `Online_Retail_DB` was created to store the processed dataset.

A table named `online_retail` was defined with appropriate data types for transaction identifiers, product information, quantities, prices, customer identifiers, and analytical fields.

The processed CSV file was then imported into PostgreSQL.

### 3. Exploratory Data Analysis — Python

Initial exploratory analysis was performed to understand the structure and characteristics of the data.

The analysis focused on transaction amounts, customer activity, country-level performance, and temporal patterns.

### 4. SQL Analysis — PostgreSQL

SQL queries were developed to answer business-oriented questions, including:

- Which countries generate the highest total transaction value?
- Which customers have the highest total purchase value?
- How does total transaction value change from month to month?
- Which products have the highest total transaction value?
- How does purchasing activity vary by day of the week and hour?

Aggregations and sorting were used to summarize the transaction data and identify patterns for further investigation.

### 5. Dashboard Development — Power BI

Power BI was connected to the PostgreSQL database to build an interactive sales overview dashboard.

The dashboard includes:

- KPI cards for key sales and transaction metrics.
- A monthly transaction-value trend.
- A comparison of transaction value across countries.
- A ranking of products by transaction value.
- A matrix exploring transaction value by day of the week and hour.
- A country slicer for interactive filtering.

The dashboard is designed to provide an accessible overview of sales performance and support further exploration of the data.

**Dashboard preview**

<img width="1566" height="763" alt="Dashboard_preview" src="https://github.com/user-attachments/assets/415cde0d-2af2-4967-a9e3-2ae981f7acfb" />


## Key Findings & Recommendations

* **Holiday Sales Seasonality:** Revenue increases significantly starting in Q3 and peaks in **November 2011 (£1.18M)** due to early holiday shopping. 
  * *Recommendation:* Inventory replenishment and stock planning should begin by early September to avoid stockouts during peak quarter.
* **Peak Ordering Window:** Transaction intensity peaks on **Wednesdays around 12:00 PM**.
  * *Recommendation:* Schedule email marketing campaigns between 10:00 AM – 11:00 AM on Wednesdays for maximum engagement, and perform system/website maintenance during late evening off-peak hours.
* **Geographic Target Markets:** Over 80% of revenue comes from the UK. Outside the UK, the top revenue-generating markets are the Netherlands, EIRE, Germany, and France.

## Data Limitations

The analysis uses a processed version of the original dataset, so the results should be interpreted in the context of the cleaning decisions.

- Records without a customer identifier were excluded. Consequently, the analysis does not include all original transactions.
- Records with non-positive quantities were excluded. Returns and cancellation-related transactions may therefore be absent from the analysis.
- Records with non-positive unit prices were excluded.
- The dataset covers a limited historical period and should not be treated as a representation of current retail performance.

These decisions simplify the initial analysis but limit the interpretation of total sales and customer behavior.

## Future Improvements

Potential extensions include:

- Investigating returns and cancelled transactions separately.
- Comparing results from the original and processed datasets.
- Developing additional customer and product performance metrics.
- Creating more advanced DAX measures in Power BI.
- Exploring customer purchasing patterns and sales concentration.
- Improving the dashboard's visual design and interactivity.

  ## Author ##

**Dimitris Ntouros**
