CREATE TABLE Expressmart
(
    order_id INT,
	product VARCHAR(40), 
	quantity_ordered INT,
	price_each NUMERIC(7,2),
	order_date DATE,
	purchase_address VARCHAR(50),
	month VARCHAR(5),
	year INT,
	quarter INT,
	time TIME,
	sales NUMERIC(7,2),
	city VARCHAR(30),
	hour INT,
	time_period VARCHAR(15),
	am_pm CHAR(2)
);

--Peak by hour

SELECT 
     hour,
	 SUM(sales) AS total_sales
FROM expressmart
GROUP BY hour
ORDER BY total_sales DESC;

--Peak by AM/PM

SELECT 
     am_pm,
	 SUM(sales) AS total_sales
FROM expressmart
GROUP BY am_pm
ORDER BY total_sales DESC;


--Peak by Month

SELECT 
     month,
	 SUM(sales) AS total_sales
FROM expressmart
GROUP BY month
ORDER BY total_sales DESC;


--Best Performing Product

SELECT 
     product,
	 SUM(sales) AS total_sales
FROM expressmart
GROUP BY product 
ORDER BY total_sales DESC;

--by quantity ordered

SELECT 
     product,
	 SUM(quantity_ordered) AS total_quantity,
	 SUM(sales) AS total_sales
FROM expressmart
GROUP BY product 
ORDER BY total_sales DESC;

--by price


SELECT 
     product,
	 price_each,
	 SUM(sales) AS total_sales
FROM expressmart
GROUP BY product,price_each 
ORDER BY total_sales DESC;

--by time of the day

SELECT 
     product,
	 price_each,
	 SUM(sales) AS total_sales
FROM expressmart
GROUP BY product,price_each 
ORDER BY total_sales DESC;


-- sales by region

SELECT 
     city,
	 SUM(quantity_ordered) AS total_quantity,
	 SUM(sales) AS total_sales
FROM expressmart
GROUP BY city
ORDER BY total_sales DESC;

--most purchased product

SELECT 
     product,
	 SUM(quantity_ordered) AS total_ordered
FROM expressmart
GROUP BY product 
ORDER BY total_ordered DESC;

--trend by months

SELECT 
     month,
	 SUM(sales) AS total_sales
FROM expressmart
GROUP BY month 
ORDER BY 
CASE month
    WHEN 'Jan' THEN 1
    WHEN 'Feb' THEN 2
    WHEN 'Mar' THEN 3
	WHEN 'April' THEN 4
	WHEN 'May' THEN 5
	WHEN 'June' THEN 6
	WHEN 'July' THEN 7
	WHEN 'Aug' THEN 8
	WHEN 'Sept' THEN 9
	WHEN 'Oct' THEN 10
	WHEN 'Nov' THEN 11
    WHEN 'December' THEN 12
END;

--quarter trend

SELECT 
     quarter,
	 SUM(sales) AS total_sales
FROM expressmart
GROUP BY quarter 
ORDER BY quarter
