
USE BRMS;

INSERT INTO Center (name, email, city, region, street) VALUES
('Beirut Reconstruction Center', 'beirut.center@brms.lb', 'Beirut', 'Beirut', 'Hamra Street'),
('South Lebanon Recovery Center', 'south.center@brms.lb', 'Tyre', 'South Lebanon', 'Main Road'),
('Bekaa Reconstruction Center', 'bekaa.center@brms.lb', 'Zahle', 'Bekaa', 'Boulevard Street'),
('Mount Lebanon Support Center', 'mount.center@brms.lb', 'Baabda', 'Mount Lebanon', 'Government Road'),
('North Lebanon Recovery Center', 'north.center@brms.lb', 'Tripoli', 'North Lebanon', 'Mina Road');

INSERT INTO Phone_Center (phone_number, center_id) VALUES
('01-350111', 1),
('07-740222', 2),
('08-810333', 3),
('05-920444', 4),
('06-430555', 5),
('06-430556', 5);


INSERT INTO City (name, district, population, damage_level, center_id) VALUES
('Beirut', 'Beirut', 433249, 4, 1),
('Tyre', 'Tyre', 135204, 5, 2),
('Zahle', 'Zahle', 150000, 3, 3),
('Baabda', 'Baabda', 120000, 2, 4),
('Tripoli', 'Tripoli', 530000, 3, 5);

INSERT INTO Employee (first_name, last_name, phone_number, email, salary, job_type, date_hired, advisor_id, center_id) VALUES
('Karim', 'Haddad', '70-111222', 'karim.haddad@brms.lb', 1800.00, 'manager', '2020-02-10', NULL, 1),
('Maya', 'Khoury', '71-222333', 'maya.khoury@brms.lb', 1400.00, 'adviser', '2021-06-15', 1, 1),
('Hussein', 'Mansour', '76-333444', 'hussein.mansour@brms.lb', 1200.00, 'worker', '2022-03-20', 2, 2),
('Rana', 'Saad', '03-444555', 'rana.saad@brms.lb', 1500.00, 'adviser', '2021-11-05', 1, 3),
('Ali', 'Nasser', '81-555666', 'ali.nasser@brms.lb', 1100.00, 'worker', '2023-01-12', 4, 4);

INSERT INTO Scout (first_name, last_name, phone_number, specialization, license_number, experience_years, center_id) VALUES
('Nour', 'Hassan', '70-789111', 'Structural Inspection', 'LIC-STR-101', 6, 1),
('Ahmad', 'Zein', '76-456222', 'Damage Assessment', 'LIC-DMG-102', 4, 2),
('Sara', 'Fares', '03-987333', 'Safety Evaluation', 'LIC-SAF-103', 5, 3),
('Omar', 'Karam', '81-321444', 'Civil Engineering', 'LIC-CIV-104', 8, 4),
('Lina', 'Aoun', '71-654555', 'Building Surveying', 'LIC-SUR-105', 3, 5);

INSERT INTO HomeOwner (first_name, last_name, national_id, phone_number, email, city, region, street) VALUES
('Fadi', 'Maalouf', 'LB100001', '70-101010', 'fadi.maalouf@email.com', 'Beirut', 'Beirut', 'Hamra Street'),
('Layal', 'Sfeir', 'LB100002', '71-202020', 'layal.sfeir@email.com', 'Tyre', 'South Lebanon', 'Sea Road'),
('Mahmoud', 'Yassin', 'LB100003', '76-303030', NULL, 'Zahle', 'Bekaa', 'Industrial Road'),
('Dalia', 'Awad', 'LB100004', '03-404040', 'dalia.awad@email.com', 'Baabda', 'Mount Lebanon', 'Main Street'),
('Joseph', 'Tannous', 'LB100005', '81-505050', NULL, 'Tripoli', 'North Lebanon', 'Mina Road');

INSERT INTO Building (region, street, number_of_floors, building_type, damage_level, status, estimated_cost, city_id, home_owner_id) VALUES
('Beirut', 'Hamra Street', 5, 'Residential', 'High', 'Waiting Report', 85000.000, 1, 1),
('South Lebanon', 'Sea Road', 3, 'Residential', 'Critical', 'Waiting Decision', 120000.000, 2, 2),
('Bekaa', 'Industrial Road', 4, 'Commercial', 'Medium', 'Approved', 60000.000, 3, 3),
('Mount Lebanon', 'Main Street', 2, 'Residential', 'Low', 'Rejected', 15000.000, 4, 4),
('North Lebanon', 'Mina Road', 6, 'Mixed Use', 'High', 'Under Construction', 95000.000, 5, 5);

INSERT INTO Report (report_date, damage_description, safety_level, recommendation, estimated_repair_cost, scout_id, building_id, center_id) VALUES
('2026-04-01', 'Major cracks in columns and damaged walls.', 2, 'Rebuild main structure.', 85000.000, 1, 1, 1),
('2026-04-03', 'Severe collapse in roof and front side.', 1, 'Full reconstruction needed.', 120000.000, 2, 2, 2),
('2026-04-05', 'Moderate wall damage and broken windows.', 3, 'Repair walls and windows.', 60000.000, 3, 3, 3),
('2026-04-07', 'Minor internal damage.', 4, 'Small repair only.', 15000.000, 4, 4, 4),
('2026-04-09', 'Heavy damage in upper floors.', 2, 'Rebuild upper floors.', 95000.000, 5, 5, 5);

INSERT INTO ReconstructionDecision (decision_date, decision_status, reason, priority_level, center_id, report_id) VALUES
('2026-04-02', 'Rebuild', 'Building is unsafe for residents.', 2, 1, 1),
('2026-04-04', 'Rebuild', 'Critical destruction and high risk.', 1, 2, 2),
('2026-04-06', 'Pending', 'Needs second inspection.', 3, 3, 3),
('2026-04-08', 'Rejected', 'Damage is minor and does not require reconstruction.', 5, 4, 4),
('2026-04-10', 'Rebuild', 'Upper floors are structurally unsafe.', 2, 5, 5);

INSERT INTO ConstructionGroup (name, specialization, availability_status, number_of_workers) VALUES
('Al-Amal Construction Group', 'Structural Repair', TRUE, 15),
('Cedar Builders', 'Full Reconstruction', TRUE, 25),
('Beirut Stone Works', 'Wall Repair', FALSE, 10),
('South Steel Team', 'Steel Reinforcement', TRUE, 18),
('Phoenix Rebuild Group', 'Roof Reconstruction', TRUE, 12);

INSERT INTO Phone_ConstructionGroup (phone_number, construction_group_id) VALUES
('01-777111', 1),
('07-777222', 2),
('01-777333', 3),
('03-777444', 4),
('06-777555', 5);

INSERT INTO ReconstructionProject (start_date, expected_end_date, actual_end_date, project_status, progress_percentage, building_id, construction_group_id) VALUES
('2026-04-15', '2026-08-15', NULL, 'In Progress', 25.00, 1, 1),
('2026-04-18', '2026-10-18', NULL, 'Planned', 0.00, 2, 2),
('2026-04-20', '2026-07-20', NULL, 'On Hold', 10.00, 3, 3),
('2026-04-22', '2026-06-22', '2026-06-10', 'Completed', 100.00, 4, 4),
('2026-04-25', '2026-09-25', NULL, 'In Progress', 40.00, 5, 5);

INSERT INTO Material (name, unit, unit_price, available_quantity) VALUES
('Cement', 'Bag', 6.500, 1000),
('Steel Bars', 'Ton', 720.000, 80),
('Bricks', 'Piece', 0.350, 5000),
('Sand', 'Cubic Meter', 18.000, 300),
('Paint', 'Bucket', 22.000, 200);

INSERT INTO Supplier (name, phone_number, email, city, region, street) VALUES
('Lebanon Cement Co.', '01-880111', 'sales@lebanoncement.lb', 'Beirut', 'Beirut', 'Port Road'),
('Bekaa Steel Supplies', '08-880222', 'info@bekaasteel.lb', 'Zahle', 'Bekaa', 'Industrial Zone'),
('Tyre Building Materials', '07-880333', 'contact@tyrematerials.lb', 'Tyre', 'South Lebanon', 'Market Street'),
('Tripoli Sand Traders', '06-880444', 'sales@tripolisand.lb', 'Tripoli', 'North Lebanon', 'Mina Road'),
('Cedar Paints', '05-880555', 'info@cedarpaints.lb', 'Baabda', 'Mount Lebanon', 'Main Road');

INSERT INTO ProjectUpdate (project_id, update_no, update_date, description, progress_percentage, problem_reported) VALUES
(1, 1, '2026-04-20', 'Initial cleaning and safety barriers installed.', 10.00, NULL),
(1, 2, '2026-05-01', 'Column reinforcement started.', 25.00, 'Delay in steel delivery.'),
(2, 1, '2026-04-25', 'Site prepared for reconstruction.', 0.00, NULL),
(3, 1, '2026-04-28', 'Wall repair started then stopped.', 10.00, 'Waiting for approval.'),
(5, 1, '2026-05-05', 'Roof reconstruction work started.', 40.00, NULL);

INSERT INTO Project_Uses_Material (reconstruction_project_id, material_id, quantity_used, usage_date, total_cost) VALUES
(1, 1, 100.00, '2026-04-20', 650.000),
(1, 2, 2.00, '2026-04-22', 1440.000),
(2, 3, 1500.00, '2026-04-25', 525.000),
(3, 4, 20.00, '2026-04-28', 360.000),
(5, 5, 30.00, '2026-05-05', 660.000);

INSERT INTO Supplier_Supplies_Material (supplier_id, material_id, quantity_supplied, supply_date, price_per_unit) VALUES
(1, 1, 500.00, '2026-04-10', 6.200),
(2, 2, 20.00, '2026-04-11', 700.000),
(3, 3, 3000.00, '2026-04-12', 0.320),
(4, 4, 100.00, '2026-04-13', 17.500),
(5, 5, 100.00, '2026-04-14', 21.000);
