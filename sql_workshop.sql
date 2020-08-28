/* Specify the database */
USE workshop;

/* Display all records from the customers table */
SELECT * FROM customers;

/* Show the CustomerID and CustomerName columns */
SELECT CustomerID, CustomerName FROM customers;

/* Find the customer's name (ID = 4) */
SELECT CustomerID, CustomerName
FROM customers
WHERE CustomerID=4;

/* Select records where order number > 105 */
SELECT *
FROM customers
WHERE OrderNum > 105;

/* Find Shaggy Roger's order number */ 
SELECT OrderNum, CustomerName
FROM customers
WHERE CustomerName='Shaggy Rogers';

/* Show all records from the cholera table */
SELECT * FROM cholera2;

/* Select country and fatality rate columns from the cholera table */
SELECT country, fatality_rate FROM cholera2;

/* Select where year is 2009 and in the Eastern Mediterranean region*/
SELECT *
FROM cholera2
WHERE year=2009 AND who_region='Eastern Mediterranean';

/* Select where year is 2000 or 2001 in Africa */
SELECT *
FROM cholera2
WHERE (year=2000 OR year=2001) AND who_region='Africa';

/* Select where year is 2000 or 2001 in Africa, and order by decreasing fatality rate */
SELECT *
FROM cholera2
WHERE (year=2000 Or year=2001) AND who_region='Africa'
ORDER BY fatality_rate DESC;

/* Find the highest number of reported cases in Africa in 2007 */
SELECT MAX(reported_cases) 
FROM cholera2
WHERE who_region='Africa' AND year=2007;

/* Find the number of countries with a fatality rate less than 0.5 in 2009 */
SELECT COUNT(fatality_rate)
FROM cholera2
WHERE fatality_rate<0.5 AND year=2009;

/* Find the average fatality rate of countries in 2009 */
SELECT AVG(fatality_rate)
FROM cholera2
WHERE year=2009;

/* Find the sum of cases in the Americas in 2010 */
SELECT SUM(reported_cases) AS SumCases
FROM cholera2
WHERE who_region='Americas' AND year=2010;

/* Find the fatality rate and region of countries that start with "A" */
SELECT country, fatality_rate, who_region
FROM cholera2
WHERE country LIKE 'A%';

/* Find the total number of reported deaths per country */
SELECT country, SUM(reported_deaths)
FROM cholera2
GROUP BY country;

/* Find the number of dogs bought by each customer (Inner Join) */
USE workshop;
SELECT customers.CustomerName, dogs.Breed
FROM customers
INNER JOIN dogs ON customers.OrderNum = dogs.OrderNumber;

USE workshop;
SELECT customers.CustomerName, COUNT(dogs.Breed)
FROM customers
INNER JOIN dogs ON customers.OrderNum = dogs.OrderNumber
GROUP BY CustomerName;

/* Show the Customer Name, ID, order number, and breed (Left Join) */
USE workshop;
SELECT customers.CustomerName, customers.CustomerID, customers.OrderNum, dogs.Breed
FROM customers
LEFT JOIN dogs ON customers.OrderNum = dogs.OrderNumber;

/* more resources: https://dev.mysql.com/doc/refman/8.0/en/database-use.html */