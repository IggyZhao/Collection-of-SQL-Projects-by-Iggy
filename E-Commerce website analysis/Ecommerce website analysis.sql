
CREATE TABLE Ecommerce_customers
    ("customerid" int, "country" varchar(11))
;
    
INSERT INTO Ecommerce_customers
    ("customerid", "country")
VALUES
    (1, 'Germany'),
    (2, 'Mexico'),
    (3, 'Mexico'),
    (4, 'UK'),
    (5, 'Sweden'),
    (6, 'Germany'),
    (7, 'France'),
    (8, 'Spain'),
    (9, 'France'),
    (10, 'Canada'),
    (11, 'UK'),
    (12, 'Argentina'),
    (13, 'Mexico'),
    (14, 'Switzerland'),
    (15, 'Brazil'),
    (16, 'UK'),
    (17, 'Germany'),
    (18, 'France'),
    (19, 'UK'),
    (20, 'Austria')
;



CREATE TABLE Ecommerce_categories
    ("categoryid" int, "categoryname" varchar(14))
;
    
INSERT INTO Ecommerce_categories
    ("categoryid", "categoryname")
VALUES
    (1, 'Beverages'),
    (2, 'Condiments'),
    (3, 'Confections'),
    (4, 'Dairy Products'),
    (5, 'Grains/Cereals'),
    (6, 'Meat/Poultry'),
    (7, 'Produce'),
    (8, 'Seafood')
;



CREATE TABLE Ecommerce_employees
    ("employeeid" int, "birthdate" timestamp)
;
    
INSERT INTO Ecommerce_employees
    ("employeeid", "birthdate")
VALUES
    (1, '1968-12-08'),
    (2, '1952-02-19'),
    (3, '1963-08-30'),
    (4, '1958-09-19'),
    (5, '1955-03-04')
;



CREATE TABLE Ecommerce_orderdetails
    ("orderid" int, "productid" int, "quantity" int)
;
    
INSERT INTO Ecommerce_orderdetails
    ("orderid", "productid", "quantity")
VALUES
    (10248, 11, 12),
    (10248, 42, 10),
    (10248, 72, 5),
    (10249, 14, 9),
    (10249, 51, 40),
    (10250, 41, 10),
    (10250, 51, 35),
    (10250, 65, 15),
    (10251, 22, 6),
    (10251, 57, 15),
    (10251, 65, 20),
    (10252, 20, 40),
    (10252, 33, 25),
    (10252, 60, 40),
    (10253, 31, 20),
    (10253, 39, 42),
    (10253, 49, 40),
    (10254, 24, 15),
    (10254, 55, 21),
    (10254, 74, 21),
    (10255, 2, 20),
    (10255, 16, 35),
    (10255, 36, 25),
    (10255, 59, 30),
    (10256, 53, 15),
    (10256, 77, 12),
    (10257, 27, 25),
    (10257, 39, 6),
    (10257, 77, 15),
    (10258, 2, 50),
    (10258, 5, 65),
    (10258, 32, 6),
    (10259, 21, 10),
    (10259, 37, 1),
    (10260, 41, 16),
    (10260, 57, 50),
    (10260, 62, 15),
    (10260, 70, 21),
    (10261, 21, 20),
    (10261, 35, 20),
    (10262, 5, 12),
    (10262, 7, 15),
    (10262, 56, 2),
    (10263, 16, 60),
    (10263, 24, 28),
    (10263, 30, 60),
    (10263, 74, 36),
    (10264, 2, 35),
    (10264, 41, 25),
    (10265, 17, 30),
    (10265, 70, 20),
    (10266, 12, 12),
    (10267, 40, 50),
    (10267, 59, 70),
    (10267, 76, 15),
    (10268, 29, 10),
    (10268, 72, 4),
    (10269, 33, 60),
    (10269, 72, 20),
    (10270, 36, 30),
    (10270, 43, 25),
    (10271, 33, 24),
    (10272, 20, 6),
    (10272, 31, 40),
    (10272, 72, 24),
    (10273, 10, 24),
    (10273, 31, 15),
    (10273, 33, 20),
    (10273, 40, 60),
    (10273, 76, 33),
    (10274, 71, 20),
    (10274, 72, 7),
    (10275, 24, 12),
    (10275, 59, 6),
    (10276, 10, 15),
    (10276, 13, 10),
    (10277, 28, 20),
    (10277, 62, 12),
    (10278, 44, 16),
    (10278, 59, 15),
    (10278, 63, 8),
    (10278, 73, 25),
    (10279, 17, 15),
    (10280, 24, 12),
    (10280, 55, 20),
    (10280, 75, 30),
    (10281, 19, 1),
    (10281, 24, 6),
    (10281, 35, 4),
    (10282, 30, 6),
    (10282, 57, 2),
    (10283, 15, 20),
    (10283, 19, 18),
    (10283, 60, 35),
    (10283, 72, 3),
    (10284, 27, 15),
    (10284, 44, 21),
    (10284, 60, 20),
    (10284, 67, 5)
;



CREATE TABLE Ecommerce_orders
    ("orderid" int, "customerid" int)
;
    
INSERT INTO Ecommerce_orders
    ("orderid", "customerid")
VALUES
    (10248, 90),
    (10249, 81),
    (10250, 34),
    (10251, 84),
    (10252, 76),
    (10253, 34),
    (10254, 14),
    (10255, 68),
    (10256, 88),
    (10257, 35),
    (10258, 20),
    (10259, 13),
    (10260, 55),
    (10261, 61),
    (10262, 65),
    (10263, 20),
    (10264, 24),
    (10265, 7),
    (10266, 87)
;



CREATE TABLE Ecommerce_products
    ("productid" int, "categoryid" int, "price" int)
;
    
INSERT INTO Ecommerce_products
    ("productid", "categoryid", "price")
VALUES
    (1, 1, 18),
    (2, 1, 19),
    (3, 2, 10),
    (4, 2, 22),
    (5, 2, 21.35),
    (6, 2, 25),
    (7, 7, 30),
    (8, 2, 40),
    (9, 6, 97),
    (10, 8, 31),
    (11, 4, 21),
    (12, 4, 38),
    (13, 8, 6),
    (14, 7, 23.25),
    (15, 2, 15.5),
    (16, 3, 17.45),
    (17, 6, 39),
    (18, 8, 62.5),
    (19, 3, 9.2),
    (20, 3, 81),
    (21, 3, 10),
    (22, 5, 21),
    (23, 5, 9),
    (24, 1, 4.5),
    (25, 3, 14),
    (26, 3, 31.23),
    (27, 3, 43.9),
    (28, 7, 45.6),
    (29, 6, 123.79),
    (30, 8, 25.89),
    (31, 4, 12.5),
    (32, 4, 32),
    (33, 4, 2.5),
    (34, 1, 14),
    (35, 1, 18),
    (36, 8, 19),
    (37, 8, 26),
    (38, 1, 263.5),
    (39, 1, 18),
    (40, 8, 18.4),
    (41, 8, 9.65),
    (42, 5, 14),
    (43, 1, 46),
    (44, 2, 19.45),
    (45, 8, 9.5),
    (46, 8, 12),
    (47, 3, 9.5),
    (48, 3, 12.75),
    (49, 3, 20)
;


------------------------------------------------------------------------------------------
-- Insight Finding Script


--#0. View Table
select * from Ecommerce_customers limit 10;
select * from Ecommerce_categories limit 10;
select * from Ecommerce_employees limit 10;
select * from Ecommerce_orderdetails limit 10;
select * from Ecommerce_orders limit 10;
select * from Ecommerce_products limit 10;

--#1. union & union all difference: duplicate values
select customerid
from Ecommerce_customers
union
select customerid
from Ecommerce_orders;


--#2. With Clause: create common expression table

WITH CTE1 AS (
    select customerid,country 
    from Ecommerce_customers
    )
    , CTE2 AS (
    select customerid,orderid
    from Ecommerce_orders
    )
    select CTE1.customerid,orderid,country
    from CTE1 join CTE2 on 
    CTE1.customerid = CTE2.customerid;
    
    

--#3.1. row_number, rank, dense_rank, ntile
-- select a,b from ( select a, b, row_number... from A) as cte where row_num<=2

select categoryid, 
        productid, 
        sales, 
        row_num
from 
(
select categoryid,
       Ecommerce_orderdetails.productid as productid,
       price*quantity as sales,
       row_number() over(partition by categoryid order by price*quantity DESC) as row_num
from Ecommerce_products, Ecommerce_orderdetails
) as cte
where row_num <=2;



--#3.2. rank
select categoryid, 
       productid, 
       sales, 
       row_num
from 
(
select categoryid,
       Ecommerce_orderdetails.productid as productid,
       price*quantity as sales,
       rank() over(partition by categoryid order by price*quantity DESC) as row_num
from Ecommerce_products, Ecommerce_orderdetails
) as cte
where row_num <=2;   


/*  
--#3.3 dense_rank  
select categoryid, 
       productid, 
       sales, 
       row_num
from 
(
select categoryid,
       Ecommerce_orderdetails.productid as productid,
       price*quantity as sales,
       dense_rank() over(partition by categoryid order by price*quantity DESC) as row_num
from Ecommerce_products, Ecommerce_orderdetails
) as cte
where row_num <=2;    */


--#4. ntile

select 
orderid, productid, quantity,
NTILE (5) OVER (
order by quantity desc
) buckets 
from Ecommerce_orderdetails;


--#5. running_total: To find the running total sales quantity for all the orders, rank product quantity in each order 
select orderid, productid, quantity, sum(quantity) over (order by orderid) as running_order_total, 
row_number() over (partition by orderid order by quantity desc) as row_num
from Ecommerce_orderdetails;		



--#6. set restriction to running total: using cte 
select orderid,	productid, quantity, running_order_total, running_order_total
from(select orderid, productid, quantity, sum(quantity) over (order by orderid) as running_order_total
from Ecommerce_orderdetails) as cte
where running_order_total >= 1000;



--#7. labeling: case wehen function
        
select country, 
    case when country in ('Germany') then 'Developed Country'
         when country in ('Mexico') then 'Developing Country'
    else 'other countries' end as country_flag
from Ecommerce_customers;



-- #8. labeling: case wehen function
-- case + aggregation: calculate several metrics at one time join
-- to find for orders, for all products, count total products and how many beverages sales


with cte as(
    select orderid, EO.productid, quantity, categoryid
    from Ecommerce_orderdetails AS EO
    join Ecommerce_products AS EP
    on EO.productid = EP.productid)
    select orderid,
           count(productid) as products,
           sum(case when categoryid =1 and quantity is not null then quantity end) as Beverages_Sales 
    from cte
    group by 1;
    
    
    
--#9. Total sales(quantity) by country: multiple tables join; sum: (case when + group by);  
-- comments: The records with 0 will be droped if inner join is used
select a.country, 
        sum(case when c.quantity is not null then c.quantity else 0 end) as total_sales
from Ecommerce_customers a
left join Ecommerce_orders b on a.customerid = b.customerid
left join Ecommerce_orderdetails c on b.orderid = c.orderid
group by 1
order by 2 DESC;



--#10. Revenue by country
--country, revenue(p*q)
-- c&o:customerid
-- o&od:orderid
-- od&prod:productid

/*
select a.country,
      sum(d.price*c.quantity) as revenue
from Ecommerce_customers a
left join Ecommerce_orders b on a.customerid = b.customerid
left join Ecommerce_orderdetails c on b.orderid = c.orderid
left join Ecommerce_products d on c.productid = d.productid
group by 1
order by 2 DESC;*/


-- the way to replace null is to use case when: sum(case when a*b is not null then a*b else 0 end) as R
select a.country,
      sum(case when d.price*c.quantity is not null then d.price*c.quantity else 0 end)as revenue
from Ecommerce_customers a
left join Ecommerce_orders b on a.customerid = b.customerid
left join Ecommerce_orderdetails c on b.orderid = c.orderid
left join Ecommerce_products d on c.productid = d.productid
group by 1
order by 2 DESC;


-- #11. Revenue by category in Austria 
-- country, category, revenue(p*q)
-- C & O : Cid
-- O & OD : Oid
-- OD & PROD : proid
-- group by

--Method1:
select a.country, 
    sum(case when d.price*c.quantity is not null then d.price*c.quantity else 0 end) as revenue 
from Ecommerce_customers a
left join Ecommerce_orders b on a.customerid = b.customerid
left join Ecommerce_orderdetails c on b.orderid = c.orderid
left join Ecommerce_products d on c.productid = d.productid
group by 1
order by 2 DESC;

-- Method2:
-- revenue by category in austria 
-- country, category, revnue(p*q)
-- c,p,ordetails
--c&o:customerid
--ord&orderdetails:orderid
--ordertail&products:productid

select a.country, d.categoryid, sum(d.price * c.quantity) as revenue
from Ecommerce_customers a 
join Ecommerce_orders b on a.customerid = b.customerid
join Ecommerce_orderdetails c on b.orderid = c.orderid
join Ecommerce_products d on c.productid = d.productid
group by 1,2
having a.country = 'Austria'
order by 1,2;

-- or

/*
select a.country, d.categoryid, sum(d.price * c.quantity) as revenue
from Ecommerce_customers a 
join Ecommerce_orders b on a.customerid = b.customerid
join Ecommerce_orderdetails c on b.orderid = c.orderid
join Ecommerce_products d on c.productid = d.productid
where a.country = 'Austria'
group by 1,2
order by 1,2;*/


--#12. for each customer, what's the avg spend(total spend/ total order)?

-- customer id, total spend, total order, S/O

-- CUST, ORD, ORDETAIL, PROD

-- custo& or:customerid
-- orders & orderdtails: orderid
-- orderdetails&products:productid

select a.customerid, 
       sum(d.price * c.quantity) as total_spend,
        count(distinct c.orderid) as total_order,
       sum(d.price * c.quantity)/count(distinct c.orderid) as avg_spend
from Ecommerce_customers a
join Ecommerce_orders b on a.customerid = b.customerid
join Ecommerce_orderdetails c on b.orderid = c.orderid
join Ecommerce_products d on c.productid = d.productid
group by 1
order by 1,4;


-- safe_divide better version
select  a.customerid, 
        sum(d.price * c.quantity) as total_spend,
        count(distinct c.orderid) as total_order,
        case when count(distinct c.orderid) > 0 
        then sum(d.price*c.quantity)/count(distinct c.orderid) else null end as avg_spend
from Ecommerce_customers a
join Ecommerce_orders b on a.customerid = b.customerid
join Ecommerce_orderdetails c on b.orderid = c.orderid
join Ecommerce_products d on c.productid = d.productid
group by 1
order by 1,4;


-- #13. top 5 most pop product in each category

-- categoryid, categoryname, productid, quantity (5 for each category)

-- Ecommerce_orderdetails & Ecommerce_products:productid
-- Ecommerce_products & Ecommerce_categories:categoryid
-- limit 5, group by

--#13.1.rank_num
with cte as
(select b.categoryid,
       c.categoryname,
       b.productid,
       sum(a.quantity) as quantity,
       rank() over (partition by b.categoryid order by sum(a.quantity)DESC) as rank_num
from Ecommerce_orderdetails a
join Ecommerce_products b on a.productid = b.productid
join Ecommerce_categories c on b.categoryid = c.categoryid
group by 1,2,3
order by 1,5)
select * from cte
where rank_num <=5;

--#13.2.dense_rank
with cte as
(select b.categoryid,
       c.categoryname,
       b.productid,
       sum(a.quantity) as quantity,
       dense_rank() over (partition by b.categoryid order by sum(a.quantity)DESC) as dense_rank_num
from Ecommerce_orderdetails a
join Ecommerce_products b on a.productid = b.productid
join Ecommerce_categories c on b.categoryid = c.categoryid
group by 1,2,3
order by 1,5)
select * from cte
where dense_rank_num <=5;

--#13.3.row_number
select * from
(select b.categoryid,
       c.categoryname,
       b.productid,
       sum(a.quantity) as quantity,
       row_number() over (partition by b.categoryid order by sum(a.quantity)DESC) as row_num
from Ecommerce_orderdetails a
join Ecommerce_products b on a.productid = b.productid
join Ecommerce_categories c on b.categoryid = c.categoryid
group by 1,2,3
order by 1,5) as cte
where row_num <=5;

--#13.4.bucketile
select b.categoryid,
       c.categoryname,
       b.productid,
       sum(a.quantity) as quantity,
       NTILE(5) over (order by sum(a.quantity)DESC) as buckets
from Ecommerce_orderdetails a
join Ecommerce_products b on a.productid = b.productid
join Ecommerce_categories c on b.categoryid = c.categoryid
group by 1,2,3
order by 5;


--#13: one solution
select * from
(select b.categoryid,
       c.categoryname,
       b.productid,
       sum(a.quantity) as quantity,
       row_number() over (partition by b.categoryid order by sum(a.quantity)DESC) as row_num
from Ecommerce_orderdetails a
join Ecommerce_products b on a.productid = b.productid
join Ecommerce_categories c on b.categoryid = c.categoryid
group by 1,2,3
order by 1,5) as cte
where row_num <=5;

--#13:2nd solution: with cte table 
/*
with cte as
(select a.categoryid, 
 a.productid, 
 sum(b.quantity) as sales,
 row_number() over(partition by categoryid order by sum(b.quantity) desc) as row_num 
from Ecommerce_products a
join Ecommerce_orderdetails b
on a.productid = b.productid
group by 1,2)
select *
from cte
where row_num<=5;*/


--#13. 3rd solution: select *: 
select * from(
select a.categoryid, 
       a.productid, 
       sum(b.quantity) as sales,
       row_number() over(partition by categoryid order by sum(b.quantity) desc) as row_num 
from Ecommerce_products a join Ecommerce_orderdetails b on a.productid = b.productid
group by 1,2) as cte
where row_num<=5;

--#13. 4th solution: step by step: sum, row_num, restriction 
select * 
from(
select categoryid,
       productid,
       sales,
       row_number() over (partition by categoryid order by sales DESC) as row_num
from(
select a.categoryid,
       a.productid,
       sum(b.quantity) as sales
from Ecommerce_products a join Ecommerce_orderdetails b on a.productid = b.productid
group by 1,2) as cte1
)as cte2
where row_num <=5;



--14: each customer quantity on beverage, condiments and others
-- customerid, categoryid, categoryname, quantity
-- cu&or:customerid
-- or&ord:orderid
-- ord&product: productid
-- product&categy:categoryid
--case when

--#14.1
--select customerid, categoryid, categoryname, sum(quantity) as sum_quant

-- building new columns: case when caculation: sum(case when categoryname not in ('A', 'B') then Q else 0 end) 
-- group by ID to give a general picture
-- use join to only exclude records with all 0s
select a.customerid,
       sum(case when e.categoryname =  'Beverages' then c.quantity else 0 end) as Bev_Sales,
       sum(case when e.categoryname =  'Condiments' then c.quantity else 0 end) as Condi_Sales,
       sum(case when e.categoryname not in ('Beverages','Condiments') then c.quantity else 0 end) as Other_Sales
from Ecommerce_customers a 
join Ecommerce_orders b on a.customerid = b.customerid
join Ecommerce_orderdetails c on b.orderid = c.orderid
join Ecommerce_products d on c.productid = d.productid
join Ecommerce_categories e on d.categoryid = e.categoryid
group by 1
order by 1;

--#14.2
-- group by id& name to give specific details 
select a.customerid,
       e.categoryname,
       sum(case when e.categoryname =  'Beverages' then c.quantity else 0 end) as Bev_Sales,
       sum(case when e.categoryname =  'Condiments' then c.quantity else 0 end) as Condi_Sale,
sum(case when e.categoryname not in ('Beverages','Condiments') then c.quantity else 0 end) as Other_Sales
from Ecommerce_customers a 
join Ecommerce_orders b on a.customerid = b.customerid
join Ecommerce_orderdetails c on b.orderid = c.orderid
join Ecommerce_products d on c.productid = d.productid
join Ecommerce_categories e on d.categoryid = e.categoryid
group by 1,2
order by 1;

--#14.3
-- another method: case when categoryname = '' or categoryname = '' but need to know all names in "other" filed
/*
select a.customerid,
       e.categoryname,
       case when e.categoryname =  'Beverages' then sum(c.quantity) else 0 end as Bev_Sales,
       case when e.categoryname =  'Condiments' then sum(c.quantity) else 0 end as Condi_Sale,
       case when e.categoryname =  'Confections' 
              or e.categoryname = 'Dairy Products' 
              or e.categoryname = 'Grains/Cereals'
              or e.categoryname = 'Meat/Poultry'
              or e.categoryname = 'Seafood'
then sum(c.quantity) else 0 end as Other_Sales
from Ecommerce_customers a 
join Ecommerce_orders b on a.customerid = b.customerid
join Ecommerce_orderdetails c on b.orderid = c.orderid
join Ecommerce_products d on c.productid = d.productid
join Ecommerce_categories e on d.categoryid = e.categoryid
group by 1,2
order by 1;*/



--#15.median quantity value of each category and product 

-- categoryid, productid, quantity
-- Ecommerce_orderdetails, Ecommerce_products
WITH CTE AS 
(select b.categoryid as categoryid, 
        b.productid as productid, 
        a.quantity as quantity,
        row_number() over (partition by b.categoryid order by a.quantity ASC) as row_num1,
        row_number() over (partition by b.categoryid order by a.quantity DESC) as row_num2
from Ecommerce_orderdetails a
join Ecommerce_products b
on a.productid = b.productid
group by 1,2,3),
CTE2 AS (
select categoryid, productid, quantity, row_num1, row_num2
from cte
where row_num1 in (row_num2, row_num2-1, row_num2+1))

SELECT categoryid, productid, round(avg(quantity)) as med FROM CTE2
group by 1,2
order by 1;
