-- Project Status
WITH project_status AS(
SELECT 
	project_id,
	project_name,
	project_budget,
	'upcoming' AS status
FROM 
	upcoming_projects
UNION ALL
SELECT
	project_id,
	project_name,
	project_budget,
	'completed' AS status
FROM 
	completed_projects)

-- Big Table
SELECT 
	e.employee_id,
	e.first_name,
	e.last_name,
	e.job_title,
	e.salary,
	d.Department_Name,
        d.Department_Budget,
        d.Department_Goals,
	pa.project_id,
	p.project_name,
        p.project_budget,
	p.status
FROM 
	employees AS e
JOIN 
	departments AS d
ON 
	e.department_id = d.Department_ID
JOIN 
	project_assignments AS pa
ON
	pa.employee_id = e.employee_id
JOIN 
	project_status AS p
on 
	p.project_id = pa.project_id
