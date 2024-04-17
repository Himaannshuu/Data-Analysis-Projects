--QUESTION SET 2 MODERATE

--Q1: Write query to return the email, first name, last name, genre 
--of all rock music listeners. Return your list ordered alphabetically 
--by email starting with A.

select * from genre

select track.track_id, genre.name
from track join genre on track .genre_id=genre.genre_id
where genre.name = 'rock'
--These are the rock track id's

select distinct customer.email, customer.first_name, customer.last_name
from customer 
join invoice on customer.customer_id=invoice.customer_id 
join invoice_line on invoice.invoice_id= invoice_line.invoice_id
where track_id in(
	select track.track_id
	from track
	join genre on track .genre_id=genre.genre_id
	where genre.name = 'rock'
)
--We use subquery in this


--Q2: Write a query that returns the artist name and total count of top 10 rock bands



select track.track_id, genre.name  
from track                                         --Those tracks which has "Rock" as genre
join genre on track.genre_id=genre.genre_id
where genre.name like 'Rock'

select * from artist
select top 10 artist.name,count(artist.artist_id) as Total_Songs
from artist
join album on artist.artist_id=album.artist_id
join track on album.album_id=track.album_id
where track_id in(
	select track.track_id  
	from track 
	join genre on track.genre_id=genre.genre_id
	where genre.name like 'Rock'
)
group by artist.name
order by Total_Songs desc


--Q3: Return all the track names that have a song length longer 
--than the average song length. Return the names and milliseconds 
--for each track. Order by the song length with the longest songs listed first.

select name, milliseconds
from track
where milliseconds > (
	select avg(milliseconds) as Average_Track from track
)
order by milliseconds desc









