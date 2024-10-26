#!/bin/bash

suma=0
i=1

while (( i <= 1000 )); do
  ((suma += i))
  ((i++))
done

echo "La suma de los números del 1 al 1000 utilizando 'while' es: $suma"