show tables;
desc sales;
select * from sales;
select SaleDate, Amount, Customers from sales;

#Calculation in queries
Select SaleDate, Amount,Boxes, Amount/boxes from sales;
Select SaleDate, Amount,Boxes, Amount/boxes 'Amount per box' from sales;

#Impose Condition
select * from sales where amount>10000;

select * from sales where amount>10000 order by amount; #ascending
select * from sales where amount>10000 order by amount desc; 

select * from sales where GeoID='g1' order by PID, Amount desc; #where filtering order sorting

select * from sales where amount>10000 and SaleDate>='2022-01-01';
select SaleDate, Amount from sales where amount>10000 and year(SaleDate)=2022
order by amount desc;

select * from sales where boxes>0 and boxes <=50 order by boxes;

select * from sales where boxes between 0 and 50;

select saledate, amount, boxes, weekday(SaleDate) as 'Day of Week'
 from sales
 where weekday(SaleDate)=4;
select saledate, amount, boxes,weekday(SaleDate) from  sales where weekday(SaleDate)=4; #Mon=0, tue=1, wed=2, thur=3, fri=4


select * from people;
select * from people where team='Delish' or team='Jucies';

select * from people where team in ('Delsih', 'Jucies');

#Pattern Matching
select * from people where salesperson like 'B%';
select * from people where salesperson like '%B%';

#Case Operator
select * from sales;
select SaleDate, Amount,
	case when amount<1000 then 'Under 1k'
		when amount<5000 then 'Under 5k'
        when amount <10000 then 'Under 10k'
	else'10k or more'
    end as 'Amount category'
from sales;

#Joins

