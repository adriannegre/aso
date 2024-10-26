#!/bin/bash
read -p "Introduce el primer número: " num1
read -p "Introduce el segundo número: " num2
if [[ $num1 -gt $num2 ]]; then
  echo "El número mayor es: $num1"
elif [[ $num2 -gt $num1 ]]; then
  echo "El número mayor es: $num2"
else
  echo "Los números son iguales."
fi
