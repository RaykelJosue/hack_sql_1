-- Insertar en countries
INSERT INTO countries (id_country, name) VALUES 
	(1, 'Estados Unidos'), (2, 'Canadá'), (3, 'Venezuela'), 
	(4, 'Argentina'), (5, 'Brasil');

-- Insertar en contact_request
INSERT INTO priorities 
	(id_priority, type_name) VALUES (1, 'Alto'), (2, 'Medio'), (3, 'Bajo');

-- Insertar registros en contact_request
INSERT INTO contact_request (
	id_email, id_country, id_priority, name, detail, physical_address)
VALUES 
	('raykel@gmail.com', 1, 1, 'Raykel Quevedo', 'Alto', 'Venezuela'),
	
  ('johnwick@gmail.com', 2, 2, 'John Wick', 'Medio', 'Estados Unidos'),
  
	('josue@hotmail.com', 3, 3, 'Josue Bastidas', 'Bajo', 'Brasil');

-- Eliminar el último registro en contact_request
DELETE FROM contact_request
WHERE
  id_email = 'josue@hotmail.com';

-- Actualizar el primer registro en contact_request
UPDATE contact_request
SET
  name = 'Josue Bastidas',
  detail = 'Medio'
WHERE
  id_email = 'raykel@gmail.com';


SELECT * FROM contact_request; -- Para realizar la consulta.