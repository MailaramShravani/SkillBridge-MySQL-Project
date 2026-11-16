USE skillbridge;

-- BASIC QUERIES

-- 1. Display all students
SELECT * FROM students;

-- 2. Display all skills
SELECT * FROM skills;

-- 3. Display all companies
SELECT * FROM companies;

-- 4. Display all opportunities
SELECT * FROM opportunities;

-- 5. Display all applications
SELECT * FROM applications;
-- 6. Display all certifications
SELECT * FROM certifications;

-- 7. Display all student skills
SELECT * FROM student_skills;

-- 8. Count total students
SELECT COUNT(*) AS total_students
FROM students;

-- 9. Count total skills
SELECT COUNT(*) AS total_skills
FROM skills;

-- 10. Count total companies
SELECT COUNT(*) AS total_companies
FROM companies;

-- 11. Count total opportunities
SELECT COUNT(*) AS total_opportunities
FROM opportunities;

-- 12. Count total applications
SELECT COUNT(*) AS total_applications
FROM applications;

-- 13. Count total certifications
SELECT COUNT(*) AS total_certifications
FROM certifications;

-- 14. Display unique application statuses
SELECT DISTINCT status
FROM applications;

-- 15. Count applications by status
SELECT status, COUNT(*) AS total
FROM applications
GROUP BY status;
-- INTERMEDIATE QUERIES

-- 16. Display applications in Pending status
SELECT *
FROM applications
WHERE status = 'Pending';

-- 17. Display applications in descending order of date
SELECT *
FROM applications
ORDER BY application_date DESC;

-- 18. Display opportunities with stipend greater than zero
SELECT *
FROM opportunities
WHERE stipend > 0;

-- 19. Display opportunities before a particular deadline
SELECT *
FROM opportunities
WHERE deadline IS NOT NULL;

-- 20. Find the average stipend
SELECT AVG(stipend) AS average_stipend
FROM opportunities;

-- 21. Find the highest stipend
SELECT MAX(stipend) AS highest_stipend
FROM opportunities;

-- 22. Find the lowest stipend
SELECT MIN(stipend) AS lowest_stipend
FROM opportunities;

-- 23. Display student skills with student IDs
SELECT student_id, skill_id
FROM student_skills;

-- 24. Display student names and their skills
SELECT *
FROM students s
JOIN student_skills ss
ON s.student_id = ss.student_id
JOIN skills sk
ON ss.skill_id = sk.skill_id;

-- 25. Display company details with their opportunities
SELECT *
FROM companies c
JOIN opportunities o
ON c.company_id = o.company_id;

-- 26. Display applications with opportunity details
SELECT *
FROM applications a
JOIN opportunities o
ON a.opportunity_id = o.opportunity_id;

-- 27. Display applications with student details
SELECT *
FROM applications a
JOIN students s
ON a.student_id = s.student_id;

-- 28. Count opportunities offered by each company
SELECT company_id, COUNT(*) AS total_opportunities
FROM opportunities
GROUP BY company_id;

-- 29. Count applications for each opportunity
SELECT opportunity_id, COUNT(*) AS total_applications
FROM applications
GROUP BY opportunity_id;

-- 30. Display companies having more than one opportunity
SELECT company_id, COUNT(*) AS total_opportunities
FROM opportunities
GROUP BY company_id
HAVING COUNT(*) > 1;
-- ADVANCED QUERIES

-- 31. Find opportunities with stipend above average
SELECT *
FROM opportunities
WHERE stipend > (
    SELECT AVG(stipend)
    FROM opportunities
);

-- 32. Find students who have submitted applications
SELECT *
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM applications a
    WHERE a.student_id = s.student_id
);

-- 33. Display student skills using a view
SELECT * FROM student_skills_view;

-- 34. Display indexes created on students table
SHOW INDEX FROM students;

-- 35. Display triggers in SkillBridge database
SHOW TRIGGERS FROM skillbridge;