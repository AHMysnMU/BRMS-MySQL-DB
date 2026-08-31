USE BRMS;



-- View
-- 1
CREATE VIEW center_damage_summary AS
SELECT 
    center.name AS center_name,
    COUNT(DISTINCT city.id) AS number_of_cities,
    COUNT(building.id) AS number_of_buildings,
    SUM(building.estimated_cost) AS total_estimated_cost
FROM center
JOIN city ON center.id = city.center_id
LEFT JOIN building ON city.id = building.city_id
GROUP BY center.id, center.name;


-- 2
CREATE VIEW project_material_cost AS
SELECT 
    reconstructionproject.id AS project_id,
    reconstructionproject.project_status,
    reconstructionproject.progress_percentage,
    constructiongroup.name AS construction_group_name,
    SUM(project_uses_material.total_cost) AS total_material_cost
FROM reconstructionproject
JOIN constructiongroup 
    ON reconstructionproject.construction_group_id = constructiongroup.id
LEFT JOIN project_uses_material 
    ON reconstructionproject.id = project_uses_material.reconstruction_project_id
GROUP BY 
    reconstructionproject.id,
    reconstructionproject.project_status,
    reconstructionproject.progress_percentage,
    constructiongroup.name;
    
    
-- 3
CREATE VIEW report_decision_details AS
SELECT 
    report.id AS report_id,
    report.report_date,
    report.safety_level,
    scout.first_name AS scout_first_name,
    scout.last_name AS scout_last_name,
    reconstructiondecision.decision_status,
    reconstructiondecision.priority_level
FROM report
JOIN scout ON report.scout_id = scout.id
JOIN reconstructiondecision ON report.id = reconstructiondecision.report_id;
