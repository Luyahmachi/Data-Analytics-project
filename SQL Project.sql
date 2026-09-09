/*Create a database named SalesDB*/
create database sales_db;

/* switch to the database*/
use sales_db;

/*create customer relation*/
create table customers (
customer_id varchar(50) primary key,
customer_name varchar(50),
);
/*Populating  the customer relation*/
insert into customers values

('CG-12520',	'Claire Gute'),
('WG-45983',	'Henry Stalin'),
('DV-13045', 'Darrin Van Huff'),
('SO-20335',	'Sean ODonnell'),
('BH-11710',	'Brosina Hoffman'),
('AA-10480',	'Andrew Allen'),
('IM-15070',	'Irene Maddox'),
('HP-14815',	'Harold Pawlan'),
('PK-19075',	'Pete Kriz'),
('AG-10270',	'Alejandro Grove'),
('ZD-21925',	'Zuschuss Donatelli'),
('KB-16585',	'Ken Black'),
('SF-20065',	'Sandra Flanagan'),
('EB-13870',	'Emily Burns'),
('RV-8346',	'Matt Damon');



/* create order relation*/
create table orders ( 
order_id varchar(20) primary key,
order_date date
);
insert into orders values
('CA-2016-152156', '2016-11-08'),
('CA-2016-114412', '2016-04-15'),
('US-2015-108966', '2019-11-01'),
('CA-2014-115812', '2018-08-27'),
('CA-2016-138688',	'2016-06-12'),
('CA-2016-161389','2016-12-05'),
('US-2015-118983','2018-11-22'),
('CA-2014-105893','2018-11-11'),
('CA-2014-167164','2018-05-13'),
('CA-2014-143336','2018-08-27'),
('CA-2014-143452','2019-02-20'),
('CA-2016-137330','2018-12-09'),
('US-2016-137330','2016-12-20'),
('US-2016-156909','2018-07-16'),
('CA-2015-106320','2019-04-25');



/*create products relation */
create table products (
product_id varchar(15) primary key,
product_category varchar(20),
product_sub_category varchar(20),
product_name varchar(100)
);
/*Populating products relation */
insert into products values (
('FUR-BO-10001798','Furniture','Bookcases','Bush Somerset Collection Bookcase'),
('FUR-CH-10000454','Furniture','Chairs','Hon Deluxe Fabric Upholstered Stacking Chairs, Rounded Back'),
('OFF-LA-10000240','Office Supplies','Labels','Self-Adhesive Address Labels for Typewriters by Universal'),
('FUR-TA-10000577','Furniture','Tables','Bretford CR4500 Series Slim Rectangular Table'),
('FUR-FU-10001487',	'Furniture','Furnishings','Eldon Expressions Wood and Plastic Desk Accessories, Cherry Wood'),
('TEC-PH-10002275','Technology','Phones','Mitel 5320 IP Phone VoIP phone'),
('OFF-BI-10002215','Office Supplies','Binders','Wilson Jones Hanging View Binder, White, 1"'),
('OFF-AP-10001492','Office Supplies','Appliances','Acco Six-Outlet Power Strip, 4" Cord Length'),
('FUR-CH-10002774','Furniture','Chairs','Global Deluxe Stacking Chair, Gray'),
('TEC-AC-10003027','Technology','Accessories','Imation 8GB Mini TravelDrive USB 2.0 Flash Drive'),
('FUR-BO-10004834','Furniture','Bookcases','Riverside Palais Royal Lawyers Bookcase, Royale Cherry Finish'),
('FUR-FU-10004848','Furniture','Furnishings','Howard Miller 13-3/4" Diameter Brushed Chrome Round Wall Clock'),
('OFF-EN-10001509','Office Supplies','Envelopes','Poly String Tie Envelopes'),
('OFF-AR-10004042','Office Supplies','Art','BOSTON Model 1800 Electric Pencil Sharpeners, Putty/Woodgrain');


/*create regions relation */
create table regions (
place_id int primary key,
city varchar(20),
state varchar(20)
);
/*Populating the regions relation*/
insert into regions values (
'1','Henderson','Kentucky'),
('2','Los Angeles','California'),
('3','Los Angeles','California'),
('4','Concord','North Carolina'),
('5','Seattle','Washington'),
('6','Fort Worth','Texas'),
('7','Madison','Wisconsin'),
('8','West Jordan','Utah'),
('9','San Francisco','California'),
('10','Fremont','Nebraska'),
('11','Fremont','Nebraska'),
('12','Philadelphia','Pennsylvania'),
('13','Orem','Utah'),
('14','Los Angeles','California'),
('15','Philadelphia','Pennsylvania');


/*create the sales relation */
create table sales (
order_id varchar(20),
customer_id varchar(10) foreign key references customers(customer_id),
place_id int foreign key references regions(place_id),
product_id varchar(15) foreign key references products (product_id),
sales_id int,
sales int,
quantity int,
discount decimal(10,2),
cost int,
foreign key(order_id) references orders(order_id)
);

/*Populating the sales relation */
insert into sales values 
('CA-2016-152156','CG-12520',1,'FUR-BO-10001798',1,1222610,200,0.00,120000),
('CA-2016-138688','WG-45983',2,'FUR-CH-10000454',2,1731000,389,0,170000),
('US-2015-108966','DV-13045',3,'OFF-LA-10000240',3,986520,422,0,92000),
('CA-2014-115812','SO-20335',4,'FUR-TA-10000577',4,957000,501,0.45,90000),
('CA-2016-114412','BH-11710',5,'FUR-FU-10001487',5,2236820,290,0.20,215000),
('CA-2016-161389','AA-10480',6,'TEC-PH-10002275',6,4886000,720,0,485000),
('US-2015-118983','IM-15070',7,'OFF-BI-10002215',7,7282020,450,0,728202),
('CA-2014-105893','HP-14815',8,'OFF-AP-10001492',8,9071520,650,0.20,890000),
('CA-2014-167164','PK-19075',9,'FUR-CH-10002774',9,1805040,320,0.20,170000),
('CA-2014-143336','AG-10270',10,'FUR-TA-10000577',10,1149000,560,0,108900),
('CA-2014-143452','ZD-21925',11,'TEC-AC-10003027',11,1706840,900,0.20,150000),
('CA-2016-137330','KB-16585',12 ,'FUR-BO-10004834',12,9114240,410,0.20,908500),
('US-2016-137330','SF-20065',13,'FUR-FU-10004848',13,1555200,305,0.20,140000),
('US-2016-156909','EB-13870',14,'OFF-EN-10001509',14,4079760,310,0.20,400976),
('CA-2015-106320','RV-8346',15,'OFF-AR-10004042',15,6881000,540,0.50,680100);


select * from customers;
select * from products;
select * from regions;
select * from orders;
select * from sales;

drop table customers;
drop table products;
drop table regions;
drop table orders;
drop table sales;