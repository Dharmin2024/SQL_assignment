# Task 1 Using count, get number of cities in USA
-- first explore city table
/*
select*
from city
;
*/
-- we'll need the CountryCode from country table, lets explore country table
/*
select*
from country
;
*/
-- Country code for United states is USA

/*
select COUNT(*)
from city
where CountryCode = 'USA'
;
*/

-- Task 2
-- Population and average life expectantcy
/*
select Population, LifeExpectancy
from country
WHERE Code = 'ARG'
;
*/

-- Task 3
-- Which country has highest life expectancy?
select code, name, LifeExpectancy
from country
ORDER BY LifeExpectancy DESC
Limit 1
;

-- Task 4
-- Countries that start with 'F'
-- NB there are 78 results, I didnt order them, just 
-- just added limit 25
select name
from city
WHERE name LIKE 'F%'
LIMIT 25
;

-- Task 5
select ID, Name, Population
from city
Limit 10
;

-- Task 6
select ID, Name, Population
from city
where Population > 2000000
;
-- Task 7
-- City names with 'Be' but eye balling it I saw Be and Be^ accent e. 
-- Just ran 'B%' first. Ok, can see few types of be
-- Now run multiple where to capture all
-- Ah, no need, BE captures accent e too. i.e Bechar and Benguela. yolo
select *
from city
WHERE name LIKE 'Be%'
;

-- Task 8
-- Pop between 500,000 and 1,000,000
-- Not sure if its between or two where , so checkcing the difference first. 
-- BETWEEN gave me 303, Two WHERE gave me 301. Hmm investigate
-- Order by limit 5 then DSC limit 5. See which ones are different
-- Order by and limit, didnt work. So googled it. 
-- Between is inclusive i.e 500,000 =< and >= 1,000,000 whereas WHERE is > and <. 
-- So made a query, ran it. This tells you the difference between WHERE and BETWEEN. BOOM! it was Amman and Pointe-Noire
			/*select ID, Name, Population
			from city
			where Population = 500000 
			or population = 1000000
			;
			*/

select ID, Name, Population
from city
where Population between 500000 AND 1000000
Order by Population
;
select ID, Name, Population
from city
where Population > 500000 
AND population < 1000000
Order by Population
;
-- This tells you the different. BOOM! it was Amman and Pointe-Noire
/*select ID, Name, Population
from city
where Population = 500000 
or population = 1000000
;
*/

-- Task 9
-- Lowest population in city table
select ID, Name, Population
from city
Order By Population
Limit 1;

-- PAGE 20 Task BONUS 
-- Capital of Spain
select*
from country
where name = 'united states';

select*
from city
where ID = '3813';


select city.name AS 'Capital_of_Country', city.CountryCode, country.name
from city
JOIN country
ON city.ID = country.capital
WHERE country.name = 'Spain'
;


-- Page 20 BONUS 2
-- Languages in Caribbean region
-- Explore both tables. 
-- countrylanguage --> CountryCode and country --> Code
-- Extract more columns than you need, sense check
/*select*
from country;
select*
from countrylanguage;
*/

select  country.code, country.region, country.Name, countrylanguage.language
from country
join countrylanguage
ON country.code = countrylanguage.countrycode
WHERE country.region = 'Caribbean'
;

select DISTINCT countrylanguage.language
from country
join countrylanguage
ON country.code = countrylanguage.countrycode
WHERE country.region = 'Caribbean'
;


-- Page 20 Bonus 3
-- All cities in Europe continent
-- Exploring tables, select* from country; select* from city; 
-- found search and result columns; Country.Continent and city.name
-- Will only join on city.countrycode and country.code

select 
city.countrycode, 
city.name AS 'CityName', 
country.continent
from country
join city
ON country.code = city.countrycode
WHERE country.continent = 'Europe';




