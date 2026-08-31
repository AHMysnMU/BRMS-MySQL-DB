USE BRMS;



-- procedure
DELIMITER //

CREATE PROCEDURE Show_Projects_By_Status (
    IN p_project_status VARCHAR(50)
)
BEGIN
    SELECT 
        id,
        start_date,
        expected_end_date,
        actual_end_date,
        project_status,
        progress_percentage,
        building_id,
        construction_group_id
    FROM ReconstructionProject
    WHERE project_status = p_project_status;
END //

DELIMITER ;
