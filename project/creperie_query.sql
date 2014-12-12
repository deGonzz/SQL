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










-- A SELECT FROM WHERE with an implied join











-- A SELECT FROM WHERE GROUP BY







-- A SELECT FROM WHERE GROUP BY HAVING









-- A SELECT FROM WHERE with two implied joins, a MAX function, an AVG function, and at least two levels of parentheses embedding in the where clause (i.e., a very non-trivial where clause)








-- A SELECT FROM WHERE with a NOT operator and an IN operator, and a nested query









-- A SET command and a nontrivial WHERE clause








-- An UPDATE with a nontrivial WHERE clause








-- A CREATE USER









-- A DROP USER








-- A START TRANSACTION and a ROLLBACK