DROP TABLE owners;
DROP TABLE animals;

CREATE TABLE owners
(
  id SERIAL primary key,
  first_name VARCHAR(255),
  second_name VARCHAR(255),
  dob VARCHAR(255),
  address VARCHAR(255),
  city VARCHAR(255),
  post_code VARCHAR(255),
  email_address VARCHAR(255),
  phone_number INT
);

CREATE TABLE animals
(
  id SERIAL primary key,
  name VARCHAR(255),
  age INT,
  species VARCHAR(255),
  breed VARCHAR(255),
  adopt_status BOOLEAN
);
