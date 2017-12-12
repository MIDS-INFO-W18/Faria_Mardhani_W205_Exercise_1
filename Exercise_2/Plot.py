import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt; plt.rcdefaults()
import numpy as np
import matplotlib.pyplot as plt
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()
cur.execute("Select word, count from tweetwordcount order by count desc limit 20")
records = cur.fetchall()

print(len(records))

words = []

counts = []

for rec in records:
	words.append(rec[0])
	counts.append(rec[1])

y_pos = np.arange(len(records))

fig = plt.figure()

plt.bar(y_pos, counts, align='center', alpha=0.5)
plt.xticks(y_pos, words, rotation=90)
plt.ylabel('Count')
plt.title('Counts of Top 20 Words in Twitter Livestream')

plt.show()

fig.savefig('plot.png')

conn.commit()
conn.close()
