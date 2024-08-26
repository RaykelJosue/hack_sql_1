-- Insert 3 records into each table
-- Insert into countries
insert into
  countries (name)
values
  ('Estados Unidos'),
  ('Canadá'),
  ('México');


SELECT * FROM customers; -- Para realizar consulta desde customers.

-- Insert into roles
insert into
  roles (name)
values
  ('Admin'),
  ('User'),
  ('Guest');

-- Insert into taxes
insert into
  taxes (percentage)
values
  (5.00),
  (10.00),
  (15.00);

-- Insert into offers
insert into
  offers (status)
values
  ('Activo'),
  ('Inactivo'),
  ('Expirado');

-- Insert into discounts
insert into
  discounts (status, percentage)
values
  ('Activo', 10.00),
  ('Inactivo', 5.00),
  ('Expirado', 20.00);

-- Insert into payments
insert into
  payments (type)
values
  ('Tarjeta de Crédito'),
  ('Binance'),
  ('Transferencia Bancaria');

-- Insert into customers
insert into
  customers (
    email,
    id_country,
    id_role,
    name,
    age,
    password,
    physical_address
  )
values
  (
    'raykel@gmail.com',
    1,
    1,
    'Raykel Quevedo',
    20,
    '********',
    'Estados Unidos'
  ),
  (
    'johnwick@gmail.com',
    2,
    2,
    'John Wick',
    40,
    '********',
    'Canadá'
  ),
  (
    'josue@hotmail.com',
    3,
    3,
    'Josue Bastidas',
    25,
    '********',
    'México'
  );

-- Insert into invoice_status
insert into
  invoice_status (status)
values
  ('Pago'),
  ('Pendiente'),
  ('Cancelado');

-- Insert into products
insert into
  products (
    id_discount,
    id_offer,
    id_tax,
    name,
    details,
    minimum_stock,
    maximum_stock,
    current_stock,
    price,
    price_with_tax
  )
values
  (
    1,
    1,
    1,
    'Harina PAN',
    'Harina de maíz para hacer arepas, empanadas, vollito con queso, etc.',
    10,
    100,
    50,
    20.00,
    21.00
  ),
  (
    2,
    2,
    2,
    'Pasta',
    'Producto hecho en Venezuela para que puedas hacer tu almuerzo',
    5,
    50,
    25,
    30.00,
    33.00
  ),
  (
    3,
    3,
    3,
    'Flips',
    'Golosina hecha en base a cereal para que comas de merienda.',
    15,
    150,
    75,
    40.00,
    46.00
  );

-- Insert into products_customers
insert into
  products_customers (id_product, id_customer)
values
  (1, 'raykel@gmail.com'),
  (2, 'johnwick@gmail.com'),
  (3, 'josue@hotmail.com');

-- Insert into invoices
insert into
  invoices (
    id_customer,
    id_payment,
    id_invoice_status,
    date,
    total_to_pay
  )
values
  (
    'raykel@gmail.com',
    1,
    1,
    '2023-10-01',
    100.00
  ),
  (
    'johnwick@gmail.com',
    2,
    2,
    '2023-10-02',
    200.00
  ),
  (
    'josue@hotmail.com',
    3,
    3,
    '2023-10-03',
    300.00
  );

-- Insert into orders
insert into
  orders (id_invoice, id_product, detail, amount, price)
values
  (1, 1, 'Harina PAN', 2, 40.00),
  (2, 2, 'Pasta', 1, 30.00),
  (3, 3, 'Flips', 3, 120.00);

-- Delete the first user

-- Verificando las facturas asociadas con ese id_customer
SELECT id_invoice FROM invoices WHERE id_customer = (SELECT id_customer FROM customers WHERE email = 'raykel@gmail.com');

-- Verificando las órdenes asociadas con esas facturas
SELECT * FROM orders WHERE id_invoice IN (SELECT id_invoice FROM invoices WHERE id_customer = (SELECT id_customer FROM customers WHERE email = 'raykel@gmail.com'));

-- Luego de la verificación, se procede a eliminar el usuario desde email.
DELETE FROM orders
WHERE id_invoice IN (
    SELECT id_invoice
    FROM invoices
    WHERE id_customer = (SELECT id_customer FROM customers WHERE email = 'raykel@gmail.com')
);

-- Eliminando al primer usuario
DELETE FROM customers
WHERE email = 'raykel@gmail.com';


-- Update the last user
update customers
set
  name = 'Rocky Balboa',
  age = 60,
  email = 'rockybalboa@outlook.com'
where
  email = 'johnwick@gmail.com';

-- Update all taxes
update taxes
set
  percentage = percentage + 1.00;

-- Update all prices
update products
set
  price = price * 1.10,
  price_with_tax = price_with_tax * 1.10;