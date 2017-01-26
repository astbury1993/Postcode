== ANALYSIS

25th January 2017 - Log 1 by Curtis Astbury

I created a test of some data using the db:seed technique. db:seed allows you to run a ruby file called seed.rb. In this file, I grab a csv containing the records shown below and this will try to create records in my Import model. My Import model contains some validation on the field :text using the regular expression provided. 

$%± ()() 
XX XXX 
A1 9A 
LS44PL
Q1A 9AA 
V1A 9AA 
X1A 9BB 
LI10 3QP 
LJ10 3QP 
LZ10 3QP 
A9Q 9AA 
AA9C 9AA 
FY10 4PL 
SO1 4QQ 
EC1A 1BB 
W1A 0AX 
M1 1AE 
B33 8TH 
CR2 6XH 
DN55 1PT 
GIR 0AA 
SO10 9AA 
FY9 9AA 
WC1A 9AA 

After submitting the command db:seed, I added a line to count the about of rows that were added to the table:

There are now 14 rows in the import table.

Only 14 of the rows actually saved. To query which ones did save, I will look in the model and see which passed and which failed. I was expecting 10 records to save and 14 to fail, so I need to figure out what has actually happened.


26th January 2017 - Log 2 by Curtis Astbury

I have produced a quick HTML doc to display all entries in my Import model. These are shown below:

LI10 3QP
LJ10 3QP
LZ10 3QP
FY10 4PL
SO1 4QQ
EC1A 1BB
M1 1AE
B33 8TH
CR2 6XH
DN55 1PT
GIR 0AA
SO10 9AA
FY9 9AA
WC1A 9AA

Meaning the below failed:

$%± ()() 
XX XXX 
A1 9A 
LS44PL
Q1A 9AA 
V1A 9AA 
X1A 9BB 
A9Q 9AA 
AA9C 9AA 
FY10 4PL 

My analysis here is that the Regular Expression provided in the technical task had to be altered slightly from the original due to an invalid lookbehind. The difference here is that ?<! was replaced with ?! 
The new Regex is:

/(GIR\s0AA)|((([A-PR-UWYZ][0-9][0-9]?)|(([A-PR-UWYZ][A-HK-Y][0-9](?!(BR|FY|HA|HD|HG|HR|HS|HX|JE|LD|SM|SR|WC|WN|ZE)[0-9])[0-9])|([A-PR-UWYZ][A-HK-Y](?!AB|LL|SO)[0-9]) |(WC[0-9][A-Z]) |(([A-PR-UWYZ][0-9][A-HJKPSTUW]) |([A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY]))))\s[0-9][ABD-HJLNP-UW-Z]{2})/


I have now created a new model for the failed records to be saved into. I have also adapted the seed file so that I can view what has failed and what has been saved, as shown below:

, $%± ()() failed
, XX XXX failed
, A1 9A failed
, LS44PL failed
, Q1A 9AA failed
, V1A 9AA failed
, X1A 9BB failed
, LI10 3QP saved
, LJ10 3QP saved
, LZ10 3QP saved
, A9Q 9AA failed
, AA9C 9AA failed
, FY10 4PL saved
, SO1 4QQ saved
, EC1A 1BB saved
, W1A 0AX failed
, M1 1AE saved
, B33 8TH saved
, CR2 6XH saved
, DN55 1PT saved
, GIR 0AA saved
, SO10 9AA saved
, FY9 9AA saved
, WC1A 9AA saved
There are now 14 rows in the import table
There are now 10 rows in the failed table



