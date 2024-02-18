# UniLearn Data Warehouse

UniLearn harnesses the power of its data warehouse to optimize operations and elevate the online learning experience.

## Overview

UniLearn leverages its data warehouse to drive decision-making and enhance various aspects of online education. From faculty optimization to student lifecycle management, UniLearn's data-driven approach ensures agility and responsiveness, shaping a dynamic and effective online education ecosystem.

### Features

- **Faculty Optimization:**
  - Efficient allocation of tutors based on course demand and expertise.
- **Course Planning:**
  - Strategic curriculum development by analyzing course popularity and faculty associations.
- **Teaching Excellence:**
  - Evaluate tutor-course relationships to enhance teaching effectiveness.
- **Enrollment Insights:**
  - Track student progress, identify at-risk students, and improve interventions for success.
- **Survey Analysis:**
  - Utilize survey responses to gauge course and teaching satisfaction, driving continuous improvement.
- **Student Lifecycle Management:**
  - Precise tracking of student journeys to enhance engagement and tailor learning experiences.
- **Temporal Analysis:**
  - Leverage temporal data for strategic scheduling and trend analysis.

## Data Model

UniLearn's data warehouse consists of several dimensions and fact tables optimized for performance and flexibility.

### Dimensions

1. **Dim_Tutor (External Table):**
   - External table for flexibility, integrating external tutor data seamlessly.
2. **Dim_Faculty (External Table):**
   - External table for streamlined integration of external faculty data.
3. **Dim_Course (External Table):**
   - External table for data locality, simplifying course information updates.
4. **Dim_Survey (Stored as ORC):**
   - Stored as ORC for performance, facilitating swift survey response analysis.
5. **Dim_Student (Stored as ORC):**
   - Stored as ORC for improved query performance in student data analysis.
6. **Dim_Date (Stored as SequenceFile):**
   - Stored as SequenceFile for simplicity in date-related information storage and retrieval.

### Fact Tables

1. **Fact_Teachings (External Table):**
   - External table optimizing relationship management between tutors and courses.
2. **Fact_Enrollment (Partitioned and Clustered Table):**
   - Partitioned and clustered for optimized queries, enhancing data retrieval speed and efficiency.

## Technical Aspects

UniLearn's data warehouse architecture incorporates various technical aspects to ensure efficient data management and query performance.

- **External Tables:** Enable seamless integration of external data sources, promoting efficiency and avoiding data duplication.
- **Partitioning and Clustering:** Enhance query optimization, especially for course-related and temporal queries.
- **Columnar Storage (ORC):** Optimizes query performance for survey responses and student data analysis.
- **SequenceFile Storage:** Provides simplicity in storing and retrieving date-related information, aligning with the platform's need for efficient temporal data handling.

## Conclusion

UniLearn's data-driven approach, powered by its data warehouse, ensures agility, responsiveness, and continuous improvement in the online education ecosystem. By leveraging data for decision-making across various aspects of education, UniLearn shapes a dynamic and effective learning environment.
