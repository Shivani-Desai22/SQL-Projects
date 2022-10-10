SELECT count(*)
FROM dbo.Orders$

SELECT *
FROM dbo.Orders$
ORDER BY 1

/* Checking if Order Id is primary key or not*/
SELECT [Order ID],count(*)
FROM dbo.Orders$
GROUP By [Order ID]
having count(*) > 1

SELECT *
FROM dbo.Orders$
WHERE [Order ID]='AO-2014-2110'
/* Which shows it is not Primary Key*/

/* Now checkig for composite Primary Key such as Row ID + Order ID*/
SELECT [Row ID],[Order ID], count(*)
FROM dbo.Orders$
GROUP By [Row ID],[Order ID]
having count(*) > 1

/* Checkimg Order Date < Ship Date because product always get shipped after order has been places*/
SELECT *
FROM dbo.Orders$
WHERE [Ship Date]<[Order Date]

/* Checking for different ship modes and their time range in days*/
SELECT DISTINCT  [Ship Mode] 
FROM dbo.Orders$

/* AS Time Range not given, we will get it through querying*/
SELECT DATEDIFF(DAY,[Order Date],[Ship Date]) AS NumOfDays,*
FROM dbo.Orders$
WHERE [Ship Mode]='Second Class'

/* Let's check min and max days for second class shipmode*/
SELECT min(a.NumofDays),max(a.NumofDays)
FROM(
SELECT DATEDIFF(DAY,[Order Date],[Ship Date]) AS NumOfDays,*
FROM dbo.Orders$
WHERE [Ship Mode]='Second Class') a

/* Let's check for another shipmode */
SELECT min(b.NumofDays),max(b.NumofDays)
FROM(
SELECT DATEDIFF(DAY,[Order Date],[Ship Date]) AS NumOfDays,*
FROM dbo.Orders$
WHERE [Ship Mode]='Standard Class') b

/* Checking if customers is bale to order multiple times or not*/
SELECT [Customer ID],[Order ID],count(*)
FROM dbo.Orders$
GROUP BY [Customer ID],[Order ID]
ORDER By [Customer ID]

SELECT *
FROM dbo.Orders$
WHERE [Order ID]='CA-2011-138100'