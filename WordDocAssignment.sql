
-- Word document

-- Task 1 - Count Citis in USA

-- Explore tables using select * to see all
select* from city;
select* from country;
-- searching with name in country.name. result in city.name 
-- We need to do a join. The common columns are city.countrycode and country.code

select*
from country
join city
ON country.code = city.countrycode
;

select COUNT(city.name)
from country
join city
ON country.code = city.countrycode
WHERE country.name = 'United States'
;

-- Task 2 - Highest life expectancy
-- *** REPEATED ***

-- Task 3 - New Year Promotion
-- All cities with the word 'NEW" in it

select* from city
WHERE name LIKE '%New%'
;
-- Got 14 rows. Sure they dont want Khanewal...hmm Do they want Newcastle? One word?
-- Just the word New space or Space New. Got 8 hits. Missed Newcastle etc
select* from city
WHERE name LIKE '%New %'
OR name LIKE '% New%'
;
-- This will capture all Newcastles and Newarks, and second word New and first word New. 
select* from city
WHERE name LIKE 'New%'
OR name LIKE '% New%'
;


-- Task 4 - 10 most populated cities
select*
from city
order by Population desc
Limit 10;

-- Task 5 *** REPEATED*** 
-- Task 6 *** REPEATED*** 
-- Task 7 *** REPEATED*** 

-- Task 8 Sort citys ascending order
select* from city
Order by name;

-- Task 9 Most Populated city
select*from city order by population desc limit 1;

-- Task 10 Frequency of City names
-- Explore tables
select* 
from city 
where name like 'San%' 
order by name ;
-- Checked some San Jose and San Juan, makes sense. 
select count(name), name
from city
Group by name 
order by count(name) desc
;

-- Task 11 ** REPEATED** 
-- Task 12 Country largest Population
select* 
from country
ORDER BY population desc
LIMIT 1
;
-- TASK 13, 14, 15 *** REPEATED***

-- Task 16 - Average Population by country
-- Feels like I'm missing something, why so easy? 
select 
population 
from country
order by population DESC;

-- Task 17 - Capital cities' population comparison
-- No one table has 'capital city'. The city table has cities. 
-- The country table has a column called 'Capital'. it can be null. 
-- Explore tables
select* from city;
select* from country;
-- ID in City and Capital in Country table are keys
-- Figure out the joins first. 
-- Worried about Capital being null. Messing with left join and order of tables.
Select *
from country
left join city
ON city.ID = country.Capital
;
-- Join works, now re-lable confusing column headings
Select 
city.name AS 'Capital City', 
country.name AS 'Country', 
city.Population AS 'Population of City', 
country.population AS 'Population of Country'
from country
left join city
ON city.ID = country.Capital
;


-- TASK 18 - Countries with Low Population Density
-- Agricultural, low density is population/surface area
select* from country; -- Nothing specific about agriculture land. Just surface area
-- Explore REAL vs interger stuff first
-- SA is decimal and Population is int
select name, SurfaceArea, population, population/surfacearea
from country
WHERE name = 'Albania';
-- Checked above that 28,748.00 (number) divided by 3,401,200 (int) results in 118.3108. 
-- No need for CAST or *1.0 etc. YOLO. Onwards!

select 
name, 
SurfaceArea, 
population, 
population/surfacearea as 'Population Density'
from country
Order by 4;


-- BONUS TIME!
-- 
-- TASK 19 Cities with High GDP per capita
-- Explore tables. City has population, but not GDP/GNP, ignore for now
select* from country; -- 239 countries
select* from city; -- 4079 cities
-- 'CountyCode' in City table maps to 'Code' in Country table. 
select*
from city
JOIN country
ON city.countrycode = country.Code;

-- Time for better column names and only the ones we need

select 
city.name AS 'CityName', 
city.population AS 'Population_of_City', 
country.name AS 'Country', 
country.GNP AS 'GNP of Country',
country.population as 'Country Population'

from city
JOIN country
ON city.countrycode = country.Code;
-- How to allocation GDP to City? 
-- Fictional example to explain the maths. GNP 500. Total Pop=12. City1pop= 2. City2pop = 8. 2 ive in the countryside.
-- GNP per capita 500/12 = 41.67
-- City 1 has (2/12) or 17% of the population. 
-- 17% of GDP is 83.3. So City1 contributes 83.3 units of GDP, of the total 500. 

-- Now im stuck. As 17% of GDP is 83.3. But dividing that back by the city pop, gets you exactly Country GDP, by defintion. 
-- Further explore with tables....

WITH  TempTable AS
(select 
city.name AS 'CityName', 
city.population AS 'Population_of_City', 
country.name AS 'Country', 
country.GNP AS 'GNP_of_Country',
country.population as 'Country_Population'

from city
JOIN country
ON city.countrycode = country.Code
-- WHERE country.name = 'Afghanistan' This is to see just a few cities and small country. 
)
SELECT 
CityName,
(Population_of_city/Country_Population) *GNP_of_Country AS 'CityEstimatedGNP',
 GNP_of_country/Country_population as 'GNPperCapita', 
 GNP_of_Country,
 Population_of_city,
 Country_population
from temptable
Order by 2 desc;

-- I think the best we can do is show Cities with High estimated GDP/GNP. BUT NOT PER CAPITA


-- Task 20 Show cities in specific range of Rows
-- Show 31st to 40th by ranked by population
-- Rank 1 is highest population city btw
select* from city
Order by Population desc
-- LIMIT 2 OFFSET 3;
LIMIT 10 OFFSET 30;


