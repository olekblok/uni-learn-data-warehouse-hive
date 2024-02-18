load data local inpath 'Courses.txt'
overwrite into table Dim_Course;

load data local inpath 'Tutors.txt'
overwrite into table Dim_Tutor;

load data local inpath 'Faculty.txt'
overwrite into table Dim_Faculty;

load data local inpath 'Teachings.txt'
overwrite into table Fact_Teachings;

-- TEMP TABLES > NORMAL TABLES

load data local inpath 'Dates.txt'
overwrite into table temp_Dim_Date;

INSERT OVERWRITE TABLE Dim_Date
SELECT ID_Date, Date_, Year, Month, MonthNo, DayOfWeek, DayOfWeekNo
FROM temp_Dim_Date;
--
load data local inpath 'Students.txt'
overwrite into table temp_Dim_Student;

INSERT OVERWRITE TABLE Dim_Student
SELECT ID_Student, FirstName_LastName, Email, IsCurrent, StartTime, EndTime, Student_Index
FROM temp_Dim_Student;
--
load data local inpath 'Survey.txt'
overwrite into table temp_Dim_Survey;

INSERT OVERWRITE TABLE Dim_Survey
SELECT ID_Survey, Status
FROM temp_Dim_Survey;
--


-- DYNAMIC PARTITIONING

set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

load data local inpath 'Enrollment.txt'
overwrite into table temp_Fact_Enrollment;

INSERT OVERWRITE TABLE Fact_Enrollment
partition(ID_StartDate)
SELECT Grade, ID_FinishDate, ID_Time, ID_Course, ID_Student, ID_Survey, CompletitionPercentage, SurveyRespond, ID_StartDate
FROM temp_Fact_Enrollment;
