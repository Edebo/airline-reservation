CREATE DATABASE airlineReservation;
USE airlineReservation;

/*** CREATE CUSTOMER TABLE****/
CREATE TABLE IF NOT EXISTS customers(
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name varchar(32) NOT NULL,
    last_name varchar(32) NOT NULL,
    phone_number varchar(20) NOT NULL UNIQUE,
    email varchar(32) NOT NULL UNIQUE,
    username varchar(32) NOT NULL,
    password varchar(32) NOT NULL,
    created_at timestamp
);


/*** CREATE AIRLINE TABLE****/
CREATE TABLE IF NOT EXISTS airlines(
	id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(32) NOT NULL,
    phone_number varchar(20),
   	airline_code varchar(20) unique
);

/*** CREATE FLIGHT TABLE****/
CREATE TABLE IF NOT EXISTS flights(
    id int AUTO_INCREMENT PRIMARY KEY,
    flight_number int not null,
    destination varchar(32) NOT NULL,
    departure varchar(32) NOT NULL,
    departure_time time not null,
    arrival_time time not null,
    arrival_date date not null,
    airline_id int NOT NULL,
    FOREIGN key (airline_id) REFERENCES airlines(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

/*** CREATE airports TABLE****/
CREATE TABLE IF NOT EXISTS airports (
    id int not null primary key,
    IATA_code varchar(30) not null unique,
    name varchar(20) not null,
    city varchar(20) not null,
    country varchar(20) not null
);

/*** CREATE airports TABLE****/
CREATE TABLE airplanes( 
	id int AUTO_INCREMENT PRIMARY key,
 	reg_no varchar(20) not null UNIQUE,
 	number_of_seat int not null, 
	plane_number varchar(20) not null, 
	type varchar(20), 	
	airline_id int not null,
	FOREIGN key(airline_id) REFERENCES airlines(id) ON DELETE CASCADE ON UPDATE CASCADE );

/*** CREATE land-on TABLE****/
create table if not exists land_on(
	id int not null primary key,
    airplane_id int not null,
    airline_id int not null,
    FOREIGN key(airline_id) REFERENCES airlines(id),
    FOREIGN key(airplane_id) REFERENCES airplanes(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

/*** CREATE land-on TABLE****/
create table if not exists tickets(
	id int not null AUTO_INCREMENT PRIMARY key,
    type varchar(20) not null,
    seat_number varchar(10),
    price decimal(12,2)
);

/*** CREATE booked_flight TABLE****/
create table if not exists booked_flight(
    id int not null AUTO_INCREMENT PRIMARY key,
    flight_id  int not null,
    ticket_id int not null,
    FOREIGN key(ticket_id) REFERENCES tickets(id),
    FOREIGN key(flight_id) REFERENCES flights(id)
);

/*** CREATE payments TABLE****/
create table if not exists payments(
    id int not null AUTO_INCREMENT PRIMARY key,
    customer_id  int not null,
    ticket_id int not null,
    FOREIGN key(ticket_id) REFERENCES tickets(id),
    FOREIGN key(customer_id) REFERENCES customers(id)
);
