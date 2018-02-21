DROP TABLE IF EXISTS adoptions;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS animals;


CREATE TABLE animals
(
  id SERIAL primary key,
  name VARCHAR(255),
  age INT,
  type VARCHAR(255),
  breed VARCHAR(255),
  adopt_status BOOLEAN,
  admittion_date VARCHAR(255)
);

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
  phone_number VARCHAR(255)
);

CREATE TABLE adoptions
(
  id SERIAL8 primary key,
  animal_id INT references animals(id) ON DELETE CASCADE,
  owner_id INT references owners(id) ON DELETE CASCADE
);
