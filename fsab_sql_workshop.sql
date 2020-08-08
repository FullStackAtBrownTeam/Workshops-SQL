USE sqlworkshop;
SELECT * FROM cholera;

/* Select country and fatality rate columns from the cholera table */
SELECT country, fatality_rate 
FROM cholera;

/* Select where year is 2009*/
SELECT * 
FROM cholera 
WHERE year=2009;

/* Select where year is 2009 and in the Eastern Mediterranean region*/
SELECT * 
FROM cholera
WHERE year=2009 AND who_region="Eastern Mediterranean";

/* Select where year is 2009 or region is Africa, and not Eastern Mediterranean */
SELECT *
FROM cholera
WHERE year=2009 OR who_region="Africa" AND NOT "Eastern Mediterranean";

/* Select where year is 2009 or region is Africa, and not Eastern Mediterranean, and order by decreasing fatality rate*/
SELECT *
FROM cholera
WHERE year=2009 OR who_region="Africa" AND NOT "Eastern Mediterranean"
ORDER BY fatality_rate DESC;

/* Find the highest number of reported cases in Africa in 2007 */
SELECT MAX(reported_cases) AS LowestCases
FROM cholera
WHERE year=2007 AND who_region="Africa";

/* Find the number of countries with a fatality rate less than 0.5 in 2009 */
SELECT COUNT(fatality_rate)
FROM cholera
WHERE fatality_rate<0.5 AND year=2009;

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

/* Find the number of dogs bought by each customer */
USE sqlworkshop;
SELECT customers.CustomerName, COUNT(dogs.Breed)
FROM customers
INNER JOIN dogs ON customers.CustomerID = dogs.CustomerID
GROUP BY customers.CustomerName;


