USE sqlworkshop;

SELECT * FROM customers;

SELECT CustomerID, CustomerName FROM customers;

SELECT CustomerName
FROM customers
WHERE CustomerID = 4;

SELECT *
FROM customers
WHERE OrderNumber > 105;

SELECT OrderNumber
FROM customers
WHERE CustomerName = 'Shaggy Rogers';

SELECT * FROM cholera;

/* Select country and fatality rate columns from the cholera table */
SELECT country, fatality_rate 
FROM cholera;

/* Select where year is 2009 and in the Eastern Mediterranean region*/
SELECT * 
FROM cholera
WHERE year=2009 AND who_region="Eastern Mediterranean";

/* Select where year is 2000 or 2001 in Africa (incorrect because no parentheses) */
SELECT *
FROM cholera
WHERE year = 2000 OR year = 2001 AND who_region = "Africa";

/* Select where year is 2000 or 2001 in Africa, and order by decreasing fatality rate */
SELECT *
FROM cholera
WHERE ((year = 2000) OR (year = 2001)) AND who_region = "Africa";

/* Select where year is 2000 or 2001 in Africa,  and order by decreasing fatality rate*/
SELECT *
FROM cholera
WHERE year = 2000 OR year = 2001 AND who_region = "Africa"
ORDER BY fatality_rate DESC;

/* Find the highest number of reported cases in Africa in 2007 */
SELECT MAX(reported_cases) AS LowestCases
FROM cholera
WHERE year=2007 AND who_region="Africa";

/* Find the number of countries with a fatality rate less than 0.5 in 2009 */
SELECT COUNT(fatality_rate)
FROM cholera
WHERE fatality_rate < 0.5 AND year=2009;

/* Find the average fatality rate of countries in 2009 */
SELECT AVG(fatality_rate)
FROM cholera
WHERE year=2009;

/* Find the sum of cases in the Americas in 2010 */
SELECT SUM(reported_cases)
FROM cholera
WHERE year=2010 AND who_region="Americas";

/* Find the fatality rate and region of countries that start with "A" */
SELECT country, fatality_rate, who_region
FROM cholera
WHERE country LIKE 'A%';

/* Find the total number of reported deaths per country */
SELECT COUNT(reported_deaths), country
FROM cholera
GROUP BY country;

/* Find the number of dogs bought by each customer (Inner Join) */
USE sqlworkshop;
SELECT customers.CustomerName, COUNT(dogs.Breed)
FROM customers
INNER JOIN dogs ON customers.OrderNumber = dogs.OrderNumber
GROUP BY customers.CustomerName;

/* Show the Customer Name, ID, order number, and breed (Left Join) */
USE sqlworkshop;
SELECT customers.CustomerName, customers.CustomerID, customers.OrderNumber, dogs.Breed
FROM customers
LEFT JOIN dogs
ON customers.OrderNumber = dogs.OrderNumber;

/* more resources: https://dev.mysql.com/doc/refman/8.0/en/database-use.html */
