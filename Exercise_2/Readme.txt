Instructions on how to run the Faria_W205 Twitter Application:

Step 1: Connect to the specified AMI and clone the Github Repository MIDS-INFO-W18/w205_2017_fall/Exercise_2. Start hadoop and postgres by typing ("/root/start-hadoop.sh" and "/data/start_postgres.sh") 

Step 2: Enter the Exercise 2/extweetwordcount directory

Step 3: Type: "sparse run" --> This will run the topology and write the output of the application to the PostgreSQL database. Note: The program will continue running (obtaining a livestream tweets) until you stop it by hitting Control + c.

Step 4: You can now query the database using the finalresults.py and histogram.py files. In order to do this, first change your directory back to Exercise_2

Step 5: Now, in order to run the finalresults.py file, type "python finalresults.py" and specificy a word after this command in the same line (e.g., "python finalresults.py hello"). If you don't specify a word here, the program will return all the words in the database and their counts in alphabetical order.

Step 6: In order to run the histogram.py file, write the command to run and specify two integers (e.g., "python histogram.py 1,4"). The program will return all words and counts for words that have counts which fall in the range you've specified.

Step 7: Additionally, if you would like to output a bar chart of the top 20
words (in terms of count) in the database, you can run the "Plot.py" file by
typing "python Plot.py". This will output a file called Plot.png which you can
then open by copying to your local hard drive. 
