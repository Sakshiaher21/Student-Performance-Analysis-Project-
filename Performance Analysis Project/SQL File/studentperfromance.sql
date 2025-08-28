Create Database StudentPerformaceDB;
Use StudentPerformacedb;

Create Table Students_performance(
gender nvarchar(10),
race_ethnicity nvarchar(50),
parental_level_of_education nvarchar(50),
lunch nvarchar(20),
test_preparation_course nvarchar(20),
math_score  int,
reading_score int,
writing_score int);

-- total number of students
select count(*) as total_students
from Student_perfromace;

-- avg score i each subject
select 
avg(math_score) as avg_math,
avg(reading_score) as avg_reading,
avg(writing_score) as avg_writing 
from Student_perfromace;

-- average score by gender
select gender,
avg(math_score) as avg_math,
avg(reading_score) as avg_reading,
avg(writing_score) as avg_writing
FROM  student_perfromace
Group By gender;


---Does parental education affets maths score
select parental_level_of_education,
avg(math_score) as avg_math
FROM Student_perfromace
Group by  parental_level_of_education order by avg_math desc;

-- Students who might be at risk (average score<50)
select * from Student_perfromace
where (CAST(math_score as INT) + CAST(writing_score as INT) + Cast(reading_score as INT))/3 < 50;


--- race/ethinity creelaion with scores
SELECT race_ethnicity, avg(math_score)
AS avg_math, avg(reading_score) as avg_read, avg(writing_score) as avg_write ,
from student_perfromace
Group by race_ethnicity
order by avg_math DESC;


-- info by marks
select * from Student_perfromace
where (CAST(math_score as INT) + CAST(writing_score as INT) + Cast(reading_score as INT))/3 > 50;

select * from Student_perfromace
where (CAST(math_score as INT) + CAST(writing_score as INT) + Cast(reading_score as INT))/3 > 70;

select * from Student_perfromace
where (CAST(math_score as INT) + CAST(writing_score as INT) + Cast(reading_score as INT))/3 > 80;

select * from Student_perfromace
where (CAST(math_score as INT) + CAST(writing_score as INT) + Cast(reading_score as INT))/3 > 90;

select * from Student_perfromace
where (CAST(math_score as INT) + CAST(writing_score as INT) + Cast(reading_score as INT))/3 > 95;

-- count students by lunch  type students
select lunch, count(*) 
from Student_perfromace
Group by lunch;

-- score affect by lunch
select lunch, avg(math_score) as avg_math, avg(writing_score) as avg_write, avg(reading_score) as avg_read
 from Student_perfromace
 group by lunch
 order by lunch DESC;

 -- score affect by test preparation
select test_preparation_course, avg(math_score) as avg_math, avg(writing_score) as avg_write, avg(reading_score) as avg_read
 from Student_perfromace
 group by test_preparation_course
 order by test_preparation_course DESC;

 -- effect of test preparation course on perfroemce
     select  test_preparation_course, avg((math_score + writing_score + reading_score/3.0)) as avg_score
	 from Student_perfromace
	 group by test_preparation_course;

 -- score by gender and test preparation
 select test_preparation_course, gender, 
 avg((math_score + writing_score + reading_score/3.0))
 from Student_perfromace
 group by test_preparation_course, gender
 order by test_preparation_course DESC;

 -- Highest Score in each subject
 select max(math_score) as max_math, max(reading_score) as max_reading ,max(writing_score) as max_writing
 from Student_perfromace;

 -- Lowest Score in each subject
 select min(math_score) as max_math, min(reading_score) as max_reading ,min(writing_score) as max_writing
 from Student_perfromace;


 -- info of student who got min marks.
 select * from Student_perfromace
 where math_score=
 (select min(math_score) from Student_perfromace) 
 AND reading_score =(select min(reading_score) from Student_perfromace)
 AND writing_score = (select min(writing_score) from Student_perfromace)
;

-- info of student who got max marks.
select * from Student_perfromace
 where math_score=
 (select max(math_score) from Student_perfromace) 
 AND reading_score =(select max(reading_score) from Student_perfromace)
 AND writing_score = (select max(writing_score) from Student_perfromace)


 -- # info of student who get min mrks but test_preparation_course is'Completed'.
 select * from Student_perfromace
where test_preparation_course= 'Completed'
AND
(math_score=
 (select min(math_score) from Student_perfromace where test_preparation_course= 'Completed' ) 
 OR reading_score =(select min(reading_score) from Student_perfromace where test_preparation_course= 'Completed')
 OR writing_score = (select min(writing_score) from Student_perfromace where test_preparation_course= 'Completed'));

 select *
 from student_perfromace
 where math_score > 90 AND reading_score >90 AND writing_score > 90;


 -- Distribute average scores(gruoped by range).


 select * from Student_perfromace;


