--QUESTION SET 3 ADVANCED

--Q1: Find how much amount is spent by each customer on artist which has most selling track. 
--Write a query to return customer name, artist name, total spent.

--Here we use Common Expression Table(CTE)

with Total_money_spent as(
	select top 1 artist.artist_id as artist_id,artist.name, sum(invoice_line.unit_price*invoice_line.quantity) as Total_sale
	from invoice_line
	join track on invoice_line.track_id=track.track_id
	join album on track.album_id=album.album_id
	join artist on album.artist_id=artist.artist_id
	group by artist.artist_id,artist.name
	order by Total_sale desc
)

select customer.first_name,customer.last_name,tms.name as artist_name ,sum(invoice_line.unit_price*invoice_line.quantity) as Total_sale
from customer 
join invoice on customer.customer_id=invoice.customer_id
join invoice_line on invoice.invoice_id=invoice_line.invoice_id
join track on invoice_line.track_id=track.track_id
join album on track.album_id=album.album_id
join Total_money_spent tms on album.artist_id=tms.artist_id
group by customer.first_name,customer.last_name,tms.name
order by Total_sale desc