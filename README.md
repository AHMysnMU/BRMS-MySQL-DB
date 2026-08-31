# Building Reconstruction Management System (BRMS) 🏗️

A database project designed to manage and organize the reconstruction process of buildings damaged by war or other major destruction.

The **Building Reconstruction Management System (BRMS)** connects reconstruction centers, damaged buildings, homeowners, scouts, reports, reconstruction decisions, construction groups, projects, materials, suppliers, and project updates in one organized relational database.

The main goal of the project is to improve coordination, track reconstruction progress and resources, and help reconstruction centers make clearer and more efficient decisions.

## Project Objectives

BRMS was designed to:

- Track damaged buildings and their owners
- Manage reconstruction centers and the cities they supervise
- Store damage assessment reports
- Track scouts responsible for building inspections
- Record reconstruction decisions
- Assign construction groups to reconstruction projects
- Monitor reconstruction progress
- Manage construction materials
- Track material suppliers
- Record materials used by each project
- Store regular project updates
- Support reporting and data analysis using SQL queries and views

## Main Entities

The database contains the following main entities:

- Center
- City
- Employee
- Scout
- HomeOwner
- Building
- Report
- ReconstructionDecision
- ConstructionGroup
- ReconstructionProject
- Material
- Supplier
- ProjectUpdate

`ProjectUpdate` is implemented as a weak entity identified by the reconstruction project and update number.

## Database Relationships

The system includes several relationships between its entities, including:

- One center manages many cities
- One center employs many employees
- Employees can have another employee as an advisor
- Scouts belong to reconstruction centers
- Buildings belong to cities
- Homeowners can own multiple buildings
- Scouts create damage assessment reports
- Buildings can have multiple reports
- Reports are submitted to reconstruction centers
- Reconstruction decisions are based on reports
- Buildings can have reconstruction projects
- Construction groups can work on multiple projects
- Reconstruction projects can use multiple materials
- Suppliers can provide multiple materials
- Reconstruction projects contain multiple project updates

The project includes both an **Entity Relationship Diagram (ERD)** and a **Relational Model** representing these relationships.

## Database Features

The BRMS database demonstrates several important relational database concepts:

- Primary Keys
- Foreign Keys
- Composite Keys
- One-to-Many relationships
- Many-to-Many relationships
- Self-referencing relationships
- Weak entities
- Junction tables
- `NOT NULL` constraints
- `UNIQUE` constraints
- `CHECK` constraints
- `ENUM` values
- `AUTO_INCREMENT`
- Referential integrity
- `ON DELETE`
- `ON UPDATE`

## SQL Implementation

The database was implemented using **MySQL**.

The implementation includes:

- Database creation
- Table creation
- Foreign key relationships
- Constraints
- Sample data
- SQL queries
- Views
- Database users and permissions
- Stored procedures

## Example Queries

The project contains several SQL queries used to retrieve and analyze reconstruction data.

Examples include:

- Display all reconstruction centers
- Find buildings with High or Critical damage
- Display buildings with their homeowners
- Display buildings with their city and responsible center
- Display reports with scout information
- Display reconstruction decisions with their reports and centers
- Display reconstruction projects with assigned construction groups
- Display project updates
- Display materials used by each project
- Display suppliers and the materials they provide
- Count buildings in each city
- Find buildings whose estimated reconstruction cost is above the average

These queries demonstrate concepts such as:

- `SELECT`
- `WHERE`
- `ORDER BY`
- `JOIN`
- `LEFT JOIN`
- `GROUP BY`
- `COUNT`
- `AVG`
- Subqueries
- Aggregate functions

## Views

The project includes multiple SQL views for easier reporting and analysis.

### Center Damage Summary

Displays each reconstruction center with information such as:

- Number of managed cities
- Number of damaged buildings
- Total estimated reconstruction cost

### Project Material Cost

Displays reconstruction projects together with:

- Project status
- Progress percentage
- Assigned construction group
- Total material cost

### Report Decision Details

Displays reports together with:

- Report information
- Scout information
- Reconstruction decision
- Priority level

## Users and Permissions

The database includes different user roles with different permission levels.

### Admin User

Has full access to the BRMS database.

### Center Staff

Can view database information and manage:

- Reports
- Reconstruction decisions
- Reconstruction projects
- Project updates

### Scout User

Can view:

- Centers
- Cities
- Buildings

and can insert new damage assessment reports.

This demonstrates the use of SQL privileges and role-based database access.

## Stored Procedure

The project includes a stored procedure:

`Show_Projects_By_Status`

The procedure accepts a project status and returns reconstruction projects matching that status.

For example, it can be used to retrieve projects that are:

- Planned
- In Progress
- On Hold
- Completed
- Cancelled

## Sample Data

The database contains sample reconstruction data representing different regions of Lebanon, including centers located in areas such as:

- Beirut
- South Lebanon
- Bekaa
- Mount Lebanon
- North Lebanon

Sample data is also provided for:

- Employees
- Scouts
- Homeowners
- Buildings
- Reports
- Reconstruction decisions
- Construction groups
- Reconstruction projects
- Materials
- Suppliers
- Project updates

## Technologies Used

- MySQL
- SQL
- MySQL Workbench
- Entity Relationship Modeling
- Relational Database Design

## Concepts Practiced

This project applies several important database concepts:

- Database design
- Entity Relationship Diagrams
- Relational models
- Primary and foreign keys
- Cardinality
- Weak entities
- Many-to-many relationships
- Junction tables
- Database constraints
- Data insertion
- SQL joins
- Aggregate functions
- Subqueries
- Views
- Stored procedures
- Database users
- Permissions and privileges
- Referential integrity

## How to Run

1. Install **MySQL Server** and **MySQL Workbench**.
2. Open MySQL Workbench.
3. Create or connect to a MySQL server.
4. Open the BRMS SQL implementation file.
5. Execute the script.

The script creates the database and its tables, relationships, constraints, and sample data.

After that, the provided queries, views, and stored procedure can be executed to explore the system.

## Important Note

Database usernames and passwords used during development should be treated as demonstration credentials only.

For a public GitHub repository, real database passwords or personal credentials should never be uploaded.

## Project Purpose

This project was created as an academic database project to apply relational database concepts to a meaningful real-world problem.

BRMS demonstrates how a structured database can be used to coordinate reconstruction efforts, track damaged buildings, manage resources, monitor projects, and connect the different people and organizations involved in rebuilding affected areas.

## Authors

**Ahmad Yassine**  


Computer Science Students
