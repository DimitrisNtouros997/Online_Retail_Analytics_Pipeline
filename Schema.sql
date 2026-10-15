CREATE TABLE online_retail (
    invoice_no VARCHAR(20),
    stock_code VARCHAR(20),
    description TEXT,
    quantity INT,
    invoice_date TIMESTAMP,
    unit_price NUMERIC(10, 2),
    customer_id INT,
    country VARCHAR(50),
    total_amount NUMERIC(12, 2),
    year INT,
    month VARCHAR(20),
    year_month VARCHAR(7),
    day_of_week VARCHAR(20),
    hour INT
);