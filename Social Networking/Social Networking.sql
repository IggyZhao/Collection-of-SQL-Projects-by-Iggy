
drop table if exists S_highschooler;
drop table if exists S_friend;  -- two ways 
drop table if exists S_likes;   -- one wan 

create table S_highschooler("id" int, "name" varchar(30), "grade" int);
create table S_friend("id1" int, "id2" int);
create table S_likes("id1" int, "id2" int);

insert into S_highschooler("id","name","grade") 
values 
(1510, 'Jordan', 9),
(1689, 'Gabriel', 9),
(1381, 'Tiffany', 9),
(1709, 'Cassandra', 9),
(1101, 'Haley', 10),
(1782, 'Andrew', 10),
(1468, 'Kris', 10),
(1641, 'Brittany', 10),
(1247, 'Alexis', 11),
(1316, 'Austin', 11),
(1911, 'Gabriel', 11),
(1501, 'Jessica', 11),
(1304, 'Jordan', 12),
(1025, 'John', 12),
(1934, 'Kyle', 12),
(1661, 'Logan', 12);

insert into S_friend("id1","id2") 
values 
(1510, 1381),
(1101, 1501),
(1510, 1689),
(1689, 1709),
(1381, 1247),
(1709, 1247),
(1689, 1782),
(1782, 1468),
(1782, 1316),
(1782, 1304),
(1468, 1101),
(1468, 1641),
(1101, 1641),
(1247, 1911),
(1247, 1501),
(1911, 1501),
(1501, 1934),
(1316, 1934),
(1934, 1304),
(1304, 1661),
(1661, 1025),
(1689, 1709),
(1709, 1689),
(1782, 1709),
(1911, 1247),
(1247, 1468),
(1641, 1468),
(1316, 1304),
(1501, 1934),
(1934, 1501),
(1025, 1101);

insert into S_likes("id1","id2")
values 
(1689, 1709),
(1709, 1689),
(1782, 1709),
(1911, 1247),
(1247, 1468),
(1641, 1468),
(1316, 1304),
(1501, 1934),
(1934, 1501),
(1025, 1101),
(1101, 1381),
(1025, 1641);

select * from S_highschooler;
select * from S_friend;
select * from S_likes;

-- 1 Find the names of all students who are friends with someoen named Gabriel 
    -- find the ID of Gabriel 
    -- go to the friend table, ID can be either ID1 field or ID2 field. write two queries to scan both fields and union distinct IDs
    -- join the highschooler tbale 

with cte as 
(
    select id1 as id 
    from S_friend 
    where id2 in(
        select id 
        from S_highschooler
        where name = 'Gabriel')
    union distinct 
    select id2 as id 
    from S_friend
    where id1 in (
        select id 
        from S_highschooler
        where name = 'Gabriel')
) 
select a.* 
from S_highschooler a join cte on a.id = cte.id;
        
-- 2 For every student who likes someone 2 or more grades younger than thenselves, 
-- return that student's name and grade, and the name and grade of the student they like 
    -- S_highschooler <- S_likes -> S_highschooler
    -- grade difference 

select a.name as like_name, 
       a.grade as like_grade, 
       c.name as liked_name, 
       c.grade as liked_grade
     from S_highschooler a join S_likes b on a.id = b.id1
     join S_highschooler c on b.id2 = c.id 
     where (a.grade - c.grade) >=2;


-- 3 For every pair of students who both like each other, return the name and grade of both students.
-- Include each pair only once, with the two names in alphabetical order. 
    -- since like is one-way, need to find the pairs from likes table, by self join 
    -- each pair only once, by id1<id2
    
select hs1.name as a , hs2.name as b 
from S_highschooler hs1 join 
    (select lk1.* 
     from S_likes lk1 join S_likes lk2 
     on lk1.id2 = lk2.id1 and lk1.id1 = lk2.id2
     where lk1.id1 < lk2.id2 -- each pair only once 
     ) as subq 
     on hs1.id = subq.id1
join S_highschooler hs2 
on subq.id2 = hs2.id 
order by 1,2;

-- better way  
select * from S_likes a 
where (id1, id2) in 
    (select id2 as id1, id1 as id2
     from S_likes
    ) 
and id1<id2;


-- 4 Find all students who do not appear in the likes table (as a studnet who likes or is liked) and return their names and grades 
    -- union id1 and id2
    --join 

select * 
from S_highschooler
where id not in (
    select distinct id1 as my_id
    from S_likes
    union 
    select distinct id2 as my_id
    from S_likes
    );


-- 5 For every situation where student A likes student B, but we have no information about whom B likes 
-- That is, B doesn't appear as an ID1 in the likes table. return A and B's names and grades.
select id1, id2
from S_likes
where id2 not in 
(select distinct id1
 from S_likes);
 
-- alternatively 
select h1.name, cte.*, h2.name 
from S_highschooler h1 
join 
    (select l1.*
     from S_likes l1 left join S_likes l2 on l1.id2 = l2.id1
     where l2.id1 is null)
     as cte
on h1.id = cte.id1
join S_highschooler h2 on cte.id2 = h2.id;


-- 6 Find the name and grade of all students who are liked by more than one other student 
select name, grade
from (
    select id2, count(id2) as numliked
    from S_likes 
    group by 1) a join S_highschooler b on a.id2 = b.id 
where numliked >1;


--7 Find the names and grades of students who only have friends in the same grade. Return the resul sorted by grade. 
    -- find friends in different grades, 
    -- get the opposite = same grade only 
with cte as (
    select f.id1 as id
    from S_highschooler h1 join S_friend f on h1.id = f.id1
    join S_highschooler h2 on f.id2 = h2.id 
    where h1.grade != h2.grade
 union 
    select f.id2 as id
    from S_highschooler h1 join S_friend f on h1.id = f.id1
    join S_highschooler h2 on f.id2 = h2.id 
    where h1.grade != h2.grade
    )
select * 
from S_highschooler
where id not in (select id from cte)
and id in 
    (select distinct id1 as id 
     from S_friend
  union distinct
     select distinct id2 as id 
     from S_friend);
    
