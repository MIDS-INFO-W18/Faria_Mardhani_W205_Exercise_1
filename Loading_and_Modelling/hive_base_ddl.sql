CREATE EXTERNAL TABLE IF NOT EXISTS hospitals_raw (
        provider_id INT,
        hospital_name STRING,
        address STRING,
        city STRING,
        state STRING,
        zipcode INT,
        county_name STRING,
        phone INT,
        hospital_type STRING,
        hospital_ownership STRING,
        emergency_services STRING)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION 'hdfs:/user/w205/hospital_compare/hospitals';



CREATE EXTERNAL TABLE IF NOT EXISTS procedures_raw (
        measure_name STRING,
        measure_id STRING,
        measure_start_qtr STRING,
        measure_start_date DATE,
        measure_end_qtr STRING,
        measure_end_date DATE)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION 'hdfs:/user/w205/hospital_compare/measures';



CREATE EXTERNAL TABLE IF NOT EXISTS surveys_raw (
        provider_number INT,
        hospital_name STRING,
        address STRING,
        city STRING,
        state STRING,
        zipcode INT,
        county_name STRING,
        nurses_a STRING,
        nurses_i STRING,
        nurses_d STRING,
        doctors_a STRING,
        doctors_i STRING,
        doctors_d STRING,
        responsiveness_a STRING,
        responsiveness_i STRING,
        responsiveness_d STRING,
        pain_a STRING,
        pain_i STRING,
        pain_d STRING,
        meds_a STRING,
        meds_i STRING,
        meds_d STRING,
        clean_a STRING,
        clean_i STRING,
        clean_d STRING,
        discharge_a STRING,
        discharge_i STRING,
        discharge_d STRING,
        overall_a STRING,
        overall_i STRING,
        overall_d STRING,
        base_score INT,
        consistency_score INT)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION 'hdfs:/user/w205/hospital_compare/surveys';



CREATE EXTERNAL TABLE IF NOT EXISTS timely_raw (
        provider_id INT,
        hospital_name STRING,
        address STRING,
        city STRING,
        state STRING,
        zipcode INT,
        county STRING,
        phone INT,
        condition STRING,
        measure_id STRING,
        measure_name STRING,
        score INT,
        sample INT,
        footnote STRING,
        measure_start_date DATE,
        measure_end_date DATE)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION 'hdfs:/user/w205/hospital_compare/effective_care';



CREATE EXTERNAL TABLE IF NOT EXISTS readmissions_raw (
        provider_id INT,
        hospital_name STRING,
        address STRING,
        city STRING,
        state STRING,
        zipcode INT,
        county STRING,
        phone INT,
        measure_name STRING,
        measure_id STRING,
        compared_to_national STRING,
        denominator INT,
        score FLOAT,
        lower_estimate FLOAT,
        higher_estimate FLOAT,
        footnote STRING,
        measure_start_date DATE,
        measure_end_date DATE)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION 'hdfs:/user/w205/hospital_compare/readmissions';


