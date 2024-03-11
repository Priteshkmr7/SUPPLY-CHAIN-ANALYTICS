
select * from sales;
select s.saledate, s.amount,p.salesperson,s.SPID,p.spid
from sales s
join people p on p.SPID=s.SPID;

#left join sale and  product table
select s.saledate,s.amount,pr.Product from sales s
left join products pr on pr.pid=s.pid;

#join multiple table
select s.saledate, s.amount,p.salesperson,pr.product,p.team
from sales s
join people p on p.SPID=s.SPID
join products pr on pr.pid=s.pid;

#condition
select s.saledate, s.amount,p.salesperson,pr.product,p.team
from sales s
join people p on p.SPID=s.SPID
join products pr on pr.pid=s.pid
where s.amount<500 and p.Team='Delish';

select s.saledate, s.amount,p.salesperson,pr.product,p.team
from sales s
join people p on p.SPID=s.SPID
join products pr on pr.pid=s.pid
where s.amount<500 and p.Team='';

select s.saledate, s.amount,p.salesperson,pr.product,p.team,g.Geo
from sales s
join people p on p.SPID=s.SPID
join products pr on pr.pid=s.pid
join geo g on g.GeoID=s.GeoID
where s.amount<500 and p.Team=''
and g.Geo in ('New Zealand', 'India')
order by saleDate;

#use groupby-pivot reports
select geoID,sum(amount), avg(amount), sum(boxes)
from sales
group by geoID;

select g.Geo,sum(amount), avg(amount), sum(boxes)
from sales s
join geo g on s.geoID=g.geoID
group by g.Geo;

select pr.category,p.team,sum(boxes), sum(amount) from sales s 
join people p on p.spid=s.spid
join products pr on pr.pid=s.pid
group by pr.category, p.team;

select pr.category,p.team,sum(boxes), sum(amount) from sales s 
join people p on p.spid=s.spid
join products pr on pr.pid=s.pid
where p.team <> ''
group by pr.category, p.team
order by pr.category, p.team; 

select pr.Product, sum(s.amount)as 'Total Amount'
from sales s
join products  pr on pr.pid=s.pid
group by pr.Product
order by 'Total Amount' desc limit 10;




