BEGIN TRANSACTION;
DELETE FROM hold3;
INSERT INTO hold3
SELECT flights.flight_id, departured, departure, arrivald, arrival, from_airport, to_airport,
flights.plane_id, food_and_bev, movies, wifi, support_no, refueling, maintenance, cleaning, baggage
FROM flights 
JOIN extras ON flights.flight_id = extras.flight_id
JOIN support ON flights.flight_id = support.flight_id 
WHERE flights.flight_id = 100001;
SELECT * FROM hold3;
DELETE FROM hold3;
COMMIT;
BEGIN TRANSACTION;
INSERT INTO flights
VALUES(100003,'2021-12-08','17:33','2021-12-08',
'17:34','RST','JFK','A1233');
INSERT INTO support VALUES (22226,'A1233',100003,
'UNKNOWN', 'NEEDS TO BE CHECKED', 'UNKOWN', 'UNKOWN');
INSERT INTO extras VALUES (100003, 'UNKNOWN','UNKNOWN','UNKOWN');
SELECT * FROM flights WHERE flight_id = 100003;
COMMIT;
BEGIN TRANSACTION;
INSERT INTO flights
VALUES(100005,'2021-12-08','17:33','2021-12-08',
'17:34','RST','ORD','B2354');
INSERT INTO support VALUES (22228,'B2354',100005,
'UNKNOWN', 'NEEDS TO BE CHECKED', 'UNKOWN', 'UNKOWN');
INSERT INTO extras VALUES (100005, 'UNKNOWN','UNKNOWN','UNKOWN');
SELECT * FROM flights WHERE flight_id = 100005;
COMMIT;
BEGIN TRANSACTION;
SELECT * FROM flights WHERE flight_id = $1;DELETE FROM flights WHERE flight_id = $1;DELETE FROM extras WHERE flight_id = $1;DELETE FROM support WHERE flight_id = $1;COMMIT;
BEGIN TRANSACTION;
UPDATE extras SET food_and_bev = 'NONE PROVIDED',
movies = '',
wifi = ''
WHERE flight_id = 100003;
COMMIT;
BEGIN TRANSACTION;
UPDATE extras SET food_and_bev = 'NONE PROVIDED',
movies = 'NO',
wifi = 'NO'
WHERE flight_id = 100003;
COMMIT;
BEGIN TRANSACTION;
UPDATE extras SET food_and_bev = 'BREAKFEST ONLY',
movies = 'YES',
wifi = 'NO'
WHERE flight_id = 100005;
COMMIT;
BEGIN TRANSACTION;
DELETE FROM hold3;
INSERT INTO hold3
SELECT flights.flight_id, departured, departure, arrivald, arrival, from_airport, to_airport,
flights.plane_id, food_and_bev, movies, wifi, support_no, refueling, maintenance, cleaning, baggage
FROM flights 
JOIN extras ON flights.flight_id = extras.flight_id
JOIN support ON flights.flight_id = support.flight_id 
WHERE flights.flight_id = 100001;
SELECT * FROM hold3;
DELETE FROM hold3;
COMMIT;
BEGIN TRANSACTION;
DELETE FROM hold3;
INSERT INTO hold3
SELECT flights.flight_id, departured, departure, arrivald, arrival, from_airport, to_airport,
flights.plane_id, food_and_bev, movies, wifi, support_no, refueling, maintenance, cleaning, baggage
FROM flights 
JOIN extras ON flights.flight_id = extras.flight_id
JOIN support ON flights.flight_id = support.flight_id 
WHERE flights.flight_id = 100003;
SELECT * FROM hold3;
DELETE FROM hold3;
COMMIT;
BEGIN TRANSACTION;
INSERT INTO flights
VALUES(100034,'2021-12-02','17:46','2021-12-02',
'17:47','RST','JFK','A1233');
INSERT INTO support VALUES (22257,'A1233',100034,
'UNKNOWN', 'NEEDS TO BE CHECKED', 'UNKOWN', 'UNKOWN');
INSERT INTO extras VALUES (100034, 'UNKNOWN','UNKNOWN','UNKOWN');
SELECT * FROM flights WHERE flight_id = 100034;
COMMIT;
BEGIN TRANSACTION;
INSERT INTO flights
VALUES(123456,'2021-12-02','17:46','2021-12-02',
'17:47','JFK','ORD','B2354');
INSERT INTO support VALUES (45679,'B2354',123456,
'UNKNOWN', 'NEEDS TO BE CHECKED', 'UNKOWN', 'UNKOWN');
INSERT INTO extras VALUES (123456, 'UNKNOWN','UNKNOWN','UNKOWN');
SELECT * FROM flights WHERE flight_id = 123456;
COMMIT;
BEGIN TRANSACTION;
INSERT INTO planes
VALUES('A1238','some model',21);
SELECT * FROM planes WHERE plane_id = 'A1238';
COMMIT;
BEGIN TRANSACTION;
UPDATE extras SET food_and_bev = 'NONE PROVIDED',
movies = 'NO',
wifi = 'NO'
WHERE flight_id = 100034;
COMMIT;
BEGIN TRANSACTION;
UPDATE support SET plane_id = 'A1233',
flight_id= 100034,
refueling = 'NOT FUELED',
maintenance = 'NEEDS REGULAR INSPECTION',
cleaning = 'NOT CLEANED',
baggage = 'NOT LOADED'
WHERE support_no = 22257;
UPDATE flights SET plane_id = 'A1233'
WHERE flight_id = 100034;
COMMIT;
BEGIN TRANSACTION;
DELETE FROM hold;
INSERT INTO hold
SELECT personal.identification_id, first_name, last_name, phone, email, descr, board_pass.flight_id, board_pass.board_id, board_pass.checkin_time, board_pass.gate 
FROM personal 
JOIN passenger ON personal.identification_id = passenger.identification_id
JOIN board_pass ON personal.identification_id = board_pass.identification_id 
WHERE personal.identification_id = 26116787;
DELETE FROM hold;
COMMIT;
BEGIN TRANSACTION;
DELETE FROM hold2;
INSERT INTO hold2
SELECT personal.identification_id, first_name, last_name, phone, email, descr, board_pass.flight_id, board_pass.board_id, board_pass.checkin_time, board_pass.gate 
FROM personal 
JOIN crew ON personal.identification_id = crew.identification_id
JOIN board_pass ON personal.identification_id = board_pass.identification_id 
WHERE personal.identification_id = 40664471;
DELETE FROM hold2;
COMMIT;
BEGIN TRANSACTION;
DELETE FROM hold3;
INSERT INTO hold3
SELECT flights.flight_id, departured, departure, arrivald, arrival, from_airport, to_airport,
flights.plane_id, food_and_bev, movies, wifi, support_no, refueling, maintenance, cleaning, baggage
FROM flights 
JOIN extras ON flights.flight_id = extras.flight_id
JOIN support ON flights.flight_id = support.flight_id 
WHERE flights.flight_id = 100001;
SELECT * FROM hold3;
DELETE FROM hold3;
COMMIT;
BEGIN TRANSACTION;
SELECT * FROM flights WHERE flight_id = $1;DELETE FROM flights WHERE flight_id = $1;DELETE FROM extras WHERE flight_id = $1;DELETE FROM support WHERE flight_id = $1;COMMIT;
BEGIN TRANSACTION;
INSERT INTO flights
VALUES(100023,'2021-12-02','17:57','2021-12-02',
'17:58','RST','ORD','B2354');
INSERT INTO support VALUES (22246,'B2354',100023,
'UNKNOWN', 'NEEDS TO BE CHECKED', 'UNKOWN', 'UNKOWN');
INSERT INTO extras VALUES (100023, 'UNKNOWN','UNKNOWN','UNKOWN');
SELECT * FROM flights WHERE flight_id = 100023;
COMMIT;
BEGIN TRANSACTION;
UPDATE flights SET departured = '2021-12-02',
departure= '17:57:00',
arrivald = '2021-12-03',
arrival = '17:58:00',
from_airport = 'RST',
to_airport = 'ORD',
plane_id = 'B2354'
WHERE flight_id = 100023;
COMMIT;
BEGIN TRANSACTION;
UPDATE extras SET food_and_bev = 'NONE PROVIDED',
movies = 'NO',
wifi = 'NO'
WHERE flight_id = 100023;
COMMIT;
BEGIN TRANSACTION;
UPDATE support SET plane_id = 'B2354',
flight_id= 100023,
refueling = 'FUELED',
maintenance = 'CLEAR TO GO',
cleaning = 'CLEANED',
baggage = 'LOADED'
WHERE support_no = 22246;
UPDATE flights SET plane_id = 'B2354'
WHERE flight_id = 100023;
COMMIT;
BEGIN TRANSACTION;
DELETE FROM hold;
INSERT INTO hold
SELECT personal.identification_id, first_name, last_name, phone, email, descr, board_pass.flight_id, board_pass.board_id, board_pass.checkin_time, board_pass.gate 
FROM personal 
JOIN passenger ON personal.identification_id = passenger.identification_id
JOIN board_pass ON personal.identification_id = board_pass.identification_id 
WHERE personal.identification_id = 12345678;
DELETE FROM hold;
COMMIT;
BEGIN TRANSACTION;
DELETE FROM hold2;
INSERT INTO hold2
SELECT personal.identification_id, first_name, last_name, phone, email, descr, board_pass.flight_id, board_pass.board_id, board_pass.checkin_time, board_pass.gate 
FROM personal 
JOIN crew ON personal.identification_id = crew.identification_id
JOIN board_pass ON personal.identification_id = board_pass.identification_id 
WHERE personal.identification_id = 87668137;
DELETE FROM hold2;
COMMIT;
BEGIN TRANSACTION;
SELECT * FROM flights WHERE flight_id = $1;DELETE FROM flights WHERE flight_id = $1;DELETE FROM extras WHERE flight_id = $1;DELETE FROM support WHERE flight_id = $1;COMMIT;
BEGIN TRANSACTION;
SELECT * FROM flights WHERE flight_id = $1;DELETE FROM flights WHERE flight_id = $1;DELETE FROM extras WHERE flight_id = $1;DELETE FROM support WHERE flight_id = $1;COMMIT;
BEGIN TRANSACTION;
DELETE FROM hold3;
INSERT INTO hold3
SELECT flights.flight_id, departured, departure, arrivald, arrival, from_airport, to_airport,
flights.plane_id, food_and_bev, movies, wifi, support_no, refueling, maintenance, cleaning, baggage
FROM flights 
JOIN extras ON flights.flight_id = extras.flight_id
JOIN support ON flights.flight_id = support.flight_id 
WHERE flights.flight_id = 100001;
SELECT * FROM hold3;
DELETE FROM hold3;
COMMIT;
BEGIN TRANSACTION;
INSERT INTO flights
VALUES(100020,'2021-12-02','18:18','2021-12-02',
'18:19','RST','JFK','B2354');
INSERT INTO support VALUES (22243,'B2354',100020,
'UNKNOWN', 'NEEDS TO BE CHECKED', 'UNKOWN', 'UNKOWN');
INSERT INTO extras VALUES (100020, 'UNKNOWN','UNKNOWN','UNKOWN');
SELECT * FROM flights WHERE flight_id = 100020;
COMMIT;
BEGIN TRANSACTION;
UPDATE extras SET food_and_bev = 'NONE PROVIDED',
movies = 'NO',
wifi = 'NO'
WHERE flight_id = 100020;
COMMIT;
BEGIN TRANSACTION;
UPDATE support SET plane_id = 'B2354',
flight_id= 100020,
refueling = 'FUELED',
maintenance = 'CLEAR TO GO',
cleaning = 'CLEANED',
baggage = 'LOADED'
WHERE support_no = 22243;
UPDATE flights SET plane_id = 'B2354'
WHERE flight_id = 100020;
COMMIT;
BEGIN TRANSACTION;
DELETE FROM hold;
INSERT INTO hold
SELECT personal.identification_id, first_name, last_name, phone, email, descr, board_pass.flight_id, board_pass.board_id, board_pass.checkin_time, board_pass.gate 
FROM personal 
JOIN passenger ON personal.identification_id = passenger.identification_id
JOIN board_pass ON personal.identification_id = board_pass.identification_id 
WHERE personal.identification_id = 12345678;
DELETE FROM hold;
COMMIT;
BEGIN TRANSACTION;
DELETE FROM hold2;
INSERT INTO hold2
SELECT personal.identification_id, first_name, last_name, phone, email, descr, board_pass.flight_id, board_pass.board_id, board_pass.checkin_time, board_pass.gate 
FROM personal 
JOIN crew ON personal.identification_id = crew.identification_id
JOIN board_pass ON personal.identification_id = board_pass.identification_id 
WHERE personal.identification_id = 41928300;
DELETE FROM hold2;
COMMIT;
BEGIN TRANSACTION;
INSERT INTO planes
VALUES('A1244','SOME MODEL',255);
SELECT * FROM planes WHERE plane_id = 'A1244';
COMMIT;
BEGIN TRANSACTION;
DELETE FROM hold3;
INSERT INTO hold3
SELECT flights.flight_id, departured, departure, arrivald, arrival, from_airport, to_airport,
flights.plane_id, food_and_bev, movies, wifi, support_no, refueling, maintenance, cleaning, baggage
FROM flights 
JOIN extras ON flights.flight_id = extras.flight_id
JOIN support ON flights.flight_id = support.flight_id 
WHERE flights.flight_id = 100001;
SELECT * FROM hold3;
DELETE FROM hold3;
COMMIT;
BEGIN TRANSACTION;
INSERT INTO flights
VALUES(100012,'2021-12-02','19:11','2021-12-02',
'19:12','RST','ORD','A4721');
INSERT INTO support VALUES (22235,'A4721',100012,
'UNKNOWN', 'NEEDS TO BE CHECKED', 'UNKOWN', 'UNKOWN');
INSERT INTO extras VALUES (100012, 'UNKNOWN','UNKNOWN','UNKOWN');
SELECT * FROM flights WHERE flight_id = 100012;
COMMIT;
BEGIN TRANSACTION;
SELECT * FROM flights WHERE flight_id = $1;DELETE FROM flights WHERE flight_id = $1;DELETE FROM extras WHERE flight_id = $1;DELETE FROM support WHERE flight_id = $1;COMMIT;
