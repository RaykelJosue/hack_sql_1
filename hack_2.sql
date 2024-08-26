-- Create

INSERT INTO countries (name) VALUES ('Argentina') , ('Colombia'),('Chile');
SELECT * FROM countries;


-- Insert

INSERT INTO users (id_country, email, name) 
  VALUES (2, 'foo@foo.com', 'fooziman'), (3, 'bar@bar.com', 'barziman');
SELECT * FROM users;

-- Delete

DELETE FROM users WHERE email = 'bar@bar.com';


-- Update

UPDATE users SET email = 'foo@foo.foo', name = 'fooz' where id_users = 1;
SELECT * FROM users;

-- Select
SELECT * FROM users INNER JOIN countries ON users.id_country = countries.id_country;

SELECT u.id_users as id, u.email, u.name as fullname, c.name 
  FROM users u INNER JOIN countries c on u.id_country = c.id_country;