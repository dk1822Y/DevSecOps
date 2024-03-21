--Question 1

SELECT DISTINCT WAREHOUSE_ADDRESS
FROM WAREHOUSE WH
JOIN INVENTORY I ON WH.WAREHOUSE_ID = I.WAREHOUSE_ID
WHERE I.INVEN_AMOUNT >= 200;

--Question 2

SELECT ANIM_NAME, ANIM_BREED_NAME
FROM ANIMAL A 
JOIN ANIMAL_BREED AB ON A.ANIM_BREED_ID = AB.ANIM_BREED_ID
WHERE A.ANIM_HEIGHT_ON_ARRIVAL > (SELECT AVG(ANIM_HEIGHT_ON_ARRIVAL) FROM ANIMAL)
AND AB.ANIM_BREED_ID BETWEEN 1 AND 5;

--Question 3

SELECT ANIM_NAME, ANIM_BREED_NAME, ANIM_LIVING_ENVIRONMENT_TYPE
FROM ANIMAL A
JOIN ANIMAL_BREED AB ON A.ANIM_BREED_ID = AB.ANIM_BREED_ID
JOIN ANIMAL_LIVING_ENVIRONMENT ALE ON A.ANIM_LIVING_ENVIRONMENT_ID = ALE.ANIM_LIVING_ENVIRONMENT_ID
WHERE ANIM_LIVING_ENVIRONMENT_TYPE = 'Desert' 
OR ANIM_LIVING_ENVIRONMENT_TYPE = 'Arctic';

--Question 4

SELECT VOL_FIRST_NAME, VOL_LAST_NAME, VOL_PHONE_NUMBER, VOL_AVAILABILITY
FROM VOLUNTEER, ZOO 
WHERE ZOO.ZOO_NAME = 'Minnesota Zoo';

--Question 5 Poorly worded 

SELECT ANIM_NAME, ANIM_BREED_NAME, ANIM_CHECKUP_DATE, ANIM_DIETARY_REQUIREMENTS, ANIM_LIVING_ENVIRONMENT_TYPE
FROM ANIMAL A
JOIN ANIMAL_BREED AB ON A.ANIM_BREED_ID = AB.ANIM_BREED_ID
JOIN ANIMAL_CHECKUP AC ON A.ANIM_ID = AC.ANIM_ID
JOIN ANIMAL_LIVING_ENVIRONMENT ALE ON A.ANIM_LIVING_ENVIRONMENT_ID = ALE.ANIM_LIVING_ENVIRONMENT_ID
JOIN ANIMAL_DIETARY_REQUIREMENTS ADR ON A.ANIM_ID = ADR.ANIM_ID
WHERE AC.ANIM_CHECKUP_WEIGHT = 110;

--Question 6

SELECT P.PRODUCT_ID, P.PRODUCT_NAME
FROM PRODUCT P
JOIN RECEIPT_LINE RL ON P.PRODUCT_ID = RL.PRODUCT_ID
WHERE RL.SELLING_PRICE BETWEEN 10 AND 20;

--Question 7

SELECT DISTINCT VET_HOSPITAL
FROM VET
ORDER BY VET_HOSPITAL;

--Question 8 

SELECT EMP_ID, EMP_FIRST_NAME, EMP_LAST_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D
ON E.DEPT_ID = D.DEPT_ID
WHERE D.DEPT_NAME IN ('Birds','Information Systems', 'Development');

--Question 9

SELECT DISTINCT ANIM_NAME
FROM ANIMAL A
JOIN ANIMAL_BREED AB ON A.ANIM_BREED_ID = AB.ANIM_BREED_ID
WHERE AB.ANIM_BREED_NAME LIKE '%Bear%'
ORDER BY ANIM_NAME;

--Question 10

SELECT PRODUCT_NAME, PRODUCT_TYPE
FROM PRODUCT P
JOIN INVENTORY I ON P.PRODUCT_ID = I.PRODUCT_ID
JOIN WAREHOUSE WH ON I.WAREHOUSE_ID = WH.WAREHOUSE_ID
WHERE WH.WAREHOUSE_ID = 2
ORDER BY PRODUCT_NAME DESC;

--Question 11

SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_SUGGESTED_PRICE
FROM PRODUCT
WHERE PRODUCT_SUGGESTED_PRICE < (SELECT AVG(PRODUCT_SUGGESTED_PRICE) FROM PRODUCT);

--Question 12

SELECT RECEIPT_LINE_ID, SELLING_PRICE, QUANTITY
FROM RECEIPT_LINE
WHERE QUANTITY = (SELECT MAX(QUANTITY) FROM RECEIPT_LINE);

--Question 13

SELECT RES_BONUS
FROM RESEARCHER
WHERE RES_BONUS = (SELECT MIN(RES_BONUS) FROM RESEARCHER);

--Question 14

SELECT COUNT(*)
FROM ANIMAL_CHECKUP AC
WHERE AC.ANIM_CHECKUP_DATE LIKE '%10';

--Question 15

SELECT ANIM_GENDER, COUNT(*) AS GENDER_COUNT
FROM ANIMAL
GROUP BY ANIM_GENDER;

--Question 16

SELECT P.PRODUCT_ID, SUM(I.INVEN_AMOUNT)
FROM PRODUCT P
JOIN INVENTORY I ON P.PRODUCT_ID = I.PRODUCT_ID
GROUP BY P.PRODUCT_ID;

--Question 17 ?? Poorly Worded

SELECT PRODUCT_ID, SUM(INVEN_AMOUNT), SUM(INVEN_MAX_STOCK), SUM(INVEN_REORDER_POINT)
FROM INVENTORY
WHERE INVEN_AMOUNT > 900
GROUP BY PRODUCT_ID;

--Question 18??

SELECT FI.FOOD_ITEM_ID, SUM(FIS.FOOD_PRICE)
FROM FOOD_ITEM FI
JOIN FOOD_ITEM_SUPPLIER FIS ON FI.FOOD_ITEM_ID = FIS.FOOD_ITEM_ID
GROUP BY FI.FOOD_ITEM_ID;
WHERE SUM(FIS.FOOD_PRICE) < (SELECT AVG(FOOD_PRICE) FROM FOOD_ITEM_SUPPLIER);

--Question 19

SELECT P.PAY_ID, P.PAY_AMOUNT, P.PAY_CHECK_NUMBER
FROM PAYMENT P
JOIN PRIVATE_EVENT_PAYMENT PEP ON P.PAY_ID = PEP.PAY_ID;

--Question 20

SELECT ANIM_NAME, ANIM_GENDER, PRES_DOSAGE, PRES_DATE_TAKEN
FROM ANIMAL A 
FULL JOIN PRESCRIPTION P ON A.ANIM_ID = P.ANIM_ID
WHERE A.ANIM_GENDER = 'F'
AND A.ANIM_NAME LIKE 'A%';

--Question 21 

SELECT DEPT_NAME, EMP_FIRST_NAME, EMP_LAST_NAME
FROM DEPARTMENT D
FULL JOIN EMPLOYEE E ON D.DEPT_ID = E.DEPT_ID
JOIN CUSTOMER_SERVICES CS ON E.EMP_ID = CS.EMP_ID
ORDER BY DEPT_NAME, EMP_LAST_NAME;

--Question 22

SELECT EMP_FIRST_NAME, EMP_LAST_NAME
FROM EMPLOYEE
WHERE EMP_CITY = 'Mankato';

--Question 23

SELECT PAY_ID, PAY_TYPE, PAY_AMOUNT
FROM PAYMENT 
WHERE PAY_AMOUNT < 100;

--Question 24

SELECT EMP_ID, EMP_FIRST_NAME, EMP_LAST_NAME, DEPT_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID
WHERE EMP_HIRE_DATE BETWEEN '01-AUG-08' AND '31-OCT-08';

--Question 25 

SELECT STORE_ADDRESS
FROM STORE
WHERE STORE_PHONE_NUMBER LIKE '507%';

--Question 26 

SELECT (WAREHOUSE_CITY || ', ' || WAREHOUSE_STATE || ' ' ||  '- ' || WAREHOUSE_ZIP_CODE)
FROM WAREHOUSE;

--Question 27

SELECT DISTINCT OFFICE_BUILDING
FROM OFFICE;

--Question 28

SELECT *
FROM KEEPER;

