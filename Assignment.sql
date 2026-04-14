set search_path to nairobi_academy;
select * from students;
alter table subjects
rename column credits  to credit_hours;

--- to drop a column
alter table students
drop column phone_number;

---DML adding rows
-- Inserting into table students
insert into students
(student_id , first_name , last_name , gender , date_of_birth , class , city)
values
(1,'Amina','Wanjiku','F','2008-03-12','Form 3','Nairobi'),
(2,'Brian','Ochieng','M','2007-07-25','Form 4','Mombasa'),
(3,'Cynthia','Mutua','F','2008-11-05','Form 3','Kisumu'),
(4,'David','Kamau','M','2007-02-18','Form 4','Nairobi'),
(5,'Esther','Akinyi','F','2009-06-30','Form 2','Nakuru'),
(6,'Felix','Otieno','M','2009-09-14','Form 2','Eldoret'),
(7,'Grace','Mwangi','F','2008-01-22','Form 3','Nairobi'),
(8,'Hassan','Abdi','M','2007--04-09','Form 4','Mombasa'),
(9,'Ivy','Chebet','F','2009-12-01','Form 2','Nakuru'),
(10,'James','Kariuki','M','2008-08-17','Form 3','Nairobi');


---Inserting into subjects
insert into subjects
(subject_id,subject_name,department,teacher_name,credit_hours)
values
(1,'Mathematics','Sciences','Mr.Njoroge',4),
(2,'English','Languages','MS. Adhiambo',3),
(3,'Biology','Sciences','Ms.Otieno',4),
(4,'History','Humanities','Mr.Waweru',3),
(5,'Kiswahili','Languages','Ms.Nduta',3),
(6,'Physics','Sciences','Mr.Kamande',4),
(7,'Geography','Humanities','Ms.Chebet',3),
(8,'Chemistry','Sciences','Ms.Muthoni',4),
(9,'Computer Studies','Sciences','Mr.Oduya',3),
(10,'Business Studies','Humanities','Ms.Wangari',3);


---Inserting values into exam_results
insert into exam_results
(result_id,student_id,subject_id,marks,exam_date,grade)
values
(1,1,1,78,'2024-03-15','B'),
(2,1,2,85,'2024-03-16','A'),
(3,2,1,92,'2024-03-15','A'),
(4,2,3,55,'2024-03-17','C'),
(5,3,2,49,'2024-03-16','D'),
(6,3,4,71,'2024-03-18','B'),
(7,4,1,88,'2024-03-15','A'),
(8,4,6,63,'2024-03-19','C'),
(9,5,5,39,'2024-03-20','F'),
(10,6,9,95,'2024-03-21','A');

---Selct query to show all the rows of the tables
select * from students;
select * from subjects;
select * from exam_results;

--- Update Esther Akinyi city from Nakuru to Nairobi
update students
set city = 'Nairobi'
where first_name = 'Esther' AND last_name = 'Akinyi';

---update marks for result_id 5
update exam_results
set marks = 59
where result_id = 5;

---Delete from exam_results where result_id 9
delete from exam_results
where result_id = 9;

---Querying the Data (Filtering with WHERE)
--select form 4 students
select * from students
where  class = 'Form 4';

---select subjects in science department
select * from subjects
where  department= 'Sciences';

---marks greater than or equal to 70
select * from exam_results
where marks >= 70;

---find female students only
select * from students
where  gender = 'F';

---find students in form3 and from Nairobi
select * from students
where class = 'Form 3' and city='Nairobi';

---form 2 or form 4
select * from students
where  class = 'Form 4' or class ='Form 2';

---BETWEEN, IN/NOT IN, LIKE, COUNT, and CASE WHEN
select * from exam_results
where marks between 50 and 80;

select * from exam_results
where exam_date between '2024-03-15'  and '2024-03-18';

---using in
select * from students
where city in ('Nairobi','Mombasa','Kisumu');

--not in
select * from students
where class not in ('Form 2','Form 3');

---like
select * from students
where first_name  like 'A%' or first_name like 'E%';

select * from subjects
where subject_name like '%Studies';

---COUNT
select  count (*) 
from students 
where class = 'Form 3';

---70 or above
select count(*)
from exam_results
where marks >= 70;

--case when
select 
result_id,
marks,
case 
	when marks >= 80 then 'Distinction'
	when marks >= 60 then 'Merit'
	when marks >= 40 then 'Pass'
	else 'Fail'
	end as performance
	from exam_results;
end


select 
first_name,
last_name,
class,
case 
	when class ='Form 3' then 'Senior'
	when class ='Form 4' then 'Senior'
	when class = 'Form 2' then 'Junior'
	else 'junior'
	end as student_level
	from students;
end
	
-- Finding students whose gender is not 'M'
select 
gender,
first_name
from students
where gender != 'M';


-- Find all exam results where marks are greater than 60 AND less than 90.
select 
marks 
from exam_results
where marks >  60 and marks <90;

-- Find all subjects that are NOT in the Sciences department. BETWEEN
select * from subjects
where  department != 'Sciences';

-- Find all exams that took place between 15th March 2024 and 18th March 2024.
select 
		* from exam_results
		where exam_date between '2024-03-15' and '2024-03-18';

--Find all students born between 1st January 2008 and 31st December 2008.
select 
 		* from students
 		where date_of_birth between '2008-01-01' and '2008-12-31';


--Find all subjects that belong to Languages or Humanities using IN.LIKE
select 
 		* 
 		from subjects
 		where department 
	like '%Humanities' or department like '%Languages%';

-- Find all students whose last name ends with 'u'.
select 
* from students
where last_name like '%u';

-- Find all teachers whose name starts with 'Ms'.COUNT 
select count(*)
		from subjects
		where teacher_name like 'Ms%';

--How many students are there in total?
select count(*)
from students;

--How many subjects are in the Sciences department?
select count(*)
from subjects
		where department = 'Sciences';

--How many students come from Nairobi?
select count(*)
from students
where city = 'Nairobi';

/*Write a query using CASE WHEN to label each exam result as:
    • 'Distinction' if marks >= 80
    • 'Merit' if marks >= 60
    • 'Pass' if marks >= 40
    • 'Fail' if marks below 40
    */
select * ,
case
	when marks >= 80 then 'Distinction'
	when marks >= 60 then 'Merit'
	when marks >= 40 then 'Pass'
	else 'Fail'
end as performance
from exam_results;

--Write a query using CASE WHEN to label each subject by department as:
   -- 'STEM' if the department is Sciences
   --'Arts' if the department is Humanities or Languages
select *,
		case 
			when department = 'Sciences' then 'STEM'
			when department = 'Languages' then 'ARTS'
			else 'ARTS'
			end as track
			from subjects;

-- Write a query using CASE WHEN to show each student's gender in full:
--  • 'Female' if gender = 'F'
--  • 'Male' if gender = 'M'
select
*,
case 
	when gender = 'F' then 'Female'
	else 'Male'
	end as gender
	from students;

/* Write a query using CASE WHEN on the exam_results table to label the marks as:
    • 'Excellent' if marks >= 90
    • 'Good' if marks >= 70
    • 'Average' if marks >= 50
    • 'Poor' if marks below 50
    */
select *,
case
	when marks >= 90 then  'Excellent'
	when marks >= 70 then 'Good'
	when marks >= 50 then 'Average' 
	else 'Poor'
end as performance
from exam_results;

--Find all female students who are in Form 3 AND come from Nairobi.
select
* from students
where class = 'Form 3' and city = 'Nairobi';

--Count how many exam results fall between 70 and 100.
select count(*)
from exam_results
where marks between 70 and 100;

--Write a query to find all subjects whose teacher's name starts with 'Ms' AND the subject is in the Sciences department.
select *
from subjects
where teacher_name like 'Ms%' and department = 'Sciences';

/*Write a query that shows each student's full name (first + last joined together), 
 * their class,
 *  and a CASE WHEN label - 'Senior' if Form 3 or Form 4, 'Junior' otherwise.
 */
select 
concat(first_name, ' ',last_name) as full_name,
class,
case 
	when class = 'Form 3' then 'Senior'
	when class = 'Form 4' then 'Senior'
	else 'Junior'
	end as level
	from students;

/* Find all students NOT from Nairobi who were born after 1st January 2008, 
 * and display their names in UPPERCASE.
 */
select 
UPPER(first_name) 
 from students
where city != 'Nairobi'
and date_of_birth > '2008-01-01';
