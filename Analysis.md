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

Only 14 of the rows actually saved. To query which ones did save, I will look in the file and see which passed and which failed.


