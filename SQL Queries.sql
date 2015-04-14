/**
** SQL Queries
**
*/

/*
* a table of all the rooms with no renters
*/
create view available_rooms as
select * from room where room_ID not in (select room_ID from renting);

/*
* a table of all students signed up to the dorm rooms ordered by distance to education
*/
create view sign_ups as
	select First_name, Last_name, Dorm_name, Distance_to_edu from signed_up natural join student 
	where CPR_no not in (select CPR_no from renting)
    order by signed_up.Distance_to_edu;
