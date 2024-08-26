-- Create

create table countries(
  id_country SERIAL PRIMARY KEY,
  name varchar(50) not null  
);

create table users(
 id_users SERIAL PRIMARY KEY,
 id_country integer not null,
 email varchar(100) not null,
 name varchar (50) not null,
 foreign key (id_country) REFERENCES countries (id_country)   
);
