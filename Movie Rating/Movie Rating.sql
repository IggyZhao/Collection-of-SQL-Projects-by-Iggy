
drop table if exists M_movie;
drop table if exists M_reviewer;
drop table if exists M_rating;

create table M_movie("mid" int, "title" text, "year" int, "director" text);
create table M_reviewer("rid" int, "name" text);
create table M_rating("rid" int, "mid" int, "stars" int, "ratingdate" date);

insert into M_movie("mid","title","year","director") 
values
(101, 'Gone with the Wind', 1939, 'Victor Fleming'),
(102, 'Star Wars', 1977, 'George Lucas'),
(103, 'The Sound of Music', 1965, 'Robert Wise'),
(104, 'E.T.', 1982, 'Steven Spielberg'),
(105, 'Titanic', 1997, 'James Cameron'),
(106, 'Snow White', 1937, null),
(107, 'Avatar', 2009, 'James Cameron'),
(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');

insert into M_reviewer("rid","name") 
values
(201, 'Sarah Martinez'),
(202, 'Daniel Lewis'),
(203, 'Brittany Harris'),
(204, 'Mike Anderson'),
(205, 'Chris Jackson'),
(206, 'Elizabeth Thomas'),
(207, 'James Cameron'),
(208, 'Ashley White');

insert into M_rating("rid", "mid", "stars", "ratingdate")
values
(201, 101, 2, '2011-01-22'),
(201, 101, 4, '2011-01-27'),
(202, 106, 4, null),
(203, 103, 2, '2011-01-20'),
(203, 108, 4, '2011-01-12'),
(203, 108, 2, '2011-01-30'),
(204, 101, 3, '2011-01-09'),
(205, 103, 3, '2011-01-27'),
(205, 104, 2, '2011-01-22'),
(205, 108, 4, null),
(206, 107, 3, '2011-01-15'),
(206, 106, 5, '2011-01-19'),
(207, 107, 5, '2011-01-20'),
(208, 104, 3, '2011-01-02');

select * from M_movie;
select * from M_reviewer;
select * from M_rating;


-- 1 find the titles of all movies directed by Steven Speilberg 
select distinct title
from M_movie 
where director = 'Steven Spielberg';

-- 2 find all year of rating for movies which received a rating of 4 or 5, and sort them in increasing order. 
select m.year as year_or_movie
from M_movie m join M_rating r using (mid)
where stars in (4,5)
order by 1;

-- improvement 
select distinct extract(year from ratingdate) as year_of_rating
from M_rating
where stars > 3 
and ratingdate is not null 
order by 1;


-- 3 find the titles of all movies that have no ratings 
select m.title 
from M_movie m left join M_rating r using (mid)
where r.mid is null;


-- 4 Some reviewers didn't provide a date with their rating 
-- Find the names of all reviewers who have rating with a NULL value of the date
select a.name
from M_reviewer a join M_rating b using (rid)
where ratingdate is null;

-- atlerantively using subqueries 
select distinct name 
from M_reviewer
where rid in
(select distinct rid from M_rating where ratingdate is null);


-- 5 For all cases where the same reviewer rated the same movie twice [only] and gave it a higher rating the second time
-- return the reviewer's name and the title of the movie

with twice_rating_users as (
    select rid, mid
    from (
        select rid, mid, count(*) as cunt
        from M_rating
        group by 1,2
        having count(*)  = 2
        ) as cte
    )
select r1.rid, r1.mid
from M_rating r1 join M_rating r2
on r1.rid = r2.rid 
and r1.mid = r2.mid 
and r1.stars < r2.stars 
and r1.ratingdate < r2.ratingdate
where (r1.rid, r1.mid) in 
    (select rid, mid from twice_rating_users);
    

-- 6 For each movie that has at least one rating, find the highest number of starts that movie received. 
-- Return the movie title and number of stars. Sort by movie title 

select title, max(stars)
from M_movie m join M_rating r using (mid)
where r.stars is not null 
group by 1 
order by 1;


-- 7 For each movie, return the tile and the 'rating spread', that is, 
-- the difference between highest and lowest ratings given to that movie. 
-- Sort by rating spreaf from highest to lowest, then by movie title.


select title, (max(stars) - min(stars)) as spread
from M_movie m join M_rating r using (mid)
where r.stars is not null 
group by 1 
order by 2 desc, 1;


-- 8 Find the difference between the average rating of movies released before 1980 and the average rating of movies released after 1980
-- Make sure to calculate the rating for each movie, then the average of those movies before 1980 and movies after.
-- Don't just calculate the overall rating before and after 1980. Return single value. 

-- Use CROSS JOIN 
-- Avg each movie before and after 1980
-- Avg Again 

select round((d.avg_rating - f.avg_rating),3) as rate_diff
from    
(
   select avg(c.avgs) as avg_rating
   from 
      (
      select a.mid, avg(a.stars) as avgs
      from M_rating a join M_movie m on a.mid = m.mid 
      where m.year < 1980 
      group by 1
      ) c 
) d, -- coomma here means cross join 
   (select avg(e.avgs) as avg_rating
    from 
      (select a.mid, avg(a.stars) as avgs
      from M_rating a join M_movie m on a.mid = m.mid 
      where m.year > 1980 
      group by 1
      ) e
   ) f; 
