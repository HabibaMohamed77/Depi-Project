select* from countries
select* from coustmers
select* from sales
select* from orders
select* from products

create table country_dem(
country_id nvarchar(50) primary key,
c_name nvarchar(50),
c_population int
)

create table customer_dem(
customer_id smallint primary key,
name nvarchar(50),
city nvarchar(100)
)

create table product_dem(
product_id tinyint primary key,
p_name nvarchar(50)
)

create table date_dem(
date_id date primary key,
year int,
month int,
day int
)

create table fact_table(
f_id int identity(1,1) primary key,
countries_id nvarchar(50) references country_dem(country_id),
customers_id smallint references customer_dem(customer_id),
products_id tinyint references product_dem(product_id),
date_id date references date_dem(date_id),
order_id smallint,
sales_id int,
p_weight tinyint,
s_quantity int
)

insert into country_dem(country_id,c_name,c_population)
select distinct Country,Name,Population
from countries

insert into customer_dem(customer_id,name,city)
select CustomerId,Name,City
from coustmers
select * from customer_dem
insert into product_dem(product_id,p_name)
select ProductId,Name
from products

insert into date_dem(date_id,year,month,day)
select distinct date ,YEAR(date),month(Date),day(Date)
from orders

