#!/bin/bash

organization=$(cat organization.txt)
read -p "Instructor github id: " instructor_id
read -s -p "Instructor github password: " instructor_password
echo

mkdir -p students

grep -v "#" students.csv | cut -f 3 | grep -v "^$" > students.txt
github_ids=$(cat students.txt)

for student_id in ${github_ids}; do

    echo ${student_id}     > students/${student_id}.txt
    echo ${instructor_id} >> students/${student_id}.txt 
    teachers_pet add_to_team --members students/${student_id}.txt --organization=${organization} --username=${instructor_id} --password=${instructor_password}

done
