USE BRMS;



-- Queries

-- Query 1
SELECT *
FROM Center;

-- Query 2
SELECT 
    id,
    region,
    street,
    building_type,
    damage_level,
    status,
    estimated_cost
FROM Building
WHERE damage_level IN ('High', 'Critical')
ORDER BY estimated_cost DESC;

-- Query 3
SELECT 
    b.id AS building_id,
    b.region,
    b.street,
    b.damage_level,
    b.status,
    CONCAT(h.first_name, ' ', h.last_name) AS owner_name,
    h.phone_number
FROM Building b
JOIN HomeOwner h
    ON b.home_owner_id = h.id;

-- Query 4
SELECT 
    b.id AS building_id,
    b.street,
    b.region,
    c.name AS city_name,
    ce.name AS center_name
FROM Building b
JOIN City c
    ON b.city_id = c.id
JOIN Center ce
    ON c.center_id = ce.id;

-- Query 5
SELECT 
    r.id AS report_id,
    r.report_date,
    r.safety_level,
    r.estimated_repair_cost,
    CONCAT(s.first_name, ' ', s.last_name) AS scout_name,
    s.specialization
FROM Report r
JOIN Scout s
    ON r.scout_id = s.id
ORDER BY r.report_date;

-- Query 6
SELECT 
    rd.id AS decision_id,
    rd.decision_date,
    rd.decision_status,
    rd.priority_level,
    c.name AS center_name,
    r.id AS report_id,
    r.safety_level
FROM ReconstructionDecision rd
JOIN Center c
    ON rd.center_id = c.id
JOIN Report r
    ON rd.report_id = r.id;

-- Query 7
SELECT 
    rp.id AS project_id,
    rp.project_status,
    rp.progress_percentage,
    b.street AS building_street,
    b.region AS building_region,
    cg.name AS construction_group,
    cg.specialization
FROM ReconstructionProject rp
JOIN Building b
    ON rp.building_id = b.id
JOIN ConstructionGroup cg
    ON rp.construction_group_id = cg.id;

-- Query 8
SELECT 
    project_id,
    update_no,
    update_date,
    description,
    progress_percentage,
    problem_reported
FROM ProjectUpdate
ORDER BY project_id, update_no;

-- Query 9
SELECT 
    pum.reconstruction_project_id AS project_id,
    m.name AS material_name,
    pum.quantity_used,
    m.unit,
    pum.usage_date,
    pum.total_cost
FROM Project_Uses_Material pum
JOIN Material m
    ON pum.material_id = m.id;

-- Query 10
SELECT 
    s.name AS supplier_name,
    m.name AS material_name,
    ssm.quantity_supplied,
    m.unit,
    ssm.supply_date,
    ssm.price_per_unit
FROM Supplier_Supplies_Material ssm
JOIN Supplier s
    ON ssm.supplier_id = s.id
JOIN Material m
    ON ssm.material_id = m.id;

-- Query 11
SELECT 
    c.name AS city_name,
    COUNT(b.id) AS number_of_buildings
FROM City c
LEFT JOIN Building b
    ON c.id = b.city_id
GROUP BY c.id, c.name;

-- Query 12
SELECT 
    id,
    region,
    street,
    damage_level,
    estimated_cost
FROM Building
WHERE estimated_cost > (
    SELECT AVG(estimated_cost)
    FROM Building
);
