import sys
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

if len(sys.argv) not in [1, 2]:	
	print "Too many or too few arguments"
	exit(1)

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()


if len(sys.argv) == 1:
	cur.execute("select word, count FROM tweetwordcount ORDER BY word")
	records = cur.fetchall()
	for rec in records:
   		print "(<{}>, {})".format(rec[0], rec[1])

elif len(sys.argv) == 2:
	word = sys.argv[1]
	cur.execute("SELECT word, count from tweetwordcount WHERE word=%s", (word,))
	records = cur.fetchall()
	for rec in records:
   		print 'Total number of occurrences of "{}": {}'.format(rec[0], rec[1])
	

conn.commit()

conn.close()

