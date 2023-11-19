/* 1. Which are the different genres? */
use AppleStore;

select distinct(prime_genre) from applestore2;

/* 2. Which is the genre with more apps rated? */
select * from applestore2;

select prime_genre, sum(rating_count_tot)
from applestore2
group by prime_genre;
-- Games is the genre with more ratings

/* 3. Which is the genre with more apps? */
select prime_genre, count(id)
from applestore2
group by prime_genre;
-- Games is the genre with more apps

/* 4. Which is the one with less? */
-- Catalogs has only 10 apps

/* 5. Take the 10 apps most rated. */
select track_name, rating_count_tot
from applestore2
order by rating_count_tot desc
limit 10;

/* 6. Take the 10 apps best rated by users. */
select track_name, user_rating
from applestore2
order by user_rating desc
limit 10;

/* 7. Take a look on the data you retrieved in the question 5. Give some insights. */
select *
from applestore2
order by rating_count_tot desc
limit 10;
-- All ot the apps are free, being Games the most popular genre, followed by Social Networking and Music.

/* 8. Take a look on the data you retrieved in the question 6. Give some insights. */
select *
from applestore2
order by user_rating desc
limit 10;
-- All of the apps are also free, but the rating count is very low. It seems that the more ratings you have, the harder it is to maintain a 5-star rating.
-- Games is the most popular genre.

/* 9. Now compare the data from questions 5 and 6. What do you see? */
-- There are no apps in common between questions 5 and 6. As stated in the previous question, it seems that the more ratings you have, the harder it is to maintain a 5-star rating.

/* 10. How could you take the top 3 regarding the user ratings but also the number of votes? */
select track_name, user_rating, rating_count_tot
from applestore2
order by user_rating desc
limit 3;

/* 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion? */
select round(avg(user_rating), 2) as avg_rating
from applestore2
where price = 0;

select round(avg(user_rating), 2) as avg_rating
from applestore2
where price != 0;

-- Free apps have an average user_rating of 3.38 vs 3.73 for the paid apps. The paid apps have a higher user rating on average than the free ones. 

select prime_genre, round(sum(rating_count_tot), 2) as n_ratings
from applestore2
where price = 0
group by prime_genre;

select prime_genre, round(sum(rating_count_tot), 2) as n_ratings, round(avg(price),2)
from applestore2
where price != 0
group by prime_genre;

-- Games is the most popular category for both free and paid apps. For paid apps, people pay on average 3.31 USD per app.