-- QUESTION SET 1 EASY


--Q1: Who is the senior most employee based on job title??
 select * from employee

select last_name,first_name,levels
from employee
order by
levels desc
--Ans: The person having highest level will be the senior-most


--Q2: Which country has the most invoices?
select * from invoice

select billing_country,count(billing_country) as Bills
from invoice
group by
billing_country
order by Bills desc

--Q3: What are top 3 values of total invoice?
select * from invoice

select top 3 total from invoice
order by total desc

--Q4: Which city has the best customers? Write a query that returns one city that has 
--    the highest sum of invoice totals.Return both city name and sum of all invoice totals.

select * from invoice

select top 1 billing_city,sum(total) as Total_Invoice
from invoice
group by billing_city
order by Total_Invoice desc

--Q5: Who is the best customer? The customer that has spent the
--    most money will be declared as the best customer. Write a query 
--    that returns the person who has spent the most money.

select top 1 customer.customer_id,sum(invoice.total) as Total_invoice,customer.first_name,customer.last_name
from customer join invoice on customer.customer_id=invoice.customer_id
group by customer.customer_id, customer.first_name,customer.last_name
order by Total_invoice desc

