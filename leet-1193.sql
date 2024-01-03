--1193 Approved transactions 
#joincondition 
Select a.month, a.country, a.trans_count, b.approved_count, trans_total_amount, approved_total_amount 
From 
(select date_format(trans_date,’%Y-%m’) as month, Country, count(Country) as trans_count, sum(amount)as trans_total_amount from Transaction group by (month, Country) as a 
Left join (select country, state, count(country) as approved_count, sum(amount) as approved_total_amount, trans_date from Transaction where state =‘approved’) as b On a.country =b.country