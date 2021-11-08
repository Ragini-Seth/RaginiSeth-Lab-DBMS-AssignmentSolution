CREATE PROCEDURE `categorize_suppliers` ()
BEGIN
	select s.supp_id, s.supp_name, r.rat_ratstars, 
    case
		when r.rat_ratstars > 4 then 'Genuine Supplier'
        when r.rat_ratstars > 2 then 'Average Supplier'
        else 'Supplier should not be considered'
	end as verdict
    from supplier as s, rating as r
    where s.supp_id = r.supp_id;
END
