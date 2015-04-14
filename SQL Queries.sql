/**
** SQL Queries
**
*/

/*
* a table of all the rooms with no renters
*/
create view available_rooms as
select * from room where room_ID not in (select room_ID from renting);