SQL Exercise - 4/4/2017


----------

#Basic
- 1: Revising the Select Query I

```sql

Select * from City 
where COUNTRYCODE = "USA" AND POPULATION > 100000;

```

- 2: Revising the Select Query II

```sql

Select name from City 
where POPULATION > 120000 AND COUNTRYCODE = "USA";

```

- 3: Select All

```sql

Select * from city;

```

- 4: Select By ID

```sql

select * from city
where ID = 1661

```

- 5:  Japanese Cities' Attributes

```sql

Select name from City 
where COUNTRYCODE = "JPN";

```

#Advanced Select

- 1: Type of Triangle

```sql

select
case
    when (a + b) <= c or (b+c) <= a or (a+c) <= b then "Not A         triangle"
    when a = b and b = c  then "Equilateral"
    when a = b or b = c or a = c  then "Isosceles"
    else "Scalene"
end
from triangles;

```

- 2: The PADS

```sql

select concat(name, '(',left(occupation,1),')') from occupations order by name;
select concat("There are total ",count(occupation)," ", lower(occupation), "s.") from occupations group by occupation order by count(occupation) asc;

```

- 3: Binary Tree Nodes

```sql

select case
	when p is null then concat(n, ' Root')
	when n n (select distinct p from bst) then concat(n, ' Inner')
	else concat(n, ' Leaf')
	end
from bst
order by n ásc

```



#Aggregation


- 1:  Revising Aggregations - The Count Function

```sql

select count(*) from city 
where Population > 100000

```


- 2:  Revising Aggregations - The Sum Function

```sql

select sum(population) from city 
where district = "California" 

```


- 3:  Revising Aggregations - Averages 

```sql

select avg(population) from city 
where district = "California"

```


- 4:  Average Population

```sql

select round(avg(population)) from city

```


- 5:  Japan Population

```sql

select sum(population) from city 
where countrycode = "JPN" 

```

#Basic Join 

- 1: Asian Population

```sql

select sum(ct.population) from city as ct 
inner join country as c
on ct.countrycode = c.code
where c.continent = 'Asia'

```

- 2: African Cities

```sql

select ct.name from city as ct 
inner join country as c
on ct.countrycode = c.code
where c.continent = 'Africa'


```


- 3: Average Population of Each Continent

```sql

select c.continent,round(avg(ct.population)) from city as ct 
inner join country as c
on ct.countrycode = c.code
group by c.continent;

```


- 4: The Report


```sql

select 
case 
    when grade < 8 then null
    else name
end
, grade, marks
from students
inner join grades
on marks between min_mark and max_mark
order by grade desc, name

```

#Advanced Join

- 1: Placements

```sql

select s.name
from students s 
left join friends f on s.id=f.id 
left join packages pf on f.friend_id = pf.id 
left join packages ps on s.id = ps.id 
where pf.salary > ps.salary 
order by pf.salary;

```


#Alternative Queries Challenges

- 1: Draw The Triangle 1

```sql

declare @n int = 20;
while @n >= 0
begin
    print replicate('* ', @n)
    set @n = @n - 1
end

```

- 2: Draw The Triangle 2

```sql

declare @n int = 0;
while @n <= 20
begin
    print replicate('* ', @n)
    set @n = @n + 1
end

```


