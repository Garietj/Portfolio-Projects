

------ About This Data ------

---  This is a list of 10,000 men's and shoes provided by Datafiniti's Product Database.
The dataset includes shoe name, brand, price, and more. Each shoe will have an entry for each price found for it and some 
---shoes may have multiple entries. 

This is a list of 10,000 women's shoes and their product information provided by Datafiniti's Product Database.

The dataset includes shoe name, brand, price, and more. Each shoe will have an entry for each price found for 
it and some shoes may have multiple entries.


--- QUESTIONS WE CAN ANSWER WITH THIS DATA ? ------

- What are the diffences between Men and Womens shoe prices?
- Which brands have the highest prices?
- Which ones have the widest distribution of prices?
- Is there a typical price distribution (e.g., normal) across brands or within specific brands?
- What is the average price of each distinct brand listed?
- Correlate specific product features with changes in price.
- Cross reference the data with mens and womens shoe prices to see if there are any differences between women's brands and men's brands.


---- There is EXTENSIVE possibilites with this data. I have so many angles in which I can approach this data,

but for this project I will only be focusing on solving the following questions below ----

- What are the diffences between Men and Womens shoe prices?
- Which brands have the highest prices?
- What is the average price of each distinct brand listed?
- Correlate specific product features with changes in price.
-  Cross reference the data with mens and womens shoe prices to see if there are any differences between women's brands and men's brands.

------------ I will split this project into 3 segments. Data Cleansing , Data Exploration, and Data Visualization. -------------


---- Data Cleansing ------


---- Okay!!! First thing I did was start off with loading the two tables into the `PortfolioProject` Database ----

------ Next thing I did is take a first glance at the two tables, analyze and prepare for 'Data Cleansing' -------

SELECT *
FROM `mens shoes`

SELECT * 
FROM `womens shoes`


------ Already I am noticing both tables need extensive cleaning, therefore I am referring back to the business problems
    I am trying to solve with this data. Allowing me to understand what data I need to keep and what data can be excluded. -------

- So starting with the `mens table` I used Excel to clean up the columns, fix the column names, delete the columns I dont need, and delete duplicate 
Columns. 

- I will need to do the same for `womens shoes` here...

SELECT *
FROM `womens shoes`

-- DROPPING COLUMNS I DONT NEED --

ALTER TABLE `womens shoes`
DROP COLUMN `asins`

ALTER TABLE `womens shoes`
DROP COLUMN `imageURLs`

ALTER TABLE `womens shoes`
DROP COLUMN `dimension`

ALTER TABLE `womens shoes`
DROP COLUMN `keys`

ALTER TABLE `womens shoes`
DROP COLUMN `manufacturer`

ALTER TABLE `womens shoes`
DROP COLUMN `manufacturerNumber`

ALTER TABLE `womens shoes`
DROP COLUMN `ean / upc`

ALTER TABLE `womens shoes`
DROP COLUMN `prices.condition`

ALTER TABLE `womens shoes`
DROP COLUMN `prices.dateAdded`

ALTER TABLE `womens shoes`
DROP COLUMN `prices.isSale`

ALTER TABLE `womens shoes`
DROP COLUMN `prices.merchant`

ALTER TABLE `womens shoes`
DROP COLUMN `prices.returnPolicy`

ALTER TABLE `womens shoes`
DROP COLUMN `prices.shipping`

ALTER TABLE `womens shoes`
DROP COLUMN `prices.sourceURLs`

ALTER TABLE `womens shoes`
DROP COLUMN `prices.size`

ALTER TABLE `womens shoes`
DROP COLUMN `prices.amountMax`

ALTER TABLE `womens shoes`
DROP COLUMN `primaryCategories`

ALTER TABLE `mens shoes`
DROP COLUMN `Min Price Amount`

ALTER TABLE `mens shoes`
DROP COLUMN `MyUnknownColumn`

ALTER TABLE `mens shoes`
DROP COLUMN `Asins`

ALTER TABLE `womens shoes`
DROP COLUMN `prices.color`

ALTER TABLE `womens shoes`
DROP COLUMN `categories`

ALTER TABLE `mens shoes`
DROP COLUMN `Date Added`,
DROP COLUMN `Date Updated`;

ALTER TABLE `mens shoes`
DROP COLUMN `Manufacturer name`

ALTER TABLE `womens shoes`
DROP COLUMN `dateUpdated`,
DROP COLUMN `name`;

ALTER TABLE `mens shoes`
DROP COLUMN `Merchant`,
DROP COLUMN `Condition`,
DROP COLUMN `Shipping`;

------ Correcting myself as I go, my syntax for dropping multiple columns was not working at first so I dropped them one by one,
   --- After Researching I finally got it to work towards the end of the line of code. -------
   
   -- Now that I have gotten rid of the columns I do not need next I want to Fix the Column Names --
   
   -- I will start with the Mens Shoes Table : Since I have already started editing the table in Excel there isnt much to do. --
   
   ALTER TABLE `mens shoes`
   RENAME COLUMN `Max Price Amount` TO `Price`
   
   -- I noticed looking at the Mens table that the Dates seen and the Dates Added columns should be switched so I will do that now --
   
   ALTER TABLE `mens shoes`
   RENAME COLUMN `Date Seen` TO `Date Added`
   
   ALTER TABLE `mens shoes`
   RENAME COLUMN `Date Added_[0]` TO `Date Seen`
   
   -- THE MENS SHOES TABLE LOOKS MUCH BETTER!! -- 
   
   ---- NEXT IS THE WOMENS SHOES TABLE ----
   
   ALTER TABLE `womens shoes`
   RENAME COLUMN `id` TO `ID`
  
   ALTER TABLE `womens shoes`
   RENAME COLUMN `brand` TO `Brand`
   
   ALTER TABLE `womens shoes`
   RENAME COLUMN `colors` TO `Colors`
   
   ALTER TABLE `womens shoes`
   RENAME COLUMN `prices.amountMin` TO `Prices`
   
   ALTER TABLE `womens shoes`
   RENAME COLUMN `prices.offer` TO `Offers`
   
   ALTER TABLE `womens shoes`
   RENAME COLUMN `prices.currency` TO `Currency`
   
   ALTER TABLE `womens shoes`
   RENAME COLUMN `sizes` TO `Sizes`
   
   ALTER TABLE `womens shoes`
   RENAME COLUMN `sourceURLs` TO `SourceURLs`
   
    ALTER TABLE `womens shoes`
    RENAME COLUMN `prices.availability` TO `Sale`
 
 -- CONVERTING THE DATETIME VALUE TO JUST THE DATE-- 
 
 SELECT DATE_FORMAT(`dateAdded`, '%m/%d/%Y') 
 AS DateAdded 
 FROM `womens shoes`

ALTER TABLE `womens shoes`
MODIFY `prices.dateSeen` VARCHAR(255);

ALTER TABLE `womens shoes`
MODIFY `dateAdded` VARCHAR(255);

SELECT DATE(`Date Seen`)
FROM `womens shoes`

UPDATE `womens shoes`
SET `Date Seen`= (str_to_date(`Date Seen`, "%d/%m/%Y"))

-- I NOTICED THE DATA IN DateAdded Column and prices.dateSeen are supposed to be switched. The prices.dateSeen column is 
-- SUPPOSED TO BE THE DATE ADDED COLUMN AND THE DATE ADDED column is supposed to be the prices.dateSeen column. So we will rename both.--

ALTER TABLE `womens shoes`
RENAME COLUMN `prices.dateSeen` TO `Date Added`


ALTER TABLE `womens shoes`
RENAME COLUMN `dateAdded` TO `Date Seen`
-- NOW I NOTICED GOING THROUGH THE WOMENS TABLE THAT THERE IS AN OUTLIER NAMED 'SALE' IN THE BRAND NAME COLUMN. WHEN
-- I RAN THE QUERY BELOW IT SHOWED THAT THERE WERE 4 RESULTS ALL DIFFERENT. --

select * 
from `womens shoes` 
where Brand = 'SALE'

-- THERE FORE I WILL LEAVE THEM ALONE TO NOT INTERFERE WITH MY DATA. THE BRAND COULD POSSIBLY BE NAMED SALE.
-- THEY ALL WERE ADDED ON THE SAME DAY AT THE SAME TIME, DIFFERENT ID'S AND SIZES. DATE SEEN ARE DIFFERENT AS WELL SO WE
-- WILL ASSUME FROM THE DATA THAT THIS BRAND OF SHOE IS CORRECT. --

select * 
from `womens shoes` 
where `Brand` = 'SALE'
-- NOW I AM JUST GOING THROUGH CHECKING THE DATA TO SEE IF THERE IS ANYTHING ELSE I SHOULD BE CLEANING-- 

SELECT 
 DISTINCT `ID` 
 FROM `womens shoes` 
 
SELECT `Prices` 
FROM `womens shoes` 
ORDER BY `Prices` DESC

SELECT `Price` 
FROM `mens shoes` 
ORDER BY `Price`

SELECT * 
FROM `womens shoes` 
 WHERE `Colors` = '' or `Colors` is null
 
 SELECT *
 FROM `mens shoes` 
 WHERE `Colors` = '' or `Colors` is null
 
 -- I NOTICED LOOKING AT THE DATA THAT SOME OF THE MISSING COLORS AND SIZES ARE LOCATED IN THE SOURCEURLS INFO. I WAS ABLE TO FIND 
 -- SOME OF THE COLORS AND SIZES IN THE DESCRIPTION. SO I WILL FIX THAT NOW IN THE MENS SHOES TABLE.--
 
SELECT *
FROM `mens shoes`
                 
UPDATE `mens shoes`
SET `Colors` = 'Navy', Sizes = '5,6,7'
WHERE `ID` = 'AVpfHrJ6ilAPnD_xVXOI'

UPDATE `mens shoes`
SET `Colors` = 'Studs', `Sizes` = 'Large'
WHERE `ID` = 'AVpfHsWP1cnluZ0-eVZ7'

UPDATE `mens shoes`
SET `Colors` = 'Gray', `Sizes` = '10'
WHERE `ID` = 'AVpfAwehilAPnD_xS_eB'

UPDATE `mens shoes`
SET `Colors` = 'Red, White, Black'
WHERE `ID` = 'AVpe8eQRilAPnD_xRdkQ'

-- I AM CONTINUING TO INPUT THE MISSING DATA IN THE COLUMNS, ALSO WHAT I STARTED DOING WAS COPYING AND PASTING SOME OF THE 
-- SOURCEURLS THAT DO NOT HAVE THE COLORS AND SIZES IN THE DESCRIPTIONS, THAT WAY I CAN SEE THE COLORS AND SIZES OF THE ITEMS.--

UPDATE `mens shoes` 
SET `Colors` = 'Red'
WHERE `ID` = 'AVpfB4DRLJeJML43007A'

UPDATE `mens shoes`
SET `Colors` = 'Black', `Sizes` = '9'
WHERE `ID` = 'AVpfJEaqLJeJML433Rz6'

UPDATE `mens shoes`
SET `Colors` = 'Navy', `Sizes` = '7.5,M'
WHERE `ID` = 'AVpfC7zy1cnluZ0-ctMU'

UPDATE `mens shoes`
SET `Colors` = 'Burgundy, Brown', `Sizes` = '10, 10.5'
WHERE `ID` = 'AVpe_PqTLJeJML43z5IZ'

UPDATE `mens shoes`
SET `Brand names` = 'SOFIAMORE' 
WHERE `ID` = 'AVpfAqU7LJeJML430ZHS'

UPDATE 	`mens shoes`
SET `Brand names` = 'SOFIAMORE'
WHERE `ID` = 'AVpfCG9ZLJeJML4306NN'

UPDATE `mens shoes`
SET `Colors` = 'Crazy Horse Taupe'
WHERE `ID` = 'AVpe8bocLJeJML43y4Kx'

UPDATE `mens shoes`
SET `Sizes` = '7,7W,7.5,8,8W,8.5,8.5W,9,9W,9.5,9.5W,10,10W,10.5,10.5W,11,11W,11.5,11.5W,12,12W,13,13W,14,14W'
WHERE `ID` = 'AVpe8bocLJeJML43y4Kx'

UPDATE `mens shoes`
SET `Colors` = 'Black Grey'
WHERE `ID` = 'AVpfJJUsilAPnD_xV3O7'

UPDATE `mens shoes`
SET `Sizes` = 'Medium'
WHERE `ID` = 'AVpfJJUsilAPnD_xV3O7'

UPDATE `mens shoes`
SET `Brand names` = 'Sebago' , `Sizes` = '7,7.5,8,9,10.5,12,12.5,41,44.5,6'
WHERE `ID` = 'AVpfA9JzilAPnD_xTD13'

UPDATE `mens shoes`
SET `Colors` = 'Cognac', `Sizes` = '6.5,7,7.5,8,8.5,9,9.5,10,10.5,11,11.5,12,13,14,15'
WHERE `ID` = 'AVpfAsCFLJeJML430ZuL'

UPDATE `mens shoes`
SET `Colors` = 'Camo Green', `Sizes` = '9,9.5,10,10.5,11'
WHERE `ID` = 'AVpfJ5iJLJeJML433jbE'

UPDATE `mens shoes`
SET `Colors` = 'Grey'
WHERE `ID` = 'AVpe5byFLJeJML43xyBy'

UPDATE `mens shoes`
SET `Colors` = 'Black', `Sizes` = '5'
WHERE `ID` = 'AVpfK3Zt1cnluZ0-fZTH'

UPDATE `mens shoes`
SET `Colors` = 'Black', `Sizes` = '7'
WHERE `ID` = 'AVpfCjVgLJeJML431D6-'

UPDATE `mens shoes` 
SET 
    `Colors` = 'Black, Dark Smoke Grey, Vivid Sulfur, Chlorine Blue, Off Noir, Platinum, White, Photo Blue, Cargo Khaki, Sequioa, Glacier Blue, Grey Fog, Concord, Cinnabar',
    `Sizes` = '6,6.5,7,7.5,8,8.5,9,9.5,10,10.5,11,11.5,12,13,14,15'
WHERE
    `ID` = 'AVpfJCIHilAPnD_xV02E'
    
    UPDATE `mens shoes`
    SET `Colors` = 'Black', `Sizes` = '8, M'
    WHERE `ID` = 'AVpe9Aej1cnluZ0-anYz'
    
    UPDATE `mens shoes`
    SET `Colors` = 'Leopard' 
    WHERE `ID` = 'AVpe_8W7LJeJML430Ioj'
    
    UPDATE `mens shoes`
    SET `Colors` = 'Black' 'Brown', `Sizes` = '6,7,8,8.5,9,9.5,10,10.5,11,12,12.5,13'
    WHERE `ID` = 'AVpfG4VH1cnluZ0-eEOn'
    
    UPDATE `mens shoes`
    SET `Colors` = 'Chestnut', `Sizes` = '16'
    WHERE `ID` = 'AVpe_8NkilAPnD_xSsz8'
    
    UPDATE `mens shoes`
    SET `Colors` = 'Pink,Blue,White'
    WHERE `ID` = 'AVpe7j3_LJeJML43ykRD'
    
    UPDATE `mens shoes`
    SET `Colors` = 'Black', `Sizes` = '11'
    WHERE `ID` = 'AVpfJwzM1cnluZ0-fCTa'

UPDATE `mens shoes`
SET `Colors` = 'Black' 'White'
WHERE `ID` = 'AVpfLG-kilAPnD_xWghV'

-- I NOTICED THERE WAS FIELDS THAT WERE NOT SHOES BUT OTHER PRODUCTS SO I NEEDED TO REMOVE THEM THATS WHAT I DID BELOW--

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpe7vAlLJeJML43yoQ_'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpe_4Lw1cnluZ0-bold'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfJHn81cnluZ0-e0n7'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpe8jXMLJeJML43y7EO'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfJHn81cnluZ0-e0n7'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpe9XatLJeJML43zOMV'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfA3B9LJeJML430dfh'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpe78PyLJeJML43ytDE'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfDB9J1cnluZ0-cvI6'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfAiUy1cnluZ0-b3sb'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfFO06ilAPnD_xUi2U'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpe5hBn1cnluZ0-ZVXk'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfL5511cnluZ0-fvkD'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpe9AZFilAPnD_xRqN-'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpe81TJLJeJML43zB0d'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpe9Wu0ilAPnD_xRyTF'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfEd3-ilAPnD_xURpQ'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfM2HxLJeJML434hjD'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfFItlilAPnD_xUgsf'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfL9FiilAPnD_xWygO'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfAeVUilAPnD_xS5Ba'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfJ7V-ilAPnD_xWHxR'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfLzUE1cnluZ0-ftZ3'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfLAJW1cnluZ0-fcNx'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpe8w6rilAPnD_xRkhU'

UPDATE `mens shoes`
SET `Colors` = 'Grey Leather' , `Sizes` = '7.5,8,9W,11W,11.5,13'
WHERE `ID` = 'AVpfD4nC1cnluZ0-dB_Q'

UPDATE `mens shoes`
SET `Colors` = 'Black'
WHERE `ID` = 'AVpe_k351cnluZ0-bh2L'

UPDATE `mens shoes`
SET `Colors` = 'White,Grey' 
WHERE `ID` = 'AVpfCBjeLJeJML4304TL'

UPDATE `mens shoes`
SET `Colors` = 'Charcoal' , `Sizes` = '9'
WHERE `ID` = 'AVpfM7LPilAPnD_xXGwo'

UPDATE `mens shoes`
SET `Colors` = 'Black' , `Sizes` = '9.5'
WHERE `ID` = 'AVpe8_Z-1cnluZ0-am-n'

UPDATE `mens shoes`
SET `Colors` = 'White'
WHERE `ID` = 'AVpfEdjqLJeJML431trL'

UPDATE `mens shoes`
SET `Colors` = 'Black' , `Sizes` = '11'
WHERE `ID` = 'AVpe_VEGilAPnD_xSfLp'

UPDATE `mens shoes`
SET `Colors` = 'Brown' , `Sizes` = '9,10,11,12,13'
WHERE `ID` = 'AVpfCDi91cnluZ0-cabr'

UPDATE `mens shoes` 
SET `Colors` = 'Plain', `Sizes` = '9,10,11,12,13,14,15,16'
WHERE `ID` = 'AVpfJ71MLJeJML433kJC'

UPDATE `mens shoes`
SET `Colors` = 'White' , `Sizes` = '7-16'
WHERE `ID` = 'AVpfAWDfilAPnD_xS2BC'

UPDATE `mens shoes`
SET `Colors` = 'Green' 
WHERE `ID` = 'AVpfAudVLJeJML430ajT'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpe8iDdilAPnD_xRe8'

UPDATE `mens shoes`
SET `Colors` = 'Unknown' , `Sizes` = 'Unknown'
WHERE `ID` = 'AVpfCGFiLJeJML43056A'

UPDATE `mens shoes`
SET `Colors` = 'Unknown' , `Sizes` = 'Unknown'
WHERE `ID` = 'AVpe8iDdilAPnD_xRe8f'

UPDATE `mens shoes`
SET `Colors` = 'Unknown' , `Sizes` = 'Unknown'
WHERE `ID` = 'AVpe74ozilAPnD_xRQFX'

-- NOW THAT I AM FINISHED WITH UPDATING THE COLORS, I WANT TO FINISH BY UPDATING THE SIZES-- 
 SELECT *
 FROM `mens shoes` 
 WHERE `Sizes` = ''
 
 UPDATE `mens shoes`
 SET `Sizes` = '11'
 WHERE `ID` = 'AVpfFCHeilAPnD_xUeS0'
 
 UPDATE `mens shoes`
 SET `Sizes` = '11'
 WHERE `ID` = 'AVpe_zwx1cnluZ0-bnB4'
 
 DELETE FROM `mens shoes`
 WHERE `ID` = 'AVpfCNdwLJeJML4308gO'
 
 DELETE FROM `mens shoes`
 WHERE `ID` = 'AVpfHssKilAPnD_xVXu5' 
 
 DELETE FROM `mens shoes`
 WHERE `ID` = 'AVpfFSDs1cnluZ0-dhoW'
 
 DELETE FROM `mens shoes`
 WHERE `ID` = 'AVpfIBrDilAPnD_xVevt'
 
DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfG1nE1cnluZ0-eDSf'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfEbElLJeJML431s4V'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfAQ5OLJeJML430P6n' 

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfATG7ilAPnD_xS08v'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfEwpGilAPnD_xUYN3'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfJ8okilAPnD_xWIL6'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfB-8RLJeJML4303Xb'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpe7Bp0ilAPnD_xQ8Sh'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfK5sl1cnluZ0-faEP'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfCR-pilAPnD_xTiKq'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfCR-pilAPnD_xTiKq'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfL9Lb1cnluZ0-fwoy'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpe__nzilAPnD_xSuBD'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpe797DilAPnD_xRR_8'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfDMIKilAPnD_xT1Fn'

UPDATE `mens shoes`
SET `Sizes` = 'XL'
WHERE `ID`= 'AVpfLqlA1cnluZ0-fqc6'

UPDATE `mens shoes`
SET `Sizes` = '12'
WHERE `ID` = 'AVpfCB-uilAPnD_xTckP'

UPDATE `mens shoes`
SET `Sizes` = 'UNKNOWN'
WHERE `ID` = 'AVpe_8W7LJeJML430Ioj'

UPDATE `mens shoes`
SET `Sizes` = '12'
WHERE `ID` = 'AVpfDG4UilAPnD_xTzVA'

UPDATE `mens shoes`
SET `Sizes` = 'Unknown'
WHERE `ID` = 'AVpfChuPilAPnD_xTngc'

UPDATE `mens shoes`
SET `Sizes` = 'Small'
WHERE `ID` = 'AVpfDDOoilAPnD_xTyMQ'

UPDATE `mens shoes`
SET `Sizes` = '12'
WHERE `ID` = 'AVpe8waMLJeJML43y_9V'

UPDATE `mens shoes`
SET `Sizes` = 'Unknown'
WHERE `ID` = 'AVpfI-6OLJeJML433P81'

UPDATE `mens shoes`
SET `Sizes` = '7'
WHERE `ID` = 'AVpe9Yex1cnluZ0-awGi'

UPDATE `mens shoes`
SET `Sizes` = '7'
WHERE `ID` = 'AVpfA-RILJeJML430gFn'

UPDATE `mens shoes`
SET `Sizes` = '10'
WHERE `ID` = 'AVpe_0vS1cnluZ0-bnZO'

DELETE FROM `mens shoes`
WHERE `ID` = 'AVpfCGYJilAPnD_xTeHt'

UPDATE `mens shoes`
SET `Sizes` = '6'
WHERE `ID` = 'AVpfL3WYilAPnD_xWwoo'
-- THERE ARE SHOE SIZES IN THE MENS SHOES TABLE THAT I COULD NOT FIND THE SIZES, SO INSTEAD OF LEAVING THEM BLANK I UPDATED THEM TO UNKNOWN -- 
UPDATE `mens shoes`
SET `Sizes` = 'UNKNOWN'
WHERE `Sizes` = ''

-- I SPOTTED A BLANK BRAND NAME IN THE MENS TABLE, AFTER DOING MORE RESEARCH THE BRAND NAME IS NOT FOUND. INSTEAD OF REMOVING THE FIELD WE ARE GOING TO 
-- NAME THE FIELD UNKNOWN -- 
SELECT *
FROM `mens shoes`
WHERE `Brand names` = ''

UPDATE `mens shoes`
SET `Brand names` = 'UNKNOWN'
WHERE `ID` = 'AVpe_0vS1cnluZ0-bnZO'

- Now we are going to take one last look at both tables to make sure there is nothing else we can clean. - 

-- RECAP, So what we did in this project is ....

