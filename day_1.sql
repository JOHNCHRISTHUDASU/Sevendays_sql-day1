

CREATE DATABASE sql7challenge;
USE sql7challenge;


-- 1. Customers table

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    signup_date DATE NOT NULL,
    segment VARCHAR(20) NOT NULL
);


-- 2. Products table

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(40),
    category VARCHAR(40),
    price DECIMAL(10,2),
    cost DECIMAL(10,2)
);


-- 3. Orders table

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(20),
    channel VARCHAR(20),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


-- 4. Order items table

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);


-- 5. Payments table

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT UNIQUE,
    payment_method VARCHAR(40),
    payment_status VARCHAR(20),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);


-- 6. Deliveries table

CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT UNIQUE,
    dispatch_date DATE,
    delivery_date DATE NULL,
    delivery_status VARCHAR(40),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);


