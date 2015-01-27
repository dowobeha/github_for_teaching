#!/bin/bash

organization=$(cat organization.txt)
read -p "Homework name: " homework
read -p "Instructor github id: " instructor_id
read -s -p "Instructor github password: " instructor_password
echo


teachers_pet create_repos --students=students.txt --organization=${organization} --repository=${homework} --username=${instructor_id} --password=${instructor_password}

cd ${homework}.git && teachers_pet push_files --students=../students.txt --organization=${organization} --repository=${homework} --username=${instructor_id} --password=${instructor_password}

