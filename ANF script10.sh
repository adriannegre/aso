#!/bin/bash

read -p "Introduce un número: " numero

if [[ $((numero % 2)) -eq 0 ]]; then
  echo "El número $numero es par."
else
  echo "El número $numero es impar."
fi