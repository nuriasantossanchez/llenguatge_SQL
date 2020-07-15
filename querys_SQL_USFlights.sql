-- 1.
select count(*)
from flights;

-- 2.
select Origin, avg(ArrDelay) as "prom_arribades", avg(DepDelay) as "prom_sortides"
from flights
where Cancelled=0 and Distance>0
group by Origin;

-- 3.
select Origin, colYear, colMonth, avg(ArrDelay) as "prom_arribades"
from flights
where Cancelled=0 and Distance>0
group by colYear, colMonth, Origin
order by Origin asc, colYear asc, colMonth asc, prom_arribades desc;

-- 4.
select City, colYear, colMonth, avg(ArrDelay) as "prom_arribades"
from flights f inner join usairports u 
on f.Origin=u.IATA
where Cancelled=0 and Distance>0
group by colYear, colMonth, Origin
order by City asc, colYear asc, colMonth asc, prom_arribades desc;

-- 5.
select UniqueCarrier, colYear, colMonth, count(Cancelled) as "total_cancelled"
from flights
where Cancelled=1
group by UniqueCarrier
order by total_cancelled desc;

-- 6. 
select TailNum, sum(Distance) as "totalDistance"
from flights
where Cancelled=0 and Distance>0 and TailNum<>""
group by TailNum
order by totalDistance desc;

-- 7. 
select UniqueCarrier, avg(ArrDelay) as "avgDelay"
from flights
where Cancelled=0 and Distance>0
group by UniqueCarrier
having avg(ArrDelay)>10
order by avgDelay desc;


