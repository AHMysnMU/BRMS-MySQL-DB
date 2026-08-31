CREATE DATABASE IF NOT EXISTS BRMS;
USE BRMS;

CREATE TABLE IF NOT EXISTS Center (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    city VARCHAR(50),
    region VARCHAR(50),
    street VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Phone_Center (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    phone_number VARCHAR(20) NOT NULL,

    center_id INT NOT NULL,

    FOREIGN KEY (center_id) REFERENCES Center(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS City (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    district VARCHAR(100) NOT NULL,
    population INT CHECK (population >= 0),
    damage_level INT CHECK (damage_level BETWEEN 1 AND 5),

    center_id INT NOT NULL,

    FOREIGN KEY (center_id) REFERENCES Center(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Employee (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    salary DECIMAL(10,2) NOT NULL CHECK (salary >= 0),
    job_type ENUM('adviser', 'worker', 'manager') NOT NULL,
    date_hired DATE NOT NULL,

    advisor_id INT,
    center_id INT NOT NULL,

    FOREIGN KEY (advisor_id) REFERENCES Employee(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,

    FOREIGN KEY (center_id) REFERENCES Center(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Scout (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    license_number VARCHAR(30),
    experience_years INT CHECK (experience_years >= 0),

    center_id INT NOT NULL,

    FOREIGN KEY (center_id) REFERENCES Center(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS HomeOwner (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    national_id VARCHAR(20) UNIQUE NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(255),
    city VARCHAR(50),
    region VARCHAR(50),
    street VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Building (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    region VARCHAR(50) NOT NULL,
    street VARCHAR(50) NOT NULL,
    number_of_floors INT NOT NULL CHECK (number_of_floors > 0),
    building_type VARCHAR(50),
    damage_level ENUM('Low', 'Medium', 'High', 'Critical') NOT NULL,
    status VARCHAR(50) NOT NULL,
    estimated_cost DECIMAL(15,3) NOT NULL CHECK (estimated_cost >= 0),

    city_id INT NOT NULL,
    home_owner_id INT NOT NULL,

    FOREIGN KEY (city_id) REFERENCES City(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    FOREIGN KEY (home_owner_id) REFERENCES HomeOwner(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Report (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    report_date DATE NOT NULL,
    damage_description TEXT NOT NULL,
    safety_level INT NOT NULL CHECK (safety_level BETWEEN 1 AND 5),
    recommendation TEXT,
    estimated_repair_cost DECIMAL(15,3) NOT NULL CHECK (estimated_repair_cost >= 0),

    scout_id INT NOT NULL,
    building_id INT NOT NULL,
    center_id INT NOT NULL,

    FOREIGN KEY (scout_id) REFERENCES Scout(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    FOREIGN KEY (building_id) REFERENCES Building(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    FOREIGN KEY (center_id) REFERENCES Center(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS ReconstructionDecision (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    decision_date DATE NOT NULL,
    decision_status ENUM('Rebuild', 'Rejected', 'Pending') NOT NULL,
    reason TEXT,
    priority_level INT NOT NULL CHECK (priority_level BETWEEN 1 AND 5),

    center_id INT NOT NULL,
    report_id INT NOT NULL UNIQUE,

    FOREIGN KEY (center_id) REFERENCES Center(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    FOREIGN KEY (report_id) REFERENCES Report(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS ConstructionGroup (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(50) NOT NULL,
    availability_status BOOLEAN NOT NULL DEFAULT TRUE,
    number_of_workers INT NOT NULL CHECK (number_of_workers > 0)
);

CREATE TABLE IF NOT EXISTS Phone_ConstructionGroup (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    phone_number VARCHAR(20) NOT NULL,

    construction_group_id INT NOT NULL,

    FOREIGN KEY (construction_group_id) REFERENCES ConstructionGroup(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS ReconstructionProject (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    start_date DATE NOT NULL,
    expected_end_date DATE NOT NULL,
    actual_end_date DATE,
    project_status ENUM('Planned', 'In Progress', 'On Hold', 'Completed', 'Cancelled') NOT NULL DEFAULT 'Planned',
    progress_percentage DECIMAL(5,2) NOT NULL DEFAULT 0 CHECK (progress_percentage BETWEEN 0 AND 100),

    building_id INT NOT NULL,
    construction_group_id INT NOT NULL,

    FOREIGN KEY (building_id) REFERENCES Building(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    FOREIGN KEY (construction_group_id) REFERENCES ConstructionGroup(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Material (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    unit VARCHAR(30) NOT NULL,
    unit_price DECIMAL(10,3) NOT NULL CHECK (unit_price >= 0),
    available_quantity FLOAT CHECK (available_quantity >= 0)
);

CREATE TABLE IF NOT EXISTS Supplier (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(255) UNIQUE,
    city VARCHAR(50),
    region VARCHAR(50),
    street VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS ProjectUpdate (
    project_id INT NOT NULL,
    update_no INT NOT NULL,
    update_date DATE NOT NULL,
    description TEXT,
    progress_percentage DECIMAL(5,2) NOT NULL CHECK (progress_percentage BETWEEN 0 AND 100),
    problem_reported TEXT,

    PRIMARY KEY (project_id, update_no),

    FOREIGN KEY (project_id) REFERENCES ReconstructionProject(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Project_Uses_Material (
    reconstruction_project_id INT NOT NULL,
    material_id INT NOT NULL,
    quantity_used DECIMAL(10,2) NOT NULL CHECK (quantity_used > 0),
    usage_date DATE NOT NULL,
    total_cost DECIMAL(15,3) NOT NULL CHECK (total_cost >= 0),

    PRIMARY KEY (reconstruction_project_id, material_id, usage_date),

    FOREIGN KEY (reconstruction_project_id) REFERENCES ReconstructionProject(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (material_id) REFERENCES Material(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Supplier_Supplies_Material (
    supplier_id INT NOT NULL,
    material_id INT NOT NULL,
    quantity_supplied DECIMAL(10,2) NOT NULL CHECK (quantity_supplied > 0),
    supply_date DATE NOT NULL,
    price_per_unit DECIMAL(10,3) NOT NULL CHECK (price_per_unit >= 0),

    PRIMARY KEY (supplier_id, material_id, supply_date),

    FOREIGN KEY (supplier_id) REFERENCES Supplier(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (material_id) REFERENCES Material(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
