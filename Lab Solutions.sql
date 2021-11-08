-- 3
-- Display the number of the customer group by their genders who have placed any order 
-- of amount greater than or equal to Rs.3000.
Select cus_gender, count(*) from `order`
inner join customer on `order`.CUS_ID = customer.CUS_ID
where ord_amount >= 3000
group by CUS_GENDER;

-- 4
select `order`.*, product.pro_name
from 
	`order`
    inner join product_details on `order`.prod_id = product_details.prod_id
    inner join product on product_details.pro_id = product.pro_id
where cus_id = 2;

-- 5)	Display the Supplier details who can supply more than one product.
-- Approach: This needs a subquery
-- Query 1: Check product_Details table to find the suppliers who supply more than 1 product
-- Query 2: In a WHERE clause to find details of suppliers whose id exists IN the list returned by Query 1.

select supplier.*
from supplier
where supp_id in (
	select supp_id
	from product_details
	group by supp_id
	having count(*) > 1
);

-- 6
-- Find the category of the product whose order amount is minimum.
select o.*, c.*
from
	`order` as o
    inner join product_details as pd on o.prod_id = pd.prod_id
    inner join product as p on pd.pro_id = p.pro_id
    inner join category as c on p.cat_id = c.cat_id
where ord_amount = (
	select min(ord_amount)
	from `order`
);

-- 7
Select p.PRO_NAME, p.pro_id, o.* 
from 
	`order` as o
	inner join product_details as pd on o.prod_id = pd.prod_id
	inner join product as p on pd.pro_id = p.pro_id 
where ord_date > '2021-10-05';

-- 8) Print the top 3 supplier name and id and their rating on the basis of their rating along with the customer name who has given the rating.
Select s.SUPP_NAME, s.SUPP_ID, c.CUS_NAME, r.RAT_RATSTARS
from 
	rating as r
    inner join customer as c on c.CUS_ID = r.CUS_ID
	inner join supplier as s on s.SUPP_ID = r.SUPP_ID
order by RAT_RATSTARS desc limit 3;

-- 9
select *
from customer as c
where c.cus_name like 'A%' or c.cus_name like '%A';

-- 10 Display the total order amount of the male customers
Select sum(Ord_amount) as sum_amt_by_males, c.CUS_GENDER
from 
	`order` as o
    inner join customer as c on c.cus_id = o.CUS_ID
where c.CUS_GENDER = 'M';   

-- 11
-- insert into customer(cus_id, cus_name, cus_phone, cus_city, cus_gender) values(6, 'Pallavi', 1234567890, 'Bangalore', 'F');

select *
from customer left outer join `order` on customer.cus_id = `order`.cus_id;

-- 12
call categorize_suppliers();
