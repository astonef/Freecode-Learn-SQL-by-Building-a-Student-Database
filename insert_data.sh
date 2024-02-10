#!/bin/bash 
# Sono a 568 da fare

cat courses.csv | while IFS=',' read MAJOR COURSE
do

PSQL="psql -X --username=postgres --dbname=students --no-align --tuples-only -c"

  # get major_id
  MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR';")
echo $MAJOR_ID 

# if not found

  # insert major

  # get new major_id

  # get course_id

  # if not found

  # insert course

  # get new course_id

  # insert into majors_courses

done	



