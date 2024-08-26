/*
	design contact database

tables:
- table countries
- table priorities
- table contact_request

*/


CREATE TABLE countries (
    id_country INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE priorities (
    id_priority INT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL
);

CREATE TABLE contact_request (
    id_email VARCHAR(50) PRIMARY KEY,
    id_country INT,
    id_priority INT,
    name VARCHAR(100),
    detail TEXT,
    physical_address VARCHAR(100),
    FOREIGN KEY (id_country) REFERENCES countries(id_country),
    FOREIGN KEY (id_priority) REFERENCES priorities(id_priority)
);
