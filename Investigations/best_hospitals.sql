--Create 13 tables for hospitals based on the data for 13 measures available. Get score for the hospitals and add points column based on the score

CREATE TABLE hrank1 AS SELECT provider_id, hospital_name, measure_id, CAST(score AS INT) FROM scores WHERE measure_id = "OP_3b" AND score != "Not Available" ORDER BY score LIMIT 10;

CREATE TABLE rank_hos1
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 11-ROW_NUMBER() OVER (ORDER BY t.score) AS points from hrank1 t;



CREATE TABLE hrank2 AS SELECT provider_id, hospital_name, measure_id, CAST(score AS INT) FROM scores WHERE measure_id = "OP_5" AND score != "Not Available" ORDER BY score LIMIT 10;

CREATE TABLE rank_hos2
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 10 AS points from hrank2;



CREATE TABLE hrank3 AS SELECT provider_id, hospital_name, measure_id, CAST(score AS INT) FROM scores WHERE measure_id = "OP_2" AND score != "Not Available" ORDER BY score DESC LIMIT 10;

CREATE TABLE rank_hos3
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 11-ROW_NUMBER() OVER (ORDER BY t.score DESC) AS points from hrank3 t;



CREATE TABLE hrank4 AS SELECT provider_id, hospital_name, measure_id, CAST(score AS INT) FROM scores WHERE measure_id = "OP_4" AND score != "Not Available" ORDER BY score DESC LIMIT 10;

CREATE TABLE rank_hos4
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 10 AS points from hrank4;



CREATE TABLE hrank5 AS SELECT provider_id, hospital_name, measure_id, CAST(score AS INT) FROM scores WHERE measure_id = "ED_1b" AND score != "Not Available" ORDER BY score LIMIT 10;

CREATE TABLE rank_hos5
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 11-ROW_NUMBER() OVER (ORDER BY t.score) AS points from hrank5 t;



CREATE TABLE hrank6 AS SELECT provider_id, hospital_name, measure_id, CAST(score AS INT) FROM scores WHERE measure_id = "OP_20" AND score != "Not Available" ORDER BY score LIMIT 10;

CREATE TABLE rank_hos6
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 11-ROW_NUMBER() OVER (ORDER BY t.score) AS points from hrank6 t;



CREATE TABLE hrank7 AS SELECT provider_id, hospital_name, measure_id, CAST(score AS INT) FROM scores WHERE measure_id = "OP_22" AND score != "Not Available" ORDER BY score LIMIT 10;

CREATE TABLE rank_hos7
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 10 AS points from hrank7;



CREATE TABLE hrank8 AS SELECT provider_id, hospital_name, measure_id, CAST(score AS INT) FROM scores WHERE measure_id = "OP_23" AND score != "Not Available" ORDER BY score DESC LIMIT 10;

CREATE TABLE rank_hos8
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 10 AS points from hrank8;



CREATE TABLE hrank9 AS SELECT provider_id, hospital_name, measure_id, CAST(score AS INT) FROM scores WHERE measure_id = "IMM_2" AND score != "Not Available" ORDER BY score DESC LIMIT 10;

CREATE TABLE rank_hos9
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 10 AS points from hrank9;



CREATE TABLE hrank10 AS SELECT provider_id, hospital_name, measure_id, CAST(score AS INT) FROM scores WHERE measure_id = "IMM_3_FAC_ADHPCT" AND score != "Not Available" ORDER BY score DESC LIMIT 10;

CREATE TABLE rank_hos10
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 10 AS points from hrank10;



CREATE TABLE hrank11 AS SELECT provider_id, hospital_name, measure_id, CAST(score AS INT) FROM scores WHERE measure_id = "STK_4" AND score != "Not Available" ORDER BY score DESC LIMIT 10;

CREATE TABLE rank_hos11
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 10 AS points from hrank11;



CREATE TABLE hrank12 AS SELECT provider_id, hospital_name, measure_id, CAST(score AS INT) FROM scores WHERE measure_id = "VTE_6" AND score != "Not Available" ORDER BY score LIMIT 10;

CREATE TABLE rank_hos12
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 10 AS points from hrank12;



CREATE TABLE hrank13 AS SELECT provider_id, hospital_name, measure_id, CAST(score AS INT) FROM scores WHERE measure_id = "VTE_5" AND score != "Not Available" ORDER BY score DESC LIMIT 10;

CREATE TABLE rank_hos13
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 10 AS points from hrank13;



-- Combine all the states that we generated
CREATE TABLE all_hospitals AS 
SELECT provider_id, hospital_name, points FROM rank_hos1 UNION ALL 
SELECT provider_id, hospital_name, points from rank_hos2 UNION ALL 
SELECT provider_id, hospital_name, points from rank_hos3 UNION ALL 
SELECT provider_id, hospital_name, points from rank_hos4 UNION ALL 
SELECT provider_id, hospital_name, points from rank_hos5 UNION ALL 
SELECT provider_id, hospital_name, points from rank_hos6 UNION ALL 
SELECT provider_id, hospital_name, points from rank_hos7 UNION ALL 
SELECT provider_id, hospital_name, points from rank_hos8 UNION ALL 
SELECT provider_id, hospital_name, points from rank_hos9 UNION ALL 
SELECT provider_id, hospital_name, points from rank_hos10 UNION ALL 
SELECT provider_id, hospital_name, points from rank_hos11 UNION ALL 
SELECT provider_id, hospital_name, points from rank_hos12 UNION ALL 
SELECT provider_id, hospital_name, points from rank_hos13;

-- Sum the score of the states ranking table, and group by states
CREATE TABLE best_hospitals AS 
SELECT provider_id, hospital_name, SUM(points) AS total_score FROM all_hospitals 
GROUP BY provider_id, hospital_name
ORDER BY total_score DESC LIMIT 10;

-- Final output that is displayed
SELECT * FROM best_hospitals;
