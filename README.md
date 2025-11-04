# English Learning Platform DBMS Project

 ## Overview
The English Learning Platform DBMS Project is designed to efficiently manage and organize data related to users, vocabulary, grammar rules, and learning progress. It demonstrates how relational database design, normalization, and SQL operations can be applied to build a structured, data-driven language learning system.
This project is purely database-focused and built using SQL, emphasizing key concepts like E–R modeling, normalization (up to 3NF), relational schema design, and advanced query handling (joins and subqueries).

## Aim
To design and implement a database management system that supports an English learning platform by managing users, tracking their progress, and providing structured access to vocabulary and grammar data.

## Objectives
- Design an E–R model and convert it into a normalized relational schema.
- Create and manage tables using SQL DDL commands.
- Populate tables using DML operations.
- Implement joins, subqueries, and aggregate functions for analyzing user performance.
- Demonstrate data consistency and referential integrity through constraints.

## Tools & Technologies
- Database System: MySQL / SQL Server / SQLite
- Language: SQL
- Modeling Tool: Draw.io / Lucidchart / Figma (for ER Diagram)
- Platform: Any SQL environment (MySQL Workbench, Oracle, or VS Code SQL extension)

## Database Design
**Entities**
- Users: Stores learner information.
- Vocabulary: Holds words, definitions, and parts of speech.
- Grammar_Rules: Contains grammar concepts and examples.
- User_Progress: Tracks user performance and responses.
- Lesson_History: Records lesson summaries and focus areas.

**Relationships**

A user can have many progress records and lesson histories.
Each vocabulary word and grammar rule can appear in multiple progress entries.

## SQL Features Demonstrated
# DDL (Data Definition Language)
Creating tables with constraints (PK, FK, NOT NULL, UNIQUE, CHECK).

**DML (Data Manipulation Language)**
- Inserting, updating, and deleting data.
- Querying data with SELECT statements.

**Joins & Subqueries**
- Retrieving related data across multiple tables.
- Identifying weak vocabulary or grammar areas for each user.

**Analytical Queries**
Calculating user accuracy, total attempts, and progress summaries.


## Learning Outcomes
- Understood E–R modeling and relational schema design.
- Applied normalization up to 3NF for efficient data management.
- Practiced SQL commands, joins, and subqueries for analytics.
- Ensured data integrity with relational constraints.
