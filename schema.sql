/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg INT NOT NULL,
    species VARCHAR(100) NOT NULL );

ALTER TABLE animals ADD COLUMN species VARCHAR(100);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    age INT );
    
CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL );

ALTER TABLE animals
    DROP COLUMN species,
    ADD COLUMN species_id INT REFERENCES species(id),
    ADD COLUMN owner_id INT REFERENCES owners(id);
