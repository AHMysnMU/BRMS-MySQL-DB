USE BRMS;



-- permission

-- 1
CREATE USER admin_user@localhost IDENTIFIED BY "admin123";

GRANT ALL PRIVILEGES 
ON BRMS.* 
TO admin_user@localhost;


-- 2
CREATE USER center_staff@localhost IDENTIFIED BY "center123";

GRANT SELECT 
ON BRMS.* 
TO center_staff@localhost;

GRANT INSERT, UPDATE 
ON BRMS.Report 
TO center_staff@localhost;

GRANT INSERT, UPDATE 
ON BRMS.ReconstructionDecision 
TO center_staff@localhost;

GRANT INSERT, UPDATE 
ON BRMS.ReconstructionProject 
TO center_staff@localhost;

GRANT INSERT, UPDATE 
ON BRMS.ProjectUpdate 
TO center_staff@localhost;


-- 3
CREATE USER scout_user@localhost IDENTIFIED BY "scout123";

GRANT SELECT 
ON BRMS.Center 
TO scout_user@localhost;

GRANT SELECT 
ON BRMS.City 
TO scout_user@localhost;

GRANT SELECT 
ON BRMS.Building 
TO scout_user@localhost;

GRANT INSERT 
ON BRMS.Report 
TO scout_user@localhost;
