#!/bin/bash


find . -type f -perm -777 -exec ls -l {} \; | awk '{print $9 " " $1}' > archivos_peligrosos.txt
