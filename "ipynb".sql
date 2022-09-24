SELECT `max price amount`, `min price amount`
FROM `mens shoes`

 

SELECT *
FROM `mens shoes`
WHERE `colors` <> 'beige'

SELECT AVG(`min price amount`) 
FROM `mens shoes`

SELECT *
FROM `mens shoes`
WHERE `min price amount` > 10

SELECT *
FROM `mens shoes`
WHERE `max price amount` >= 10

SELECT *
FROM `mens shoes`
WHERE `brand names` LIKE 'S%'

SELECT `sale`, COUNT(`sale`) AS countsale
FROM `mens shoes`
WHERE `color` = 'beige'
GROUP BY `sale`
ORDER BY 4 DESC


------ Selecting the data that we are going to be using --

SELECT *
FROM 




