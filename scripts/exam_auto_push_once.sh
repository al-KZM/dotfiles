#!/bin/bash

exam_dir="/home/eyal/documents/university/courses_notes/java_1/Exam/brouillons"


 git -C $exam_dir pull origin master
 git -C $exam_dir add .
 git -C $exam_dir commit -m "routine"
 git -C $exam_dir push origin master --force
