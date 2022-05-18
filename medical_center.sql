DROP DATABASE IF EXISTS  medical_center;
CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE roles
(
  id SERIAL PRIMARY KEY,
  patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
  doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
  date_of_visit DATE NOT NULL,
  disease TEXT
);