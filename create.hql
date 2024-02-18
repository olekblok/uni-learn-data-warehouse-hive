-- External table: Dim_Tutor
CREATE EXTERNAL TABLE Dim_Tutor (
  ID_Tutor INT,
  FirstName VARCHAR(255),
  LastName VARCHAR(255)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED as TEXTFILE;

-- External table: Dim_Faculty
CREATE EXTERNAL TABLE Dim_Faculty (
  ID_Faculty INT,
  Name VARCHAR(55)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED as TEXTFILE;

-- External table: Dim_Course
CREATE EXTERNAL TABLE Dim_Course (
  ID_Course INT,
  Name VARCHAR(255),
  NumOfHours VARCHAR(255),
  ID_Faculty INT
) 
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED as TEXTFILE;

-- External table: Fact_Teachings
CREATE EXTERNAL TABLE Fact_Teachings (
  ID_Tutor INT,
  ID_Course INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED as TEXTFILE;

-- Partitioned AND clustered
CREATE TABLE Fact_Enrollment (
  Grade INT,
  ID_FinishDate INT,
  ID_Time INT,
  ID_Course INT,
  ID_Student INT,
  ID_Survey INT,
  CompletitionPercentage INT,
  SurveyRespond MAP<string, int>
)
PARTITIONED BY (ID_StartDate INT)
CLUSTERED BY (ID_Course) into 50 buckets
STORED as ORC;

CREATE TABLE Dim_Survey (
  ID_Survey  INT,
  Status VARCHAR(255)
)
STORED as ORC;

CREATE TABLE Dim_Student (
  ID_Student INT,
  FirstName_LastName STRUCT<firstname:string, lastname:string>,
  Email VARCHAR(255),
  IsCurrent BOOLEAN,
  StartTime TIMESTAMP,
  EndTime TIMESTAMP,
  Student_Index INT
)
STORED as ORC;

CREATE TABLE Dim_Date (
  ID_Date INT,
  Date_ TIMESTAMP,
  Year INT,
  Month VARCHAR(255),
  MonthNo INT,
  DayOfWeek VARCHAR(255),
  DayOfWeekNo INT
)
STORED as SEQUENCEFILE;