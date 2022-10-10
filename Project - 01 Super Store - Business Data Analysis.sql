USE SUPERSTORE;

/* 1. Find the Maximum Quantity Sold in a transaction.*/
SELECT MAX(QUANTITY),COUNT(*)
FROM TR_ORDERDETAILS;

/* 2. Find the unique products in all the transactions.*/
SELECT distinct(PRODUCTID)
FROM TR_ORDERDETAILS;

/* 3. Find the unique Properties.*/
SELECT distinct
PRODUCTID,QUANTITY
FROM TR_ORDERDETAILS
WHERE QUANTITY = 3
ORDER BY PRODUCTID ASC,QUANTITY DESC;

/* 4. Find the Product Category that has maximum Products*/
SELECT 
ProductCategory,
count(*) AS COUNT
FROM tr_products
GROUP BY ProductCategory
ORDER BY 2 DESC;

/* 5. Find the state with maximum no. of store presence */
SELECT 
PropertyState,
count(*) AS COUNT
FROM tr_propertyinfo
GROUP BY PropertyState
ORDER BY 2 DESC;

/*  6. Find the Top 5 Product IDs that did maximum sales in terms of Quantity */
SELECT 
ProductID,
sum(Quantity) as Total_Quantity
FROM tr_Orderdetails
GROUP BY ProductID
ORDER BY 2 DESC
limit 5;

/* 7. Joining 2 tables*/
SELECT 
	O.*,
	P.ProductName,
    P.ProductCategory,
    P.Price
FROM tr_orderdetails AS O
left join tr_products AS P
	on O.ProductID = P.productID;

/*  8. Find Top 5 Product Names that did maximum sales in term of quantity. */
SELECT 
	sum(Quantity) as Total_Quantity,
	P.ProductName
   FROM tr_orderdetails AS O
left join tr_products AS P
	on O.ProductID = P.productID
GROUP By p.ProductName
ORDER BY 1 DESC
LIMIT 5;

/* 9. Find Top 5 prodcuts that did maximum sales*/
SELECT 
	sum(O.Quantity * P.price) as Total_Sales,
	P.ProductName
   FROM tr_orderdetails AS O
left join tr_products AS P
	on O.ProductID = P.productID
GROUP By p.ProductName
ORDER BY 1 DESC
LIMIT 5;

/* Find Top 5 Cities that did maximum Sales    */
SELECT 
	sum(O.Quantity * P.Price) as Sales,
	Pi.PropertyCity
   FROM tr_orderdetails AS O
left join tr_products AS P on O.ProductID = P.productID
left join tr_propertyinfo AS pi on O.propertyID = pi.`Prop ID`
GROUP By pi.PropertyCity
ORDER BY Sales DESC
LIMIT 5;

/* Find the Top 5 products in each of the cities*/
SELECT 
	Pi.PropertyCity,
    p.ProductName,
    sum(O.Quantity * P.Price) as Sales	
   FROM tr_orderdetails AS O
left join tr_products AS P on O.ProductID = P.productID
left join tr_propertyinfo AS pi on O.propertyID = pi.`Prop ID`
where pi.PropertyCity = "Arlington"
GROUP By pi.PropertyCity,p.ProductName
ORDER BY Sales DESC
LIMIT 5;







/* Find the Top 5 products in each of the sates*/

/* Find the top 5 cities */







