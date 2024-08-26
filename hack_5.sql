-- Creando las tablas

create table countries (
  id_country bigint primary key generated always as identity,
  name text not null
);

create table roles (
  id_role bigint primary key generated always as identity,
  name text not null
);

create table taxes (
  id_tax bigint primary key generated always as identity,
  percentage numeric(5, 2) not null
);

create table offers (
  id_offer bigint primary key generated always as identity,
  status text not null
);

create table discounts (
  id_discount bigint primary key generated always as identity,
  status text not null,
  percentage numeric(5, 2) not null
);

create table payments (
  id_payment bigint primary key generated always as identity,
  type text not null
);

create table customers (
  email text primary key,
  id_country bigint references countries (id_country),
  id_role bigint references roles (id_role),
  name text not null,
  age int not null,
  password text not null,
  physical_address text
);

create table invoice_status (
  id_invoice_status bigint primary key generated always as identity,
  status text not null
);

create table products (
  id_product bigint primary key generated always as identity,
  id_discount bigint references discounts (id_discount),
  id_offer bigint references offers (id_offer),
  id_tax bigint references taxes (id_tax),
  name text not null,
  details text,
  minimum_stock int,
  maximum_stock int,
  current_stock int,
  price numeric(10, 2) not null,
  price_with_tax numeric(10, 2)
);

create table products_customers (
  id_product bigint references products (id_product),
  id_customer text references customers (email),
  primary key (id_product, id_customer)
);

create table invoices (
  id_invoice bigint primary key generated always as identity,
  id_customer text references customers (email),
  id_payment bigint references payments (id_payment),
  id_invoice_status bigint references invoice_status (id_invoice_status),
  date timestamp not null,
  total_to_pay numeric(10, 2) not null
);

create table orders (
  id_order bigint primary key generated always as identity,
  id_invoice bigint references invoices (id_invoice),
  id_product bigint references products (id_product),
  detail text,
  amount int not null,
  price numeric(10, 2) not null
);