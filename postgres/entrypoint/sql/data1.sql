CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
);

INSERT INTO customers (name, email) VALUES 
('Cliente 1', 'cliente1@email.com'), 
('Cliente 2', 'cliente2@email.com');
