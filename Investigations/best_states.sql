--Create 13 tables for states based on the data for 13 measures available. Get average score for the states and add points column based on the average score

CREATE TABLE srank1 AS SELECT scores.state, AVG(CAST(score AS INT)) as avg_score FROM scores WHERE measure_id = "OP_3b" AND score != "Not Available" GROUP BY scores.state ORDER BY avg_score LIMIT 10;

CREATE TABLE rank_state1
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 11-ROW_NUMBER() OVER (ORDER BY t.avg_score) AS points from srank1 t;



CREATE TABLE srank2 AS SELECT scores.state, AVG(CAST(score AS INT)) as avg_score FROM scores WHERE measure_id = "OP_5" AND score != "Not Available" GROUP BY scores.state ORDER BY avg_score LIMIT 10;

CREATE TABLE rank_state2
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 11-ROW_NUMBER() OVER (ORDER BY t.avg_score) AS points from srank2 t;



CREATE TABLE srank3 AS SELECT scores.state, AVG(CAST(score AS INT)) as avg_score FROM scores WHERE measure_id = "OP_2" AND score != "Not Available" GROUP BY scores.state ORDER BY avg_score DESC LIMIT 10;

CREATE TABLE rank_state3
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 11-ROW_NUMBER() OVER (ORDER BY t.avg_score DESC) AS points from srank3 t;



CREATE TABLE srank4 AS SELECT scores.state, AVG(CAST(score AS INT)) as avg_score FROM scores WHERE measure_id = "OP_4" AND score != "Not Available" GROUP BY scores.state ORDER BY avg_score DESC LIMIT 10;

CREATE TABLE rank_state4
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 11-ROW_NUMBER() OVER (ORDER BY t.avg_score DESC) AS points from srank4 t;



CREATE TABLE srank5 AS SELECT scores.state, AVG(CAST(score AS INT)) as avg_score FROM scores WHERE measure_id = "ED_1b" AND score != "Not Available" GROUP BY scores.state ORDER BY avg_score LIMIT 10;

CREATE TABLE rank_state5
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 11-ROW_NUMBER() OVER (ORDER BY t.avg_score) AS points from srank5 t;



CREATE TABLE srank6 AS SELECT scores.state, AVG(CAST(score AS INT)) as avg_score FROM scores WHERE measure_id = "OP_20" AND score != "Not Available" GROUP BY scores.state ORDER BY avg_score LIMIT 10;

CREATE TABLE rank_state6
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 11-ROW_NUMBER() OVER (ORDER BY t.avg_score) AS points from srank6 t;



CREATE TABLE srank7 AS SELECT scores.state, AVG(CAST(score AS INT)) as avg_score FROM scores WHERE measure_id = "OP_22" AND score != "Not Available" GROUP BY scores.state ORDER BY avg_score LIMIT 10;

CREATE TABLE rank_state7
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 11-ROW_NUMBER() OVER (ORDER BY t.avg_score) AS points from srank7 t;



CREATE TABLE srank8 AS SELECT scores.state, AVG(CAST(score AS INT)) as avg_score FROM scores WHERE measure_id = "OP_23" AND score != "Not Available" GROUP BY scores.state ORDER BY avg_score DESC LIMIT 10;

CREATE TABLE rank_state8
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 11-ROW_NUMBER() OVER (ORDER BY t.avg_score DESC) AS points from srank8 t;



CREATE TABLE srank9 AS SELECT scores.state, AVG(CAST(score AS INT)) as avg_score FROM scores WHERE measure_id = "IMM_2" AND score != "Not Available" GROUP BY scores.state ORDER BY avg_score DESC LIMIT 10;

CREATE TABLE rank_state9
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 11-ROW_NUMBER() OVER (ORDER BY t.avg_score DESC) AS points from srank9 t;



CREATE TABLE srank10 AS SELECT scores.state, AVG(CAST(score AS INT)) as avg_score FROM scores WHERE measure_id = "IMM_3_FAC_ADHPCT" AND score != "Not Available" GROUP BY scores.state ORDER BY avg_score DESC LIMIT 10;

CREATE TABLE rank_state10
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 11-ROW_NUMBER() OVER (ORDER BY t.avg_score DESC) AS points from srank10 t;


CREATE TABLE srank11 AS SELECT scores.state, AVG(CAST(score AS INT)) as avg_score FROM scores WHERE measure_id = "STK_4" AND score != "Not Available" GROUP BY scores.state ORDER BY avg_score DESC LIMIT 10;

CREATE TABLE rank_state11
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 11-ROW_NUMBER() OVER (ORDER BY t.avg_score DESC) AS points from srank11 t;



CREATE TABLE srank12 AS SELECT scores.state, AVG(CAST(score AS INT)) as avg_score FROM scores WHERE measure_id = "VTE_6" AND score != "Not Available" GROUP BY scores.state ORDER BY avg_score LIMIT 10;

CREATE TABLE rank_state12
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 11-ROW_NUMBER() OVER (ORDER BY t.avg_score) AS points from srank12 t;



CREATE TABLE srank13 AS SELECT scores.state, AVG(CAST(score AS INT)) as avg_score FROM scores WHERE measure_id = "VTE_5" AND score != "Not Available" GROUP BY scores.state ORDER BY avg_score DESC LIMIT 10;

CREATE TABLE rank_state13
STORED as ORC TBLPROPERTIES('transactional'='true')
AS SELECT *, 11-ROW_NUMBER() OVER (ORDER BY t.avg_score DESC) AS points from srank13 t;



-- Combine all the states that we generated
CREATE TABLE all_states AS 
SELECT state, points FROM rank_state1 UNION ALL 
SELECT state, points from rank_state2 UNION ALL 
SELECT state, points from rank_state3 UNION ALL 
SELECT state, points from rank_state4 UNION ALL 
SELECT state, points from rank_state5 UNION ALL 
SELECT state, points from rank_state6 UNION ALL 
SELECT state, points from rank_state7 UNION ALL 
SELECT state, points from rank_state8 UNION ALL 
SELECT state, points from rank_state9 UNION ALL 
SELECT state, points from rank_state10 UNION ALL 
SELECT state, points from rank_state11 UNION ALL 
SELECT state, points from rank_state12 UNION ALL 
SELECT state, points from rank_state13;

-- Sum the score of the states ranking table, and group by states
CREATE TABLE best_states AS 
SELECT state, SUM(points) AS total_score FROM all_states 
GROUP BY state 
ORDER BY total_score DESC LIMIT 10;


-- Final output that is displayed
SELECT * FROM best_states;
