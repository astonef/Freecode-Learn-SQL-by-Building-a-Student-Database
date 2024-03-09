#/bin/bash

#Sono al 1700

echo -e "\033[31m\n~~ My\033[0m\033[34m\n Computer\033[0m\033[32m\n  Science\033[0m\033[36m\n   Students ~~\033[0m\n"

PSQL="psql -X --username=postgres --dbname=students --no-align --tuples-only -c"

echo -e "\033[95m\nName, last name, e GPA degli studenti con un GPA pari a 4.0:\033[0m\n"

echo "$($PSQL "select first_name, last_name, gpa from students where gpa = 4.0")"

echo -e "\033[94m\nTutti i nomi dei corsi la cui prima lettera è precedente la 'D' nell'alfabeto:\033[0m\n"

echo "$($PSQL "select * from majors where major < 'D';")"

echo -e "\033[35m\nNome, cognome e media dei voti degli studenti il cui cognome inizia con una 'R' o successiva e hanno una media voti uguale o superiore a 3.8 o inferiore a 2.0:\033[0m\n"

echo "$($PSQL "select * from students where last_name > 'R' and (gpa >= 3.8 or gpa < 2.0);")"

echo -e "\033[36m\nCognome degli studenti il cui cognome contiene, in modo insensibile al maiuscolo o minuscolo, 'sa' o hanno una 'r' come penultima lettera:\033[0m\n"

echo "$($PSQL "select * from students where last_name ilike '%sa%' or last_name like '%r_';")"
