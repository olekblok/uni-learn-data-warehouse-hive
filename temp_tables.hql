CREATE TABLE temp_Fact_Enrollment (
  Grade INT,
  ID_FinishDate INT,
  ID_Time INT,
  ID_Course INT,
  ID_Student INT,
  ID_Survey INT,
  CompletitionPercentage INT,
  SurveyRespond MAP<string, int>,
  ID_StartDate INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
MAP KEYS TERMINATED BY ':'
LINES TERMINATED BY '\n'
STORED as TEXTFILE;

CREATE TABLE temp_Dim_Survey (
  ID_Survey  INT,
  Status VARCHAR(255)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED as TEXTFILE;

CREATE TABLE temp_Dim_Student (
  ID_Student INT,
  FirstName_LastName STRUCT<firstname:string, lastname:string>,
  Email VARCHAR(255),
  IsCurrent BOOLEAN,
  StartTime TIMESTAMP,
  EndTime TIMESTAMP,
  Student_Index INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY '|'
LINES TERMINATED BY '\n'
STORED as TEXTFILE;

CREATE TABLE temp_Dim_Date (
  ID_Date INT,
  Date_ TIMESTAMP,
  Year INT,
  Month VARCHAR(255),
  MonthNo INT,
  DayOfWeek VARCHAR(255),
  DayOfWeekNo INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED as TEXTFILE;