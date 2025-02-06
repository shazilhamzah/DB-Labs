SELECT * FROM salesman;
SELECT * FROM orders;
SELECT * FROM customers;

-- 1
SELECT * FROM customers where city='New York' ORDER BY cust_name;

-- 2
SELECT * FROM customers where cust_name like '%John%' and (city='London' or city='Paris' or city='New York');

-- 3
SELECT * FROM customers WHERE city='London'  or city='New York';

-- 4
SELECT * FROM orders WHERE purch_amt>500;

-- 5 
SELECT * FROM salesman WHERE name LIKE '_a%';

-- 6 
UPDATE salesman SET commission = commission + 0.5 WHERE city='San Jose';

-- 7
SELECT * FROM orders ORDER BY ord_date desc;

-- 8
SELECT SUBSTRING(name,1,CHARINDEX(' ',name)) AS firstname FROM salesman;

-- 9
SELECT * FROM orders where MONTH(ord_date)=01;

-- 10
SELECT YEAR(ord_date) as 'year'  FROM orders WHERE MONTH(ord_date)=10;
SELECT DATEPART(WEEK,ord_date) as 'week' FROM orders WHERE MONTH(ord_date)=10;
SELECT DATEPART(DAYOFYEAR,ord_date) as 'dayofyear' FROM orders WHERE MONTH(ord_date)=10;
SELECT MONTH(ord_date) 'month' FROM orders WHERE MONTH(ord_date)=10;
SELECT DAY(ord_date) as 'day' FROM orders WHERE MONTH(ord_date)=10;
SELECT DATEPART(WEEKDAY,ord_date) as 'weekday' FROM orders WHERE MONTH(ord_date)=10;

-- 11
UPDATE orders SET purch_amt=purch_amt*3 WHERE MONTH(ord_date)=10;

-- 12
SELECT * FROM customers WHERE customer_id IN (SELECT customer_id FROM orders WHERE YEAR(ord_date)=2011 or YEAR(ord_date)=2013);


-- 13
SELECT TOP 1 commission FROM salesman order by commission desc;