CREATE TABLE hospitals_patients AS 
SELECT surveys.provider_number, surveys.hospital_name, best_hospitals.total_score, surveys.overall_d 
FROM surveys INNER JOIN best_hospitals ON (surveys.provider_number = best_hospitals.provider_id) 
ORDER BY best_hospitals.total_score DESC;

SELECT * FROM hospitals_patients;
