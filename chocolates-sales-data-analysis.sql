select 
from sales;

select * from sales
where Amount >2000 and Boxes <100;

select S.SaleDate, S.amount, p.salesperson
from sales s
join people p on p.SPID = s.SPID;

select p.Salesperson, count(*) as 'Shipment Count'
from sales s
join people p on s.spid = p.spid
where SaleDate between '2022-1-1' and '2022-1-31'
group by p.Salesperson;

select pr.product, sum(boxes) as 'Total Boxes'
from sales s
join products pr on s.pid = pr.pid
where pr.Product in ('Milk Bars', 'Eclairs')
group by pr.product;

select pr.product, sum(boxes) as 'Total Boxes'
from sales s
join products pr on s.pid = pr.pid
where pr.Product in ('Milk Bars','Eclairs') and SaleDate between '2022-2-1' and '2022-2-7'
group by pr.Product;

select year(saledate) 'Year', month(saledate) 'Month', count(*) 'Times we shipped 1k boxes'
from sales
where boxes>1000
group by year(saledate), month(saledate)
order by year(saledate), month(saledate);

select * from sales
where customers < 100 and boxes < 100;

Select distinct p.salesperson from sales s
join people p on p.spid = s.SPID
where s.saleDate between '2022-02-01' and '2022-02-7';

select p.salesperson
from people p
where p.spid not in 
(select distinct s.spid from sales s 
where s.SaleDate 
between '2022-01-01' and '2022-01-07');

select * from sales;


select saleDate, Amount,
				case  when amount < 1000 then 'Under 1k'
					  when amount < 5000 then 'Under 5k'
                      when amount < 10000 then 'Under 10k'
			  else 'Above 10k'
              end as 'Amount category'
from sales;

select s. saleDate, s.amount, p.Salesperson
from sales s
join people p on p.SPID = s.SPID;

select s.saleDate, s.amount, p.salesperson, pr.product, p.team
from sales s
join people p on p.SPID = s.SPID
join products pr on pr.pid = s.pid;

select s.saleDate, s.amount, p.salesperson, pr.product, p.team
from sales s
join people p on p.SPID = s.SPID
join products pr on pr.pid = s.pid
where s.amount <500
and p.team= 'Delish';

select s.saleDate, s.amount, p.salesperson, pr.product, p.team
from sales s
join people p on p.SPID = s.SPID
join products pr on pr.pid = s.pid
join geo g on g.geoid = s.geoid
where s.amount <500
and p.team= 'jucies'
and g.Geo in ('New Zeland','India')
order by saleDate;

select geoID, sum(amount), avg(amount), sum(boxes)
from sales
group by geoID;

select g.geo, sum(amount), avg(amount), sum(boxes)
from sales s
join geo g on s.geoID = g.geoID
group by g.geo;

select pr.category, p.team, sum(boxes), sum(amount)
from sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid
where p.team <> ''
group by pr.category, p.team
order by pr.category, p.team;

select pr.product, sum(s.amount) as 'Total Amount'
from sales s
join products pr on pr.pid = s.pid
group by pr.Product
order by 'Total Amount' desc
limit 10;

