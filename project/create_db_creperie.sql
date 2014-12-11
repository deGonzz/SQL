-- ********************************
-- SCRIPT FOR THE CREPERIE DATABASE
-- ********************************

-- create the database
DROP DATABASE IF EXISTS creperie;
CREATE DATABASE creperie;

-- select the database
USE creperie;

-- creating tables:
CREATE TABLE customers
(
    -- FD customer_id functionally determines address/name/phone
    customer_id INT NOT NULL,
    payment_method_code INT REFERENCES ref_payment_methods(payment_method_code),
    customer_address_id INT REFERENCES addresses(address_id),
    customer_name VARCHAR(50) NOT NULL,
    customer_phone VARCHAR(50) NOT NULL,
    PRIMARY KEY (customer_id)
);

INSERT INTO customers VALUES
(22, 1, 10, 'Lizette Bouddhou', '734-987-0943'),
(23, 2, 11, 'Julie Jones', '323-135-8640'),
(24, 2, 12, 'Kevin Ox', '123-092-3202'),
(25, 1, 13, 'John Locke', '434-321-8765'),
(26, 3, 14, 'Ana Lucia', '222-555-5555');



CREATE TABLE ref_payment_methods
(
    -- payment_method_code functionally determines type
    payment_method_code INT NOT NULL,
    payment_method_type TEXT,
    PRIMARY KEY (payment_method_code)
);

INSERT INTO ref_payment_methods VALUES
(1 , 'CREDIT'),
(2 , 'DEBIT'),
(3 , 'CASH');

CREATE TABLE addresses
(
    -- address_id functionally determines city, zip, state
    address_id INT NOT NULL,
    city VARCHAR(20),
    zip VARCHAR(20),
    state VARCHAR(20),
    PRIMARY KEY (address_id)
);
INSERT INTO addresses VALUES
(1, 'Brooklyn', '11201', 'NY'),
(2, 'Brooklyn', '11201', 'NY'),
(3, 'Brooklyn', '11202', 'NY'),
(4, 'Queens', '11385', 'NY'),
(5, 'Brooklyn', '11202', 'NY'),
(6, 'Brooklyn', '11202', 'NY'),
(7, 'Brooklyn', '11203', 'NY'),
(8, 'Brooklyn', '11203', 'NY'),
(9, 'Brooklyn', '11203', 'NY'),
(10, 'Queens', '11385', 'NY'),
(11, 'Queens', '11385', 'NY'),
(12, 'Queens', '11434', 'NY'),
(13, 'Queens', '11434', 'NY'),
(14, 'Queens', '11434', 'NY');

CREATE TABLE zip_codes
(
    -- zip functionally determines state
    zip VARCHAR(20),
    state VARCHAR(20),
    city VARCHAR (20),
    PRIMARY KEY (zip)
);
INSERT INTO zip VALUES
('11201', 'Brooklyn', 'NY')
('11202', 'Brooklyn', 'NY')
('11203', 'Brooklyn', 'NY')
('11385', 'Brooklyn', 'NY')
('11434', 'Queens', 'NY')








CREATE TABLE employees
(
    -- employee_id functionally determines address, name, phone
    employee_id INT NOT NULL,
    employee_address_id INT REFERENCES addresses(employee_address_id),
    employee_name VARCHAR(50),
    employee_phone VARCHAR(50),
    PRIMARY KEY (employee_id)
);
INSERT INTO employees VALUES
(1, 1, 'Jack Shephard',      '734-324-2356'),
(2, 2, 'Hugo Reyes',   '789-456-2333'),
(3, 3, 'Ranma Vincent',   '428-333-6789'),
(4, 4, 'Bunny Riviere',  '202-456-3528'),
(5, 5, 'Ross Geller', '904-332-4456'),
(6, 6, 'Rachel Green','340-284-1294'),
(7, 7, 'John Locke',   '243-099-3235'),
(8, 8, 'Hajime Kindaichi', '111-674-9840'),
(9, 9, 'Tenchi Muyo',    '291-321-3245');


CREATE TABLE cars
(
    -- car_id functionally determines license_number
    car_id INT REFERENCES car_types(car_type_code),
    car_license_number VARCHAR(20),
    PRIMARY KEY (car_id)
);
INSERT INTO cars VALUES
(1, '123-ABC'),
(2, '456-DEF'),
(3, '789-GHI');



CREATE TABLE car_types
(
    -- car_id functionally determines license_number
    car_type_code INT NOT NULL,
    car_type_description TEXT,
    PRIMARY KEY (car_type_code)
);
INSERT INTO car_types VALUES
(1, '2015 Toyota Land Cruiser'),
(2, '2007 BMW 128i'),
(3, '2003 RENAULT Twingo');


CREATE TABLE suppliers
(
    -- supplier_id functionally determines supplier_address_id 
    supplier_id INT, NOT NULL 
    supplier_address_id INT, REFERENCES addresses(supplier_address_id)
    supplier_name VARCHAR(50), NOT NULL
    supplier_phone VARCHAR(50), NOT NULL
    PRIMARY KEY (supplier_id)
);


CREATE TABLE orders
(
    -- order_id functionally determines everything 
    order_id INT NOT NULL REFERENCES crepes_ordered(order_id),
    customer_id INT NOT NULL  REFERENCES addresses(customer_id),
    delivered_by_employee_id INT NOT NULL REFERENCES employees(employee_id),
    car_id INT NOT NULL REFERENCES cars(car_id),
    total_order_price DECIMAL(2,2) NOT NULL,
    PRIMARY KEY (order_id)
);
INSERT INTO orders VALUES
(1, 11, 1, 1, '3,65'),
(2, 14, 5, 1, '3.65'),
(3, 12, 8, 2, '5.45'),
(4, 13, 6, 3, '4.35'),
(5, 10, 7, 2, '3.65');


-- MVD - table's only pk is all 3 attributes.
CREATE TABLE employee_delivery_area
(
    delivered_by_employee VARCHAR(50),
    crepe_type VARCHAR(20),
    area VARCHAR(20)
);
INSERT INTO employee_delivery_area VALUES
('John Locke', 'Butter', 'Brooklyn'),
('John Locke', 'Cheese', 'Queens'),
('Ranma Vincent', 'Strawnerries', 'Queens'),
('Jack Shephard', 'Sugar', 'Queens');

CREATE TABLE crepes_ordered
(
    order_id INT NOT NULL,
    crepe_id INT NOT NULL REFERENCES ref_base_types(crepe_id),
    total_crepe_price DECIMAL(2,2) NOT NULL,
    PRIMARY KEY (order_id)
);
INSERT INTO crepes_ordered VALUES
(1, 2, '3.65'),
(2, 1, '3.40'),
(3, 4, '3.65'),
(4, 3, '4.35'),
(5, 1, '3.65');



CREATE TABLE crepe_details
(
    -- crepe_id functionally determines crepe_description
    crepe_id INT NOT NULL,
    crepe_description TEXT,
    PRIMARY KEY (crepe_id)
);
INSERT INTO crepe_details VALUES
(1, 'Sugar'),
(2, 'Nutella'),
(3, 'Strawberries'),
(4, 'Butter');
