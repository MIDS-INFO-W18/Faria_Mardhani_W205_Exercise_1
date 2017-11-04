CREATE TABLE procedure_variance AS 
SELECT measure_name, VARIANCE(score) AS var_score FROM scores 
GROUP BY measure_name 
ORDER BY var_score DESC LIMIT 10;

SELECT * FROM procedure_variance;
