#!/bin/bash
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -mkdir /user/w205/hospital_compare/surveys
wait
wget -O data.zip https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip
wait
unzip data.zip -d dst
wait
mv dst/Hospital\ General\ Information.csv hospitals1.csv
mv dst/Timely\ and\ Effective\ Care\ -\ Hospital.csv effective_care1.csv
mv dst/Readmissions\ and\ Deaths\ -\ Hospital.csv readmissions1.csv
mv dst/Measure\ Dates.csv measures1.csv
mv dst/hvbp_hcahps_05_28_2015.csv surveys1.csv
wait
rm -rf data.zip
rm -rf dst
tail -n +2 hospitals1.csv > hospitals.csv
tail -n +2 effective_care1.csv > effective_care.csv
tail -n +2 readmissions1.csv > readmissions.csv
tail -n +2 measures1.csv > measures.csv
tail -n +2 surveys1.csv > surveys.csv
rm -rf *1.csv
hdfs dfs -put hospitals.csv /user/w205/hospital_compare/hospitals
hdfs dfs -put effective_care.csv /user/w205/hospital_compare/effective_care
hdfs dfs -put readmissions.csv /user/w205/hospital_compare/readmissions
hdfs dfs -put measures.csv /user/w205/hospital_compare/measures
hdfs dfs -put surveys.csv /user/w205/hospital_compare/surveys
