#MySQL Solution

SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;


#Self Join Approach
SELECT DISTINCT a.email AS EMAIL
FROM person a
JOIN person b
ON a.email = b.email
   AND a.id<>b.id;
