#!/bin/bash
createdb salon_scheduler
psql -d salon_scheduler

#Table for appointments
CREATE TABLE appointments (
    id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    appointment_date TIMESTAMP NOT NULL
);

\q
