SELECT * FROM support ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM airports ORDER BY state, airport_id;

SELECT * FROM hold2;
SELECT * FROM hold;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM hold2;
SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM airports ORDER BY state, airport_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM hold;

SELECT * FROM hold2;
SELECT * FROM hold2;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM hold;

SELECT * FROM airports ORDER BY state, airport_id;

SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM support ORDER BY flight_id;

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM airports ORDER BY state, airport_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM hold2;
SELECT * FROM hold;

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM hold2;
SELECT * FROM extras ORDER BY flight_id

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM flights WHERE flight_id = 100001;
SELECT flights.flight_id, departured, departure, arrivald, arrival, from_airport, to_airport,
flights.plane_id, food_and_bev, movies, wifi, support_no, refueling, maintenance, cleaning, baggage
FROM flights 
JOIN extras ON flights.flight_id = extras.flight_id
JOIN support ON flights.flight_id = support.flight_id 
WHERE flights.flight_id = 100001;

SELECT * FROM flights WHERE flight_id = 100000;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM flights WHERE flight_id = 100003;
SELECT * FROM airports WHERE airport_id = 'RST';
SELECT * FROM airports WHERE airport_id = 'JFK';
SELECT * FROM planes WHERE plane_id = 'A1233';
SELECT * FROM flights WHERE flight_id = 100003;
SELECT * FROM airports WHERE airport_id = 'RST';
SELECT * FROM airports WHERE airport_id = 'JFK';
SELECT * FROM planes WHERE plane_id = 'A1233';
SELECT * FROM flights WHERE flight_id = 1212;
SELECT * FROM airports WHERE airport_id = 'RST';
SELECT * FROM airports WHERE airport_id = 'JFK';
SELECT * FROM planes WHERE plane_id = 'A1233';
SELECT * FROM flights WHERE flight_id = 100005;
SELECT * FROM airports WHERE airport_id = 'RST';
SELECT * FROM airports WHERE airport_id = 'JFK';
SELECT * FROM planes WHERE plane_id = 'A1233';
SELECT * FROM flights WHERE flight_id = 100005;
SELECT * FROM airports WHERE airport_id = 'AAAAA';
SELECT * FROM airports WHERE airport_id = 'AAAAA';
SELECT * FROM planes WHERE plane_id = 'A1233';
SELECT * FROM flights WHERE flight_id = 100005;
SELECT * FROM airports WHERE airport_id = 'RST';
SELECT * FROM airports WHERE airport_id = 'BBBBB';
SELECT * FROM planes WHERE plane_id = 'A1233';
SELECT * FROM flights WHERE flight_id = 100005;
SELECT * FROM airports WHERE airport_id = 'RST';
SELECT * FROM airports WHERE airport_id = 'ORD';
SELECT * FROM planes WHERE plane_id = 'dddddd';
SELECT * FROM flights WHERE flight_id = 100005;
SELECT * FROM airports WHERE airport_id = 'RST';
SELECT * FROM airports WHERE airport_id = 'ORD';
SELECT * FROM planes WHERE plane_id = 'a32432432';
SELECT * FROM flights WHERE flight_id = 100005;
SELECT * FROM airports WHERE airport_id = 'RST';
SELECT * FROM airports WHERE airport_id = 'ORD';
SELECT * FROM planes WHERE plane_id = 'B2354';
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM extras ORDER BY flight_id

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM hold;

SELECT * FROM airports ORDER BY state, airport_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM airports ORDER BY state, airport_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM hold;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM hold;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM airports ORDER BY state, airport_id;

SELECT * FROM hold2;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM hold2;
SELECT * FROM support ORDER BY flight_id;

SELECT * FROM hold;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM airports ORDER BY state, airport_id;

SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM hold2;
SELECT * FROM extras ORDER BY flight_id

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM hold2;
SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM hold;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM hold2;
SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM hold2;
SELECT * FROM support ORDER BY flight_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM airports ORDER BY state, airport_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM hold;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM hold2;
SELECT * FROM flights WHERE flight_id = 100001;
SELECT flights.flight_id, departured, departure, arrivald, arrival, from_airport, to_airport,
flights.plane_id, food_and_bev, movies, wifi, support_no, refueling, maintenance, cleaning, baggage
FROM flights 
JOIN extras ON flights.flight_id = extras.flight_id
JOIN support ON flights.flight_id = support.flight_id 
WHERE flights.flight_id = 100001;

SELECT * FROM flights WHERE flight_id = 1000;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM flights WHERE flight_id = 100003;
SELECT flights.flight_id, departured, departure, arrivald, arrival, from_airport, to_airport,
flights.plane_id, food_and_bev, movies, wifi, support_no, refueling, maintenance, cleaning, baggage
FROM flights 
JOIN extras ON flights.flight_id = extras.flight_id
JOIN support ON flights.flight_id = support.flight_id 
WHERE flights.flight_id = 100003;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM flights WHERE flight_id = 100001;
SELECT * FROM airports WHERE airport_id = 'RST';
SELECT * FROM airports WHERE airport_id = 'JFK';
SELECT * FROM planes WHERE plane_id = 'A1233';
SELECT * FROM flights WHERE flight_id = 100034;
SELECT * FROM airports WHERE airport_id = 'RST';
SELECT * FROM airports WHERE airport_id = 'JFK';
SELECT * FROM planes WHERE plane_id = 'A1233';
SELECT * FROM flights WHERE flight_id = 123;
SELECT * FROM airports WHERE airport_id = 'RST';
SELECT * FROM airports WHERE airport_id = 'JFK';
SELECT * FROM planes WHERE plane_id = 'A1233';
SELECT * FROM flights WHERE flight_id = 123456;
SELECT * FROM airports WHERE airport_id = 'RST';
SELECT * FROM airports WHERE airport_id = 'JFK';
SELECT * FROM planes WHERE plane_id = 'A1233';
SELECT * FROM flights WHERE flight_id = 123456;
SELECT * FROM airports WHERE airport_id = 'HHHH';
SELECT * FROM airports WHERE airport_id = 'JFK';
SELECT * FROM planes WHERE plane_id = 'A1233';
SELECT * FROM flights WHERE flight_id = 123456;
SELECT * FROM airports WHERE airport_id = 'JFK';
SELECT * FROM airports WHERE airport_id = 'GGGG';
SELECT * FROM planes WHERE plane_id = 'A1233';
SELECT * FROM flights WHERE flight_id = 123456;
SELECT * FROM airports WHERE airport_id = 'JFK';
SELECT * FROM airports WHERE airport_id = 'ORD';
SELECT * FROM planes WHERE plane_id = 'kasasdf';
SELECT * FROM flights WHERE flight_id = 123456;
SELECT * FROM airports WHERE airport_id = 'JFK';
SELECT * FROM airports WHERE airport_id = 'ORD';
SELECT * FROM planes WHERE plane_id = 'B2354';
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM planes WHERE plane_id = 'A1233';
SELECT * FROM planes WHERE plane_id = 'A1238';
SELECT * FROM extras ORDER BY flight_id

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM extras ORDER BY flight_id

SELECT * FROM hold;

SELECT * FROM hold2;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM hold2;
SELECT * FROM support ORDER BY flight_id;

SELECT * FROM planes WHERE plane_id = 'A1233';
SELECT * FROM support ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM hold;

SELECT * FROM hold2;
SELECT * FROM hold2;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM passenger WHERE identification_id = 26116787;
SELECT personal.identification_id, first_name, last_name, phone, email, descr, board_pass.flight_id, board_pass.board_id, board_pass.checkin_time, board_pass.gate 
FROM personal 
JOIN passenger ON personal.identification_id = passenger.identification_id
JOIN board_pass ON personal.identification_id = board_pass.identification_id 
WHERE personal.identification_id = 26116787;

SELECT * FROM passenger WHERE identification_id = 26116786;
SELECT * FROM crew WHERE identification_id = 40664471;
SELECT personal.identification_id, first_name, last_name, phone, email, descr, board_pass.flight_id, board_pass.board_id, board_pass.checkin_time, board_pass.gate 
FROM personal 
JOIN crew ON personal.identification_id = crew.identification_id
JOIN board_pass ON personal.identification_id = board_pass.identification_id 
WHERE personal.identification_id = 40664471;

SELECT * FROM crew WHERE identification_id = 40664470;
SELECT * FROM crew WHERE identification_id = ;
SELECT * FROM support ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM hold2;
SELECT * FROM airports ORDER BY state, airport_id;

SELECT * FROM hold;

SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM extras ORDER BY flight_id

SELECT * FROM hold2;
SELECT * FROM support ORDER BY flight_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM flights WHERE flight_id = 100001;
SELECT flights.flight_id, departured, departure, arrivald, arrival, from_airport, to_airport,
flights.plane_id, food_and_bev, movies, wifi, support_no, refueling, maintenance, cleaning, baggage
FROM flights 
JOIN extras ON flights.flight_id = extras.flight_id
JOIN support ON flights.flight_id = support.flight_id 
WHERE flights.flight_id = 100001;

SELECT * FROM flights WHERE flight_id = 10000;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM flights WHERE flight_id = 100001;
SELECT * FROM airports WHERE airport_id = 'RST	';
SELECT * FROM airports WHERE airport_id = 'ORD';
SELECT * FROM planes WHERE plane_id = 'B2354';
SELECT * FROM flights WHERE flight_id = 100023;
SELECT * FROM airports WHERE airport_id = 'RST	';
SELECT * FROM airports WHERE airport_id = 'ORD';
SELECT * FROM planes WHERE plane_id = 'B2354';
SELECT * FROM flights WHERE flight_id = 100023;
SELECT * FROM airports WHERE airport_id = 'RST';
SELECT * FROM airports WHERE airport_id = 'ORD';
SELECT * FROM planes WHERE plane_id = 'B2354';
SELECT * FROM airports WHERE airport_id = 'RST';
SELECT * FROM airports WHERE airport_id = 'ORD';
SELECT * FROM planes WHERE plane_id = 'B2354';
SELECT * FROM support ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM hold;

SELECT * FROM airports ORDER BY state, airport_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM hold2;
SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM airports ORDER BY state, airport_id;

SELECT * FROM hold;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM hold2;
SELECT * FROM planes WHERE plane_id = 'B2354';
SELECT * FROM support ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM extras ORDER BY flight_id

SELECT * FROM hold2;
SELECT * FROM hold;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM hold2;
SELECT * FROM passenger WHERE identification_id = 12345678;
SELECT personal.identification_id, first_name, last_name, phone, email, descr, board_pass.flight_id, board_pass.board_id, board_pass.checkin_time, board_pass.gate 
FROM personal 
JOIN passenger ON personal.identification_id = passenger.identification_id
JOIN board_pass ON personal.identification_id = board_pass.identification_id 
WHERE personal.identification_id = 12345678;

SELECT * FROM passenger WHERE identification_id = 12345677;
SELECT * FROM crew WHERE identification_id = 87668137;
SELECT personal.identification_id, first_name, last_name, phone, email, descr, board_pass.flight_id, board_pass.board_id, board_pass.checkin_time, board_pass.gate 
FROM personal 
JOIN crew ON personal.identification_id = crew.identification_id
JOIN board_pass ON personal.identification_id = board_pass.identification_id 
WHERE personal.identification_id = 87668137;

SELECT * FROM crew WHERE identification_id = 87668136;
SELECT * FROM support ORDER BY flight_id;

SELECT * FROM airports ORDER BY state, airport_id;

SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM hold;

SELECT * FROM hold2;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM hold2;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM hold2;
SELECT * FROM airports ORDER BY state, airport_id;

SELECT * FROM hold;

SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM hold2;
SELECT * FROM extras ORDER BY flight_id

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM hold;

SELECT * FROM airports ORDER BY state, airport_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM hold2;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM flights WHERE flight_id = 100001;
SELECT flights.flight_id, departured, departure, arrivald, arrival, from_airport, to_airport,
flights.plane_id, food_and_bev, movies, wifi, support_no, refueling, maintenance, cleaning, baggage
FROM flights 
JOIN extras ON flights.flight_id = extras.flight_id
JOIN support ON flights.flight_id = support.flight_id 
WHERE flights.flight_id = 100001;

SELECT * FROM flights WHERE flight_id = 100000;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM flights WHERE flight_id = 100001;
SELECT * FROM airports WHERE airport_id = 'RST';
SELECT * FROM airports WHERE airport_id = 'JFK';
SELECT * FROM planes WHERE plane_id = 'B2354';
SELECT * FROM flights WHERE flight_id = 100020;
SELECT * FROM airports WHERE airport_id = 'RST';
SELECT * FROM airports WHERE airport_id = 'JFK';
SELECT * FROM planes WHERE plane_id = 'B2354';
SELECT * FROM airports WHERE airport_id = 'RST';
SELECT * FROM airports WHERE airport_id = 'JFK';
SELECT * FROM planes WHERE plane_id = 'B2354';
SELECT * FROM flights WHERE flight_id = 100020;
SELECT * FROM airports WHERE airport_id = 'RST';
SELECT * FROM airports WHERE airport_id = 'JFK';
SELECT * FROM planes WHERE plane_id = 'B2354';
SELECT * FROM flights WHERE flight_id = 100025;
SELECT * FROM airports WHERE airport_id = 'RST';
SELECT * FROM airports WHERE airport_id = 'JFK';
SELECT * FROM planes WHERE plane_id = 'B2354';
SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM extras ORDER BY flight_id

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM hold2;
SELECT * FROM hold;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM hold2;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM planes WHERE plane_id = 'B2354';
SELECT * FROM support ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM hold;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM hold2;
SELECT * FROM support ORDER BY flight_id;

SELECT * FROM hold2;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM passenger WHERE identification_id = 12345678;
SELECT personal.identification_id, first_name, last_name, phone, email, descr, board_pass.flight_id, board_pass.board_id, board_pass.checkin_time, board_pass.gate 
FROM personal 
JOIN passenger ON personal.identification_id = passenger.identification_id
JOIN board_pass ON personal.identification_id = board_pass.identification_id 
WHERE personal.identification_id = 12345678;

SELECT * FROM passenger WHERE identification_id = 12345677;
SELECT * FROM crew WHERE identification_id = 41928300;
SELECT personal.identification_id, first_name, last_name, phone, email, descr, board_pass.flight_id, board_pass.board_id, board_pass.checkin_time, board_pass.gate 
FROM personal 
JOIN crew ON personal.identification_id = crew.identification_id
JOIN board_pass ON personal.identification_id = board_pass.identification_id 
WHERE personal.identification_id = 41928300;

SELECT * FROM crew WHERE identification_id = 41928301;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM extras ORDER BY flight_id

SELECT * FROM hold;

SELECT * FROM airports ORDER BY state, airport_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM hold2;
SELECT * FROM planes WHERE plane_id = 'A1233';
SELECT * FROM planes WHERE plane_id = 'A1244';
SELECT * FROM support ORDER BY flight_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM support ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM hold2;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM airports ORDER BY state, airport_id;

SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM support ORDER BY flight_id;

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM hold2;
SELECT * FROM extras ORDER BY flight_id

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM airports ORDER BY state, airport_id;

SELECT * FROM hold2;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM hold;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM support ORDER BY flight_id;

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM extras ORDER BY flight_id

SELECT * FROM hold2;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM flights WHERE flight_id = 100001;
SELECT flights.flight_id, departured, departure, arrivald, arrival, from_airport, to_airport,
flights.plane_id, food_and_bev, movies, wifi, support_no, refueling, maintenance, cleaning, baggage
FROM flights 
JOIN extras ON flights.flight_id = extras.flight_id
JOIN support ON flights.flight_id = support.flight_id 
WHERE flights.flight_id = 100001;

SELECT * FROM flights WHERE flight_id = 100000;
SELECT * FROM support ORDER BY flight_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM planes ORDER BY plane_id;
SELECT * FROM airports ORDER BY state, airport_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM hold2;
SELECT * FROM hold;

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM board_pass
JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN passenger ON personal.identification_id = passenger.identification_id
UNION
SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id
JOIN crew ON personal.identification_id = crew.identification_id
ORDER BY board_id;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM hold2;
SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM extras ORDER BY flight_id

SELECT * FROM support ORDER BY flight_id;

SELECT * FROM flights ORDER BY flight_id;

SELECT * FROM flights WHERE flight_id = 100012;
SELECT * FROM airports WHERE airport_id = 'RST';
SELECT * FROM airports WHERE airport_id = 'ORD';
SELECT * FROM planes WHERE plane_id = 'A4721';
