libname g_a "C:\Users\kfernandes\Desktop\BRT-master\Group assignment"; run;

/*Table merge*/

PROC SQL;
CREATE TABLE g_a.F_W_P_A_AR4 AS 
SELECT f.carrier, f.month, f.tailnum, f.dep_delay, f.arr_delay, f.flight, f.origin, f.dest, f.distance, f.time_hour, f.air_time,  w.temp, w.dewp, w.humid, w.wind_dir, w.wind_speed, w.wind_gust, 
w.precip, w.pressure, w.visib, p.type, p.manufacturer, p.model, p.engines, p.seats, p.engine, a.name AS airline_name,
ar.name AS airport_name, ar.lat AS Latitude, ar.lon AS Longitude, ar.alt AS Airport_Altitude
	FROM g_a.flights AS f, g_a.weather AS w, g_a.planes AS p, g_a.airlines AS a, g_a.airports AS ar
	WHERE f.time_hour = w.time_hour
	AND f.tailnum = p.tailnum
	AND f.carrier = a.carrier
	AND f.origin = ar.faa /*not matched to destination*/
;
QUIT;
RUN;

/*Data analysis - 1*/


/*Temperature*/

PROC SQL;
SELECT origin, max(temp) AS Max_temp, min(temp) AS Min_temp, avg(temp) AS Avg_temp, avg(dep_delay) AS Dep_delay, avg(arr_delay) AS Arr_delay
FROM g_a.F_W_P_A_AR4
HAVING
GROUP BY 1;
QUIT;
RUN;

/* Dewpoint */

PROC SQL;
SELECT origin, max(dewp) AS Max_dewp, min(dewp) AS Min_dewp, avg(dewp) AS Avg_dewp, avg(dep_delay) AS Dep_delay, avg(arr_delay) AS Arr_delay
FROM g_a.F_W_P_A_AR4
GROUP BY 1;
QUIT;
RUN;

/*Humid*/

PROC SQL;
SELECT origin, max(humid) AS Max_humid, min(humid) AS Min_humid, avg(humid) AS Avg_humid, avg(dep_delay) AS Dep_delay, avg(arr_delay) AS Arr_delay
FROM g_a.F_W_P_A_AR4
GROUP BY 1;
QUIT;
RUN;

/*Wind_dir*/

PROC SQL;
SELECT origin, max(wind_dir) AS Max_wind_dir, min(wind_dir) AS Min_wind_dir, avg(wind_dir) AS Avg_wind_dir, avg(dep_delay) AS Dep_delay, avg(arr_delay) AS Arr_delay
FROM g_a.F_W_P_A_AR4
GROUP BY 1;
QUIT;
RUN;

/*Wind_gust*/

PROC SQL;
SELECT origin, max(wind_gust) AS Max_wind_gust, min(wind_gust) AS Min_wind_gust, avg(wind_gust) AS Avg_wind_gust, avg(dep_delay) AS Dep_delay, avg(arr_delay) AS Arr_delay
FROM g_a.F_W_P_A_AR4
GROUP BY 1;
QUIT;
RUN;

/*Precip*/

PROC SQL;
SELECT origin, max(precip) AS Max_precip, min(precip) AS Min_precip, avg(precip) AS Avg_precipt, avg(dep_delay) AS Dep_delay, avg(arr_delay) AS Arr_delay
FROM g_a.F_W_P_A_AR4
GROUP BY 1;
QUIT;
RUN;


/*Data analysis - 2*/

/*Origins*/
/*Effect of precipitation on delays*/
PROC SQL;
CREATE TABLE g_a.origin_total_rain AS
	SELECT origin, SUM(precip) as Total_rain, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY origin;
QUIT;
RUN;

/*Effect of wind_gust on delays*/
PROC SQL;
CREATE TABLE g_a.origin_wind_gust AS
	SELECT origin, AVG(wind_gust) as Wind_gust, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY origin;
QUIT;
RUN;

/*Effect of wind_dir on delays*/
PROC SQL;
CREATE TABLE g_a.origin_wind_dir AS
	SELECT origin, AVG(wind_dir) as Wind_dir, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY origin;
QUIT;
RUN;

/*Effect of pressure on delays*/
PROC SQL;
CREATE TABLE g_a.origin_pressure AS
	SELECT origin, AVG(pressure) as Pressure, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY origin;
QUIT;
RUN;


/*Effect of precipitation on delays*/
PROC SQL;
CREATE TABLE g_a.origin_total_rain AS
	SELECT origin, SUM(precip) as Total_rain, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY origin;
QUIT;
RUN;

/*Effect of wind_gust on delays*/
PROC SQL;
CREATE TABLE g_a.origin_wind_gust AS
	SELECT origin, AVG(wind_gust) as Wind_gust, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY origin;
QUIT;
RUN;

/*Effect of wind_dir on delays*/
PROC SQL;
CREATE TABLE g_a.origin_wind_dir AS
	SELECT origin, AVG(wind_dir) as Wind_dir, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY origin;
QUIT;
RUN;

/*Effect of pressure on delays*/
PROC SQL;
CREATE TABLE g_a.origin_pressure AS
	SELECT origin, AVG(pressure) as Pressure, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY origin;
QUIT;
RUN;

/*airline_name*/
/*Effect of precipitation on delays*/
PROC SQL;
CREATE TABLE g_a.airline_name_total_rain AS
	SELECT airline_name, SUM(precip) as Total_rain, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY airline_name;
QUIT;
RUN;

/*Effect of wind_gust on delays*/
PROC SQL;
CREATE TABLE g_a.airline_name_wind_gust AS
	SELECT airline_name, AVG(wind_gust) as Wind_gust, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY airline_name;
QUIT;
RUN;

/*Effect of wind_dir on delays*/
PROC SQL;
CREATE TABLE g_a.airline_name_wind_dir AS
	SELECT airline_name, AVG(wind_dir) as Wind_dir, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY airline_name;
QUIT;
RUN;

/*Effect of pressure on delays*/
PROC SQL;
CREATE TABLE g_a.airline_name_pressure AS
	SELECT airline_name, AVG(pressure) as Pressure, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY airline_name;
QUIT;
RUN;


/*Effect of precipitation on delays*/
PROC SQL;
CREATE TABLE g_a.airline_name_total_rain AS
	SELECT airline_name, SUM(precip) as Total_rain, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY airline_name;
QUIT;
RUN;

/*Effect of wind_gust on delays*/
PROC SQL;
CREATE TABLE g_a.airline_name_wind_gust AS
	SELECT airline_name, AVG(wind_gust) as Wind_gust, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY airline_name;
QUIT;
RUN;

/*Effect of wind_dir on delays*/
PROC SQL;
CREATE TABLE g_a.airline_name_wind_dir AS
	SELECT airline_name, AVG(wind_dir) as Wind_dir, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY airline_name;
QUIT;
RUN;

/*Effect of pressure on delays*/
PROC SQL;
CREATE TABLE g_a.airline_name_pressure AS
	SELECT airline_name, AVG(pressure) as Pressure, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY airline_name;
QUIT;
RUN;


/*Tables for Tableau analysis*/
/*Origins*/
/*Effect of precipitation on delays*/
PROC SQL;
CREATE TABLE g_a.origin_total_rain AS
	SELECT origin, SUM(precip) as Total_rain, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY origin;
QUIT;
RUN;

/*Effect of wind_gust on delays*/
PROC SQL;
CREATE TABLE g_a.origin_wind_gust AS
	SELECT origin, AVG(wind_gust) as Wind_gust, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY origin;
QUIT;
RUN;

/*Effect of wind_dir on delays*/
PROC SQL;
CREATE TABLE g_a.origin_wind_dir AS
	SELECT origin, AVG(wind_dir) as Wind_dir, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY origin;
QUIT;
RUN;

/*Effect of pressure on delays*/
PROC SQL;
CREATE TABLE g_a.origin_pressure AS
	SELECT origin, AVG(pressure) as Pressure, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY origin;
QUIT;
RUN;


/*Effect of precipitation on delays*/
PROC SQL;
CREATE TABLE g_a.origin_total_rain AS
	SELECT origin, SUM(precip) as Total_rain, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY origin;
QUIT;
RUN;

/*Effect of wind_gust on delays*/
PROC SQL;
CREATE TABLE g_a.origin_wind_gust AS
	SELECT origin, AVG(wind_gust) as Wind_gust, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY origin;
QUIT;
RUN;

/*Effect of wind_dir on delays*/
PROC SQL;
CREATE TABLE g_a.origin_wind_dir AS
	SELECT origin, AVG(wind_dir) as Wind_dir, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY origin;
QUIT;
RUN;

/*Effect of pressure on delays*/
PROC SQL;
CREATE TABLE g_a.origin_pressure AS
	SELECT origin, AVG(pressure) as Pressure, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY origin;
QUIT;
RUN;

/*airline_name*/
/*Effect of precipitation on delays*/
PROC SQL;
CREATE TABLE g_a.airline_name_total_rain AS
	SELECT airline_name, SUM(precip) as Total_rain, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY airline_name;
QUIT;
RUN;

/*Effect of wind_gust on delays*/
PROC SQL;
CREATE TABLE g_a.airline_name_wind_gust AS
	SELECT airline_name, AVG(wind_gust) as Wind_gust, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY airline_name;
QUIT;
RUN;

/*Effect of wind_dir on delays*/
PROC SQL;
CREATE TABLE g_a.airline_name_wind_dir AS
	SELECT airline_name, AVG(wind_dir) as Wind_dir, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY airline_name;
QUIT;
RUN;

/*Effect of pressure on delays*/
PROC SQL;
CREATE TABLE g_a.airline_name_pressure AS
	SELECT airline_name, AVG(pressure) as Pressure, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY airline_name;
QUIT;
RUN;


/*Effect of precipitation on delays*/
PROC SQL;
CREATE TABLE g_a.airline_name_total_rain AS
	SELECT airline_name, SUM(precip) as Total_rain, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY airline_name;
QUIT;
RUN;

/*Effect of wind_gust on delays*/
PROC SQL;
CREATE TABLE g_a.airline_name_wind_gust AS
	SELECT airline_name, AVG(wind_gust) as Wind_gust, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY airline_name;
QUIT;
RUN;

/*Effect of wind_dir on delays*/
PROC SQL;
CREATE TABLE g_a.airline_name_wind_dir AS
	SELECT airline_name, AVG(wind_dir) as Wind_dir, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY airline_name;
QUIT;
RUN;

/*Effect of pressure on delays*/
PROC SQL;
CREATE TABLE g_a.airline_name_pressure AS
	SELECT airline_name, AVG(pressure) as Pressure, AVG(dep_delay) as Avg_dep_delay, AVG(arr_delay) as Avg_arr_delay
	FROM g_a.f_w_p_a_ar4
	GROUP BY airline_name;
QUIT;
RUN;


/*Table creation for analysis*/

proc SQL;
create table g_a.precip_and_airport as
SELECT W.precip as Precipitation, A.name as Departure_Airport,
	sum(F.dep_delay) as Departure_Delay,
	sum(F.air_time) as Total_air_time,
	sum(F.dep_delay)/count(F.time_hour) as Average_Delay_per_Flight
FROM g_a.Flights F, g_a.Weather W, g_a.Airports A
WHERE W.year = F.year
AND W.month = F.month
AND W.day = F.day
AND F.origin = A.faa 
GROUP BY 1,2
ORDER BY 1 desc;
quit;
run;

proc SQL;
create table g_a.humid_and_airport as
SELECT w.humid as Humidity, A.name as Departure_Airport,
	sum(F.dep_delay) as Departure_Delay,
	sum(F.air_time) as Total_air_time,
	sum(F.dep_delay)/count(F.time_hour) as Average_Delay_per_Flight
FROM g_a.Flights F, g_a.Weather W, g_a.Airports A
WHERE W.year = F.year
AND W.month = F.month
AND W.day = F.day
AND F.origin = A.faa 
GROUP BY 1,2
ORDER BY 1 desc;
quit;
run;

proc SQL;
create table g_a.dewp_and_airport as
SELECT W.dewp as Dew_point, A.name as Departure_Airport,
	sum(F.dep_delay) as Departure_Delay,
	sum(F.air_time) as Total_air_time,
	sum(F.dep_delay)/count(F.time_hour) as Average_Delay_per_Flight
FROM g_a.Flights F, g_a.Weather W, g_a.Airports A
WHERE W.year = F.year
AND W.month = F.month
AND W.day = F.day
AND F.origin = A.faa 
GROUP BY 1,2
ORDER BY 1 desc;
quit;
run;

proc SQL;
create table g_a.temp_and_airport as
SELECT W.temp as Temperature, A.name as Departure_Airport,
	sum(F.dep_delay) as Departure_Delay,
	sum(F.air_time) as Total_air_time,
	sum(F.dep_delay)/count(F.time_hour) as Average_Delay_per_Flight
FROM g_a.Flights F, g_a.Weather W, g_a.Airports A
WHERE W.year = F.year
AND W.month = F.month
AND W.day = F.day
AND F.origin = A.faa 
GROUP BY 1,2
ORDER BY 1 desc;
quit;
run;

proc SQL;
create table g_a.pressure_and_airport as
SELECT W.pressure as Pressure, A.name as Departure_Airport,
	sum(F.dep_delay) as Departure_Delay,
	sum(F.air_time) as Total_air_time,
	sum(F.dep_delay)/count(F.time_hour) as Average_Delay_per_Flight
FROM g_a.Flights F, g_a.Weather W, g_a.Airports A
WHERE W.year = F.year
AND W.month = F.month
AND W.day = F.day
AND F.origin = A.faa 
GROUP BY 1,2
ORDER BY 1 desc;
quit;
run;

proc SQL;
create table g_a.visib_and_airport as
SELECT visib as Visbility, A.name as Departure_Airport,
	sum(F.dep_delay) as Departure_Delay,
	sum(F.air_time) as Total_air_time,
	sum(F.dep_delay)/count(F.time_hour) as Average_Delay_per_Flight
FROM g_a.Flights F, g_a.Weather W, g_a.Airports A
WHERE W.year = F.year
AND W.month = F.month
AND W.day = F.day
AND F.origin = A.faa 
GROUP BY 1,2
ORDER BY 1 desc;
quit;
run;

/*Planes*/

/*This query checks the departure delays which depends on the flight destinations*/
proc sql;
CREATE TABLE DestDelays AS
	SELECT DISTINCT F.dest, avg(dep_delay) AS DepartureDel, avg(arr_delay) AS ArrivalDel
	FROM planes_d.flights AS F 
	GROUP BY f.dest; 
	quit;
	run;

/*This query checks engine and model with assosiated delays.*/
proc sql;
CREATE TABLE Eng_Delaysv2 AS
	SELECT F.time_hour, P.model,COUNT(f.flight) AS No_OfFlights,P.seats, P.tailnum AS FlightNo, avg(P.engines) AS Avg_Engines, F.arr_delay
	FROM planes_d.planes AS P, planes_d.flights AS F
		WHERE P.tailnum=f.tailnum
	GROUP BY P.model
	ORDER BY 5 DESC;
	quit;
	run;
/* This query checks the year of manufacturing with delays. It joins two tables plane and flights using tailnumber. */
proc sql;
CREATE TABLE ManY_Delayv2 AS
	SELECT P.year,P.manufacturer,avg(F.dep_delay) AS Departure_Delay, avg(F.arr_delay) AS Arrival_Delay
	FROM planes_d.planes AS P, planes_d.flights AS F
		WHERE P.tailnum=F.tailnum
	GROUP BY P.manufacturer
	ORDER BY 3 DESC;
	quit;
	run;

/*This query checks the airline vs delays*/	
proc sql;
CREATE TABLE Airline_Arrdelay AS
	SELECT P.type, A.name, engines, model, F.origin, F.dest, count(flight) AS Number_ofFlights, avg(F.arr_delay) AS Arrival_Delay, avg(F.dep_delay) AS Departure_Delay
	FROM planes_d.planes AS P, planes_d.flights AS F, planes_d.airlines AS A
		WHERE P.tailnum=F.tailnum
		AND A.carrier=F.carrier		
	GROUP BY origin
	ORDER BY 4, 5 DESC;
	quit;
	run;
/*This query checks the speed and arrival delay and check with inner join */
proc sql;
CREATE TABLE Speed_AD AS
	SELECT DISTINCT(P.tailnum), P.type, max(P.speed) AS Speed, engines, model, avg(F.arr_delay) AS Arrival_Delay, avg(F.dep_delay) AS Departure_Delay
	FROM planes_d.planes AS P 
		INNER JOIN planes_d.flights AS F
			ON P.tailnum=F.tailnum
		INNER JOIN planes_d.airlines AS A
			ON F.carrier=A.carrier
	WHERE P.speed IS NOT NULL
	GROUP BY P.tailnum 
	ORDER BY 4 DESC, 5 DESC;
	quit;
	run;

/* This query checks how origin can impact arrival delay - origin, dest, distance, speed, delay*/
proc sql;
CREATE TABLE Ori_del AS
	SELECT P.tailnum, F.carrier, F.origin, F.dest, P.seats, F.distance, avg(F.arr_delay) AS Arrival_Delay
	FROM planes_d.planes AS P, planes_d.flights AS F
		WHERE P.tailnum=F.tailnum
	GROUP BY P.tailnum
	ORDER BY 7 DESC;
quit;
run;

/* This query checks how distance impact arrival delay - origin, dest, distance, speed, delay*/


proc sql outobs=100;
CREATE TABLE Dist_delv2 AS
	SELECT DISTINCT P.tailnum, F.carrier, F.origin, F.dest, P.seats AS total_seats, F.distance, avg(F.arr_delay) AS Arrival_Delay, avg(F.dep_delay) AS Departure_Delay
	FROM planes_d.planes AS P, planes_d.flights AS F
		WHERE P.tailnum=F.tailnum
	GROUP BY P.tailnum
	ORDER BY 7 DESC;
quit;
run;

/* This query checks the days which get delayed the most. Relationship between departure and arrival delays */
proc sql;
CREATE TABLE Delay_day AS
	SELECT F.time_hour, F.origin, F.dest, P.seats, F.distance, F.arr_delay, F.dep_delay 
	FROM planes_d.planes AS P, planes_d.flights AS F
		WHERE P.tailnum=F.tailnum
		AND F.arr_delay IS NOT NULL
		AND F.arr_delay > 0
GROUP BY F.dest
ORDER BY 8 DESC;
quit;
run;

/*dept delay per hour*/
PROC SQL;
CREATE TABLE M AS
SELECT DISTINCT dest
	FROM g_a.flights 

;
QUIT;
/*added avg delay per model*/
proc sql;
CREATE TABLE R4 AS
SELECT model, AVG(dep_delay) as delay
    FROM g_a.F_W_P_A_AR4
    GROUP BY model
    ORDER BY 2 DESC
;
quit;
/*dept delay per hour*/
PROC SQL;
CREATE TABLE bbB AS
SELECT dest, hour, AVG(dep_delay) as avg_del
	FROM g_a.flights 
	GROUP BY dest
	ORDER BY  avg_del DESC
;
QUIT;

/*dept delay per hour*/
PROC SQL;
CREATE TABLE g_a.delay_hour AS
SELECT hour, AVG(dep_delay) as avg_del
	FROM g_a.flights 
	GROUP BY hour
	ORDER BY  avg_del DESC
;
QUIT;
/****************************************************/
/*nex table flights per month and delays*/
PROC SQL;
CREATE TABLE g_a.month_nbrFlights_arravg_deptavg AS
SELECT dn.month, dn.nbr_flight, ad.arr_avg_del as arr_avg_del, avg_del as dep_avg_del
	FROM dep_nbr_flights_month as dn, dep_avg_flights_months as dd, arr_avg_flights_months as ad
	WHERE dn.month = dd.month
		AND ad.month = dd.month
	ORDER BY dep_avg_del DESC
;
/****************************************************/
QUIT;


/*Flights per month*/
PROC SQL;
CREATE TABLE dep_nbr_flights_month AS
SELECT month, COUNT(flight) as nbr_flight
	FROM g_a.flights 
	GROUP BY month
	ORDER BY nbr_flight DESC
;
QUIT;
/*dept delay per month*/
PROC SQL;
CREATE TABLE dep_avg_flights_months AS
SELECT month, AVG(dep_delay) as avg_del
	FROM g_a.flights 
	GROUP BY month
	ORDER BY  avg_del DESC
;
QUIT;
/*arr delay per month*/
PROC SQL;
CREATE TABLE arr_avg_flights_months AS
SELECT month, AVG(arr_time) as arr_avg_del
	FROM g_a.flights 
	GROUP BY month
	ORDER BY  arr_avg_del DESC
;
QUIT;
/****************************************************/
/*new table nbr flight day and avg delay per day*/
PROC SQL;
CREATE TABLE g_a.avgde_dept_arr_nbrFlights_day AS
SELECT f.month, f.Day, f.nbr_flight, wd.avg_del as avg_del_dept, a.avg_del as arr_avgdel
	FROM work.dep_nbr_flights_day AS f, work.Worst_Day_Tra_dep as wd, arr_Worst_Day_Tra AS a
	WHERE f.month = wd.month 
		AND wd.month = a.month
		and f.day = wd.day
		And wd.day = a.day
	ORDER BY avg_del_dept DESC
;
/****************************************************/
QUIT;


/*Flights per day*/
PROC SQL;
CREATE TABLE dep_nbr_flights_day AS
SELECT month, day, COUNT(flight) as nbr_flight
	FROM g_a.flights 
	GROUP BY month, day
	ORDER BY nbr_flight DESC
;
QUIT;

/*Worst day to travel dept_del*/
PROC SQL;
CREATE TABLE Worst_Day_Tra_dep AS
SELECT month, day, AVG(dep_delay) as avg_del 
	FROM g_a.flights 
	GROUP BY month, day
	ORDER BY  avg_del DESC
;
QUIT;
/*Worst day to travel arr_del*/
PROC SQL;
CREATE TABLE arr_Worst_Day_Tra AS
SELECT month, day, AVG(arr_time) as avg_del 
	FROM g_a.flights 
	GROUP BY month, day
	ORDER BY  avg_del DESC
;
QUIT;

/*year of the most important*/
PROC SQL;
CREATE TABLE ho AS
SELECT hour, sum(dep_delay)+sum(arr_delay) as Delay, origin, count(origin) as nbr_fli
	FROM g_a.flights
	WHERE dep_delay > 0
		AND arr_delay > 0
	GROUP BY hour, origin
	ORDER BY 2 DESC
;
QUIT;
/*year of the most important*/
PROC SQL;
CREATE TABLE macesas AS
SELECT month, day, sum(dep_delay)+sum(arr_delay) as Delay
	FROM g_a.flights
	WHERE dep_delay > 0
		AND arr_delay > 0
	GROUP BY month, day 
	ORDER BY 3 DESC
;
QUIT;
PROC SQL;
CREATE TABLE g_a.bbac AS
SELECT year, sum(delay) as delay, model, count(model) as nbr_model
	FROM new 
	GROUP BY year, manufacturer, model
	ORDER BY year DESC 
;
QUIT;
/*************************FINAL TABLEEEEEEEEEEEEEEE**************************/
/*year of the most important tailnum sum plus manu plus nbr of plains plus model plus engine and seats*/
/* First sight there is not relationship with the engine. EMBALER Looks like they have a big problem. There might be relationships with the seats.*/

PROC SQL;
CREATE TABLE g_a.y_delsum_man_nbr_mod_en_seats AS
SELECT year, sum(delay) as delay, manufacturer, count(manufacturer) as nbr_plains, model, engine, seats
	FROM new 
	GROUP BY year, manufacturer, model, engine, seats
	ORDER BY delay DESC 
;
QUIT;
/*year sum plus manu plus nbr of plains plus model*/

PROC SQL;
CREATE TABLE ysum_man_nbr_mod AS
SELECT year, sum(delay) as delay, manufacturer, count(manufacturer) as nbr_plains, model
	FROM new 
	GROUP BY year, manufacturer, model
	ORDER BY delay DESC 
;
QUIT;


/*year sum plus manu plus nbr of plains*/

PROC SQL;
CREATE TABLE yearsum_manu_cou AS
SELECT year, sum(delay) as delay, manufacturer, count(manufacturer) as nbr_plains
	FROM new 
	GROUP BY year, manufacturer
	ORDER BY delay DESC 
;
QUIT;

/*HOW MANY planes per manufacturer*/
PROC SQL;
CREATE TABLE cou_manu AS
SELECT year, manufacturer, count(manufacturer)
	FROM new 
	GROUP BY manufacturer, year
	ORDER BY YEAR
;
QUIT;

/*count manu*/
PROC SQL;
CREATE TABLE count_ma AS
SELECT manufacturer, count(manufacturer)
	FROM yearsum_manu
	GROUP BY manufacturer
	ORDER BY 2 DESC
;
QUIT;
/*year sum plus manu*/

PROC SQL;
CREATE TABLE yearsum_manu AS
SELECT year, sum(delay) as delay, manufacturer 
	FROM new 
	GROUP BY year, manufacturer
	ORDER BY year DESC 
;
QUIT;

/*Here is the match of top 20%(dep_delay and arr_delay) of Tailnum with planes table and group by year
Huge change in row 25 1998, almoste double*/
PROC SQL;
CREATE TABLE yearsum AS
SELECT year, sum(delay) as delay 
	FROM new 
	GROUP BY year
	ORDER BY delay DESC 
;
QUIT;


/* tail10 y planes*/
PROC SQL;
CREATE TABLE new AS
SELECT p.tailnum, p.year, p.type, p.manufacturer, p.model, p.engines, p.seats, p.speed, p.engine, f.delay
	FROM work.top10_tail2 as f, g_a.planes as p
	WHERE f.tailnum = p.tailnum
	ORDER BY f.delay DESC
;
QUIT;


/* join tot_tnum_ori y top10_tail*/
PROC SQL;
CREATE TABLE j_time AS
SELECT j.origin, j.tailnum, f.time_hour, f.month
	FROM join_tottail_delay_origin as j, g_a.flights as f
	WHERE j.tailnum = f.tailnum 
;
QUIT;
/* join tot_tnum_ori y top10_tail*/
PROC SQL;
CREATE TABLE g_a.f_p AS
SELECT p.year, p.engine, p.manufacturer, p.model, p.engines, p.seats, p.engine, f.delay
	FROM g_a.flights as f, g_a.planes as p
	WHERE f.tailnum = p.tailnum 
;
QUIT;
/* join tot_tnum_ori y top10_tail*/
PROC SQL;
CREATE TABLE join_tottail_delay_origin AS
SELECT t.origin, t.tailnum
	FROM work.tot_tnum_ori as t, top10_tail as t10
	WHERE t.tailnum = t10.tailnum 
;
QUIT;
/* total number of tailnumber per origin*/
PROC SQL ;

SELECT count(DISTINCT tailnum) as tottail
	FROM g_a.flights 
;
QUIT;
/* total number of tailnumber per origin*/
PROC SQL;
CREATE TABLE tot_tnum_ori AS
SELECT origin, tailnum, count(tailnum) as tottail
	FROM g_a.flights 
	GROUP BY tailnum, origin 
	ORDER BY origin, 3 DESC
;
QUIT;

/*EWR es el que mas delay tiene con 42%, JFK with 32% and LGA with 25%*/

/*total delays per airport*/
PROC SQL;
CREATE TABLE total_del_air AS
SELECT Origin, sum(dep_delay) as Delay, sum(dep_delay)/(SELECT SUM(dep_delay) FROM g_a.flights)
	FROM g_a.flights
	GROUP BY origin
	ORDER BY 2 DESC
;
QUIT;
/*10% of lfights*/
PROC SQL ;
CREATE TABLE f2 AS
SELECT 0.10*count(DISTINCT flight) 
	FROM g_a.flights
;
QUIT;
/*Count Flights*/
PROC SQL ;
CREATE TABLE flights_dep_delay_ok2 AS
SELECT count(flight) 
	FROM g_a.flights
;
QUIT;
/*out of the top 10% of much represents each airport */
PROC SQL;
CREATE TABLE countabc AS
SELECT origin, count(origin),count(origin)/384
	FROM work.f_o3
	GROUP BY origin
	ORDER BY 1 DESC
;
QUIT;
PROC SQL;
CREATE TABLE b AS
select count(origin)
	FROM work.f_o3

;
QUIT;
/*I added the origin and group by by origin to see the flights that get delay the most by origin*/

/*f 10% plus origin*/
PROC SQL outobs = 384;
CREATE TABLE f_o3 AS
SELECT flight, sum(dep_delay) as Delay, origin
	FROM g_a.flights
	GROUP BY flight, origin 
	ORDER BY 2 DESC
;
QUIT;

/*NO RELATIONSHIP FLIGHTS AND TAILNUM. MANY TAILNUM CAN DO THE SAME FLIGHT

/*f 10% plus origin*/
PROC SQL outobs = 384;
CREATE TABLE f_o4 AS
SELECT flight, sum(dep_delay) as Delay, origin, 
	FROM g_a.flights
	GROUP BY flight, origin 
	ORDER BY 2 DESC
;
QUIT;
/*flights-delay top 10%*/
PROC SQL outobs = 384;
CREATE TABLE fl AS
SELECT flight, sum(dep_delay) as Delay
	FROM g_a.flights
	GROUP BY flight
	ORDER BY 2 DESC
;
QUIT;

/*Carrier-delay top 5*/
PROC SQL outobs = 5;
CREATE TABLE Carri_dep_delay_ok AS
SELECT carrier, sum(dep_delay) as Delay
	FROM g_a.flights
	GROUP BY carrier
	ORDER BY 2 DESC
;
QUIT;
/* 10% of tailnum*/
PROC SQL;
SELECT 0.10*count(DISTINCT tailnum)
	FROM g_a.flights
;
QUIT;
RUN;
/* STARTS FROM HERE tailnum-delay top 10%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
PROC SQL outobs  = 808;
CREATE TABLE top10_tail2 AS
SELECT tailnum, sum(dep_delay) as Dep_Delay 
	FROM g_a.flights
	WHERE dep_delay > 0
	GROUP BY tailnum
	ORDER BY 2 DESC
;
/* STARTS FROM HERE tailnum-delay top 10%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
QUIT;
/*Origin-delay top 20*/
PROC SQL ;
CREATE TABLE g_a.origin_dep_delay_ok AS
SELECT origin, sum(dep_delay) as Delay
	FROM g_a.flights
	GROUP BY origin
	ORDER BY 2 DESC
;
QUIT;

/*Destin-delay top 20*/
PROC SQL outobs = 20;
CREATE TABLE g_a.dest_dep_delay_ok AS
SELECT dest, sum(dep_delay) as Delay
	FROM g_a.flights
	GROUP BY dest
	ORDER BY 2 DESC
;
QUIT;

/*distance-delay top 20*/
PROC SQL outobs = 20;
CREATE TABLE g_a.dist_dep_delay_ok AS
SELECT distance, sum(dep_delay) as Delay
	FROM g_a.flights
	GROUP BY distance
	ORDER BY 2 DESC
;
QUIT;

/*hour-delay top 20*/
PROC SQL outobs = 20;
CREATE TABLE g_a.hour_dep_delay_ok AS
SELECT hour, sum(dep_delay) as Delay
	FROM g_a.flights
	GROUP BY hour
	ORDER BY 2 DESC
;
QUIT;

/*month-delay top 20*/
PROC SQL outobs = 5;
CREATE TABLE m AS 
SELECT month, sum(dep_delay) as Delay
	FROM g_a.flights
	GROUP BY month
	ORDER BY 2 DESC
;
QUIT;

/*Left join carri & tail*/
PROC SQL;
CREATE TABLE merge AS 
SELECT f.carrier, c.delay, f.month, f, tailnum
	FROM g_a.flights as f LEFT OUTER JOIN g_a.Carri_dep_delay_ok as c
	ON c.carrier = f.carrier
;
QUIT;

PROC SQL;
CREATE TABLE F_W3 AS 
SELECT f.carrier, f.month, f.tailnum, f.dep_delay, f.arr_time, f.flight, f.origin, f.dest, f.distance, f.time_hour, w.temp, w.dewp, w.humid, w.wind_dir, w.wind_speed, w.wind_gust, w.precip
	FROM g_a.flights as f, g_a.weather as w
	WHERE f.time_hour = w.time_hour
;
QUIT;

PROC SQL;

CREATE TABLE F_P AS
SELECT f.carrier, f.month, f.tailnum, f.dep_delay, f.arr_time, f.flight, f.origin, f.dest, f.distance, f.time_hour, p.type, p.manufacturer, p.model, p.engines, p.seats, p.engine
	FROM g_a.flights as f, g_a.planes as p
	WHERE f.tailnum = p.tailnum
;
QUIT;
RUN;

PROC SQL;
CREATE TABLE rrrrrr AS 
SELECT f.carrier, f.month, f.tailnum, f.dep_delay, f.arr_delay, f.flight, f.origin, f.dest, f.distance, f.time_hour, f.air_time,  w.temp, w.dewp, w.humid, w.wind_dir, w.wind_speed, w.wind_gust, 
w.precip, w.pressure, w.visib, p.type, p.manufacturer, p.model, p.engines, p.seats, p.engine, a.name AS airline_name,
ar.name AS airport_name, ar.lat AS Latitude, ar.lon AS Longitude, ar.alt AS Airport_Altitude, p.year as year_manu, f.hour,put(f.Month, 15.) || put(f.Day, 15.) as monthday, case when f.month = 1 then 'Jan' 
																																 when f.month = 2 then 'Feb'
																																 when f.month = 3 then 'Mar'
																																 when f.month = 4 then 'Apr'
																																 when f.month = 5 then 'May'
																																 when f.month = 6 then 'Jun'
																																 when f.month = 7 then 'Jul'
																																 when f.month = 8 then 'Ago'
																																 when f.month = 9 then 'Sept'
																																 when f.month = 10 then 'Oct'
																																 when f.month = 11 then 'Nov'
																																 when f.month = 12 then 'Dic'

																																	end as month_name
	FROM g_a.flights AS f, g_a.weather AS w, g_a.planes AS p, g_a.airlines AS a, g_a.airports AS ar
	WHERE f.time_hour = w.time_hour
		AND f.dep_delay > 0
		AND f.arr_delay > 0
	AND f.tailnum = p.tailnum
	AND f.carrier = a.carrier
	AND f.origin = ar.faa /*not matched to destination*/
;
QUIT;
RUN;
/* delay per model higher than avg */
proc sql;
CREATE TABLE R4 AS 
SELECT DISTINCT model, AVG(dep_delay) as delay, engine, type, seats
	FROM g_a.F_W_P_A_AR4
	WHERE dep_delay > 13.931755993
	GROUP BY model
	ORDER BY 2 DESC
;
quit;
/* avg delay model */
proc sql;
CREATE TABLE R5 AS 
SELECT AVG(delay)
	FROM R4
;
quit;





