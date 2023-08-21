--Q1: Who is the senior most employee based on job title?

SELECT * FROM employee
order by levels desc
limit 1;


--Q2: Which countries have the most invoices?

select count(*) as C, billing_country
from invoice
group by billing_country
order by C desc;


--Q3: What are top 3 values of total invoice?

select total from invoice
order by total desc
limit 3;


--Q4: Which city has the best customers? We would like to throw a promotional music festival in the city we made the 
--    most money. Write a query that returns one city that has the highest sum of invoice totals. Return both the city
--    name & sum of all invoice total.

select sum(total) as invoice_total, billing_city from invoice
group by billing_city
order by invoice_total desc;


--Q5: Who is the best customer? The customer who has spent the most money will bedeclared the best customer.
--    Write a query that returns the person who has spent the most money.

select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as total
from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total desc
limit 1;


--Q6: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
--    Return your list ordered alphabetically by email starting with A.

SELECT DISTINCT email, first_name, last_name from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in
      (select track_id from track
	   join genre on track.genre_id = genre.genre_id
	   where genre.name like 'Rock')
order by email;


--Q7: Let's invite the artist who have written the most rock music in our datset. Write a query that
--    returns the Artist name and total track count of the top 10 rock bands.

SELECT artist.artist_id, artist.name, COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;


--Q8: Return all the track names that have a song length longer than the average song length.
--    Return the name and milliseconds for each track. Order by the song length will the longest
--    songs listed first.

SELECT name, milliseconds
FROM track
WHERE milliseconds > (
      SELECT AVG(milliseconds) AS avg_track_length
      FROM track)
ORDER BY milliseconds DESC;






