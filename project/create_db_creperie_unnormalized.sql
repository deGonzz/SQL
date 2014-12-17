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
    -- payment_method_code functionally determines type (ref_payment_methods)
    customer_id INT NOT NULL,
    payment_method_code INT,  
    customer_address_id INT NOT NULL REFERENCES addresses(address_id), 
    payment_method_type TEXT,
    customer_name VARCHAR(50) NOT NULL,
    customer_phone VARCHAR(50) NOT NULL,
    PRIMARY KEY (customer_id)
);

INSERT INTO customers VALUES
(22, 1, 10, 'Lizette Bouddhou', 'CREDIT', '734-987-0943'),
(23, 2, 11, 'Julie Jones', 'DEBIT', '323-135-8640'),
(24, 2, 12, 'Kevin Ox', 'DEBIT', '123-092-3202'),
(25, 1, 13, 'John Locke', 'CREDIT', '434-321-8765'),
(26, 3, 14, 'Ana Lucia', 'CASH', '222-555-5555');




CREATE TABLE addresses
(
    -- address_id functionally determines city, zip, state
    -- state functionally determines zip (zip_state)
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

CREATE TABLE employees
(
    -- employee_id functionally determines employee_address_id, employee_name, employee_phone, zip
    -- zip functionally determines city
    employee_id INT NOT NULL,
    employee_address_id INT REFERENCES addresses(address_id),
    employee_name VARCHAR(50),
    employee_phone VARCHAR(50),
    city VARCHAR(20),
    zip VARCHAR(20),
    PRIMARY KEY (employee_id)
);
INSERT INTO employees VALUES
(1, 1, 'Jack Shephard', '734-324-2356', 'Brooklyn', '11201'),
(2, 1, 'Hugo Reyes', '789-456-2333', 'Brooklyn', '11201'),
(3, 3, 'Ranma Vincent', '428-333-6789', 'Brooklyn', '11202'),
(4, 4, 'Bunny Riviere', '202-456-3528', 'Queens', '11385'),
(5, 2, 'Ross Geller', '904-332-4456', 'Brooklyn', '11201'),
(6, 4, 'Rachel Green','340-284-1294', 'Queens', '11385'),
(7, 7, 'John Locke', '243-099-3235', 'Brooklyn', '11203'),
(8, 5, 'Hajime Kindaichi', '111-674-9840', 'Brooklyn', '11202'),
(9, 9, 'Tenchi Muyo', '291-321-3245', 'Brooklyn', '11203');


CREATE TABLE cars
(
    -- car_id functionally determines license_number, car_type_code 
    -- car_type_code functionally determines car_type_description (car_types)
    car_id INT REFERENCES car_types(car_type_code),
    car_license_number VARCHAR(20),
    car_type_code INT NOT NULL, 
    car_type_description TEXT,
    PRIMARY KEY (car_id)
);
INSERT INTO cars VALUES
(1, '111-DBZ', 01, '2015 Toyota Land Cruiser'),
(2, '222-TGJ', 02, '2007 BMW 128i'),
(3, '333-GHI', 01, '2015 Toyota Land Cruiser'),
(4, '777-FWI', 03, '2003 Renault Twingo');





CREATE TABLE suppliers
(
    -- supplier_id functionally determines supplier_address_id, supplier_name, supplier_phone
    supplier_id INT NOT NULL,
    supplier_address_id INT NOT NULL REFERENCES addresses(address_id), 
    supplier_name VARCHAR(50) NOT NULL,
    supplier_phone VARCHAR(50) NOT NULL,
    PRIMARY KEY (supplier_id)
);
INSERT INTO suppliers VALUES
(1, 2, 'Sugar For Days', '342-998-4938'),
(2, 2, 'Moms Strawberries', '432-903-9830'),
(3, 4, 'ChocoChoc', '312-334-9984'),
(4, 1, 'BestEgg', '302-444-0098');



CREATE TABLE orders
(
    -- order_id functionally determines customer_id, delivered_by_employee_id, car_id, total_order_price
    -- total_order_price functionally determines price_range
    order_id INT NOT NULL REFERENCES crepes_ordered(order_id),
    customer_id INT NOT NULL  REFERENCES addresses(customer_id),
    delivered_by_employee_id INT NOT NULL REFERENCES employees(employee_id),
    car_id INT NOT NULL REFERENCES cars(car_id),
    total_order_price DECIMAL(2,2) NOT NULL,
    price_range VARCHAR(50) NOT NULL,
    PRIMARY KEY (order_id)
);
INSERT INTO orders VALUES
(1, 11, 1, 1, '3,65', 'low'),
(2, 14, 5, 1, '3.65', 'low'),
(3, 12, 8, 2, '5.65', 'high'),
(4, 13, 6, 3, '4.65', 'medium'),
(5, 10, 7, 2, '3.65', 'low');


 

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
    -- order_id functionally determines crepe_id, total_crepe_price 
    -- crepe_id functionally determines crepe_description (crepe_details)
    order_id INT NOT NULL,
    crepe_id INT NOT NULL,
    crepe_description TEXT,
    total_crepe_price DECIMAL(2,2) NOT NULL,
    PRIMARY KEY (order_id)
);
INSERT INTO crepes_ordered VALUES
(1, 2, 'Nutella', '3.65'),
(2, 1, 'Sugar', '3.40'),
(3, 4, 'Butter', '3.65'),
(4, 3, 'Strawberries', '4.35'),
(5, 1, 'Sugar', '3.65');




