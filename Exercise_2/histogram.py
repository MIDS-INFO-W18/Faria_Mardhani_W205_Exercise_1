import sys
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

if len(sys.argv) != 2:	
	print "Too many or too few arguments"
	exit(1)

range = sys.argv[1]
range2 = range.split(",")

if len(range2) !=2:
	print "Too many or too few range arguments"
	exit(1)

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

low = range2[0]
high = range2[1]
 
cur.execute("select word, count from tweetwordcount where count between %s and %s order by word" % (low, high))
records = cur.fetchall()
for rec in records:
   	print "<{}>: {}".format(rec[0], rec[1])

conn.commit()

conn.close()

