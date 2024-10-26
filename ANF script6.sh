#!/bin/bash
read -p "Introduce una palabra: " palabra
echo "$palabra" >> lista.txt
echo "La palabra '$palabra' se ha añadido al archivo lista.txt."