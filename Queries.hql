--How the number of hours during courses are shaped in relation to average grade?

SELECT  AVG(a.grade) AS AVG_Grade, b.numofhours
FROM    fact_enrollment a
INNER JOIN dim_course b on a.id_course = b.id_course
GROUP BY b.numofhours;

--Show the grades from finished courses in shape to the months

SELECT AVG(a.grade) AS AVG_Grade, b.month, b.year
FROM fact_enrollment a
INNER JOIN dim_date b on a.id_finishdate = b.ID_Date
GROUP BY b.month, b.year;

--Find the average completion percentage for the courses with the biggest/lowest number of hours.

SELECT  AVG(a.CompletitionPercentage) AS AVG_completion, b.numofhours
FROM    fact_enrollment a
INNER JOIN dim_course b on a.id_course = b.id_course
GROUP BY b.numofhours;

--Which faculty has the highest average grades

SELECT AVG(a.grade) as grade, c.name
FROM fact_enrollment a
INNER JOIN dim_course b on a.id_course = b.id_course
INNER JOIN dim_faculty c on b.id_faculty = c.id_faculty
GROUP BY c.name
ORDER BY grade
LIMIT 1;

--Find the number of hours of courses with the best average content rate from the survey

SELECT  AVG(a.SurveyRespond["contentrate"]) AS AVG_contentRate, b.numofhours
FROM    fact_enrollment a
INNER JOIN dim_course b on a.id_course = b.id_course
GROUP BY b.numofhours;

--What was the number of hours for the courses with the highest hardness rate?

SELECT  AVG(a.SurveyRespond["hardnessrate"]) AS AVG_hardnessRate, b.numofhours
FROM    fact_enrollment a
INNER JOIN dim_course b on a.id_course = b.id_course
GROUP BY b.numofhours;

--Which courses have the highest content rate level?

SELECT  ROUND(AVG(a.SurveyRespond["contentrate"]),2) as rating, b.name
FROM    fact_enrollment a
INNER JOIN dim_course b on a.id_course = b.id_course
GROUP BY b.name
ORDER BY rating DESC
LIMIT 3;

--Find tutors' names with the highest tutor level.

SELECT  ROUND(AVG(a.SurveyRespond["tutorrate"]),2) as rating, d.firstname, d.lastname
FROM    fact_enrollment a
INNER JOIN dim_course b on a.id_course = b.id_course
INNER JOIN fact_teachings c on b.id_course = c.id_course
INNER JOIN dim_tutor d on c.id_tutor = d.id_tutor
GROUP BY d.firstname, d.lastname
ORDER BY rating DESC
LIMIT 3;

--Compare average grades within years

SELECT ROUND(AVG(a.grade),2) AS AVG_grade, b.year
FROM fact_enrollment a
INNER JOIN dim_date b on a.id_finishdate = b.ID_Date
GROUP BY b.year;


