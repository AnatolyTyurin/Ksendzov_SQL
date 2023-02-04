create table phones_apple(
 id serial primary key,
 model varchar(40),
 ram int not null,
 front_camera int,
 price int
);

insert into phones_apple(model, ram, front_camera, price)
values ('X', 4, 8, 400),
    ('11', 6, 10, 700),
    ('12', 8, 12, 1000),
    ('7', 4, 12, 400),
    ('XR', 6, 12, 800),
    ('XS', 6, 12, 1000),
    ('13', 6, 12, 1500),
    ('8', 4, 10, 700),
    ('SE2020', 6, 8, 700),
    ('X65', 6, 10, 350),
    ('X75', 8, 10, 450),
    ('X85', 4, 16, 550),
    ('X95', 12, 10, 650),
    ('X105', 8, 12, 760),
    ('X115', 6, 10, 820)
 ;
 
create table phones_samsung(
 id serial primary key,
 model varchar(40),
 ram int not null,
 front_camera int,
 price int
);

insert into phones_samsung(model, ram, front_camera, price)
values ('A50', 6, 10, 300),
    ('A50', 8, 10, 400),
    ('A52', 8, 16, 500),
    ('S20', 8, 24, 1500),
    ('S21', 8, 12, 1000),
    ('S22', 6, 12, 1200),
    ('A71', 6, 12, 1200),
    ('A91', 4, 12, 1900),
    ('A57', 8, 8, 900),
    ('A32', 8, 4, 800),
    ('A33', 8, 5, 750),
    ('A43', 8, 5, 850),
    ('A65', 6, 10, 350),
    ('A75', 8, 10, 450),
    ('A85', 4, 16, 550),
    ('A95', 12, 10, 650),
    ('A105', 8, 12, 760),
    ('A115', 6, 10, 820)
 ;

select price from phones_apple;

select avg(price) from phones_apple;

select min(price) from phones_apple;

select max(price) from phones_apple;

select * from phones_apple
where price > (select avg(price) from phones_apple)
order by price;

select * from phones_apple
where price in (select price from phones_samsung)
order by price;

select price from phones_apple where price < 1000;

select * from phones_samsung
where price > all(select price from phones_apple where price < 1000)
order by price; 

select * from phones_samsung
where price < all(select price from phones_apple where price < 1000)
order by price;

select * from phones_samsung
where price <> all(select price from phones_apple where price < 1000)
order by price;

select * from phones_samsung
where price > any (select price from phones_apple where price < 1000)
order by price;

select * from phones_samsung
where price <> all (select price from phones_apple where price < 1000)
order by price;


select ram, front_camera from phones_samsung
union all
select ram, front_camera from phones_apple
order by ram, front_camera;

select ram, count(*)
from phones_samsung
group by (ram)




