-- A simple SELECT FROM WHERE
SELECT *
FROM customers 
WHERE customer_name='Lizette Bouddhou';

-- A SELECT FROM WHERE ORDER BY

SELECT *
FROM addresses
WHERE state='NY'
ORDER BY address_id DESC;

-- A SELECT FROM WHERE ORDER BY LIMIT

SELECT *
FROM addresses
WHERE state='NY'
ORDER BY address_id DESC
LIMIT 7;

-- A SELECT FROM WHERE with an implied join

SELECT e.*, a.*
FROM employees e, addresses a
WHERE e.employee_address_id = a.address_id;

-- A SELECT FROM WHERE GROUP BY

SELECT city, Count(address_id) As NumberOfAddresses
FROM addresses  
WHERE state = "NY"
GROUP BY city
ORDER BY Count(address_id) DESC;

-- A SELECT FROM WHERE GROUP BY HAVING

SELECT city, Count(address_id) As NumberOfAddresses
FROM addresses  
WHERE state = "NY"
GROUP BY city
HAVING Count(address_id) > 7
ORDER BY Count(address_id) DESC;

-- A SELECT FROM WHERE with two implied joins, a MAX function, an AVG function, and at least two levels of parentheses embedding in the where clause (i.e., a very non-trivial where clause)

SELECT *
FROM employees e, crepes_ordered c
WHERE c.total_crepe_price < (SELECT AVG(total_crepe_price) FROM crepes_ordered) AND e.employee_address_id in(
    SELECT e.employee_address_id
    FROM employees e, addresses a, customers k
    WHERE e.employee_address_id = a.address_id AND employee_id < ( SELECT MAX(payment_method_code) FROM customers)    
);

-- A SELECT FROM WHERE with a NOT operator and an IN operator, and a nested query

SELECT employee_name
FROM employees
WHERE employee_name in (
	SELECT employee_name
	FROM employees
	WHERE NOT employee_address_id > 4
);







-- A SET command and a nontrivial WHERE clause








-- An UPDATE with a nontrivial WHERE clause








-- A CREATE USER









-- A DROP USER








-- A START TRANSACTION and a ROLLBACK