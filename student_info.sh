#/bin/bash

#Sono a 2330

echo -e "\033[31m\n~~ My\033[0m\033[34m\n Computer\033[0m\033[32m\n  Science\033[0m\033[36m\n   Students ~~\033[0m\n"

PSQL="psql -X --username=postgres --dbname=students --no-align --tuples-only -c"

echo -e "\033[95m\nName, last name, e GPA degli studenti con un GPA pari a 4.0:\033[0m\n"

echo "$($PSQL "select first_name, last_name, gpa from students where gpa = 4.0")"

echo -e "\033[94m\nTutti i nomi dei corsi la cui prima lettera è precedente la 'D' nell'alfabeto:\033[0m\n"

echo "$($PSQL "select * from majors where major < 'D'")"

echo -e "\033[35m\nNome, cognome e media dei voti degli studenti il cui cognome inizia con una 'R' o successiva e hanno una media voti uguale o superiore a 3.8 o inferiore a 2.0:\033[0m\n"

echo "$($PSQL "select * from students where last_name > 'R' and (gpa >= 3.8 or gpa < 2.0)")"

echo -e "\033[36m\nCognome degli studenti il cui cognome contiene, in modo insensibile al maiuscolo o minuscolo, 'sa' o hanno una 'r' come penultima lettera:\033[0m\n"

echo "$($PSQL "select * from students where last_name ilike '%sa%' or last_name like '%r_'")"

echo -e "\033[32m\nNome, cognome e GPA degli studenti che non hanno scelto una facoltà e il cui nome inizia per 'D' (o successiva) o hanno un GPA superiore a 3.0:\033[0m\n"

echo "$($PSQL "select first_name, last_name, gpa from students where major_id is null and (first_name >'B' and gpa > 3.0)")"

echo -e "\033[31m\nNome del corso dei primi cinque corsi, in ordine alfabetico inverso, che hanno una 'e' come seconda lettera o terminano con una 's':\033[0m\n"

echo "$($PSQL "select course from courses where course like '_e%' or course like '%s' order by course desc")"

echo -e "\033[38;2;255;105;180m\nMedia del GPA di tutti gli studenti arrotondata a due cifre decimali:\033[0m\n"

echo "$($PSQL "select round(avg(gpa),2) from students")"

echo -e "\033[38;2;70;85;100m\nMajor ID, numero totale di studenti in una colonna denominata 'numero_di_studenti' e GPA medio arrotondato a due cifre decimali in una colonna denominata 'gpa_medio_errotondato', per ogni Major ID nella tabella degli studenti che ha un conteggio studenti superiore a 1:\033[0m\n"

echo "$($PSQL "select major_id, ROUND(avg(gpa), 2) as gpa_medio_arrotondato, COUNT(*) as numero_di_studenti from students group by major_id having COUNT(*) > 1")"

echo -e "\033[38;2;102;255;100m\nLista delle facoltà, in ordine alfabetico, che nessuno studente sta frequentando o che ha uno studente il cui nome contiene, in modo insensibile al maiuscolo o minuscolo, 'ma':\033[0m\n"

echo "$($PSQL "select major from students full join majors ON majors.major_id = students.major_id where major is not null and (student_id is null or first_name ilike '%ma%') order by
 major")"
