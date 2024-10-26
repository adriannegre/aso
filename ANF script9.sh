#!/bin/bash

echo "Menú de Operaciones Matemáticas"
echo "1. Sumar"
echo "2. Restar"
echo "3. Multiplicar"
echo "4. Dividir"
echo "5. Salir"

read -p "Elige una opción: " opcion

case $opcion in
  1) # Sumar
    read -p "Introduce el primer número: " num1
    read -p "Introduce el segundo número: " num2
    resultado=$((num1 + num2))
    echo "La suma de $num1 y $num2 es: $resultado"
    ;;
  2) # Restar
    read -p "Introduce el primer número: " num1
    read -p "Introduce el segundo número: " num2
    resultado=$((num1 - num2))
    echo "La resta de $num1 y $num2 es: $resultado"
    ;;
  3) # Multiplicar
    read -p "Introduce el primer número: " num1
    read -p "Introduce el segundo número: " num2
    resultado=$((num1 * num2))
    echo "La multiplicación de $num1 y $num2 es: $resultado"
    ;;
  4) # Dividir
    read -p "Introduce el primer número: " num1
    read -p "Introduce el segundo número: " num2
    # Controlar la división por cero
    if [[ $num2 -eq 0 ]]; then
      echo "Error: No se puede dividir por cero."
    else
      resultado=$((num1 / num2))
      echo "La división de $num1 y $num2 es: $resultado"
    fi
    ;;
  5) # Salir
    echo "Saliendo..."
    exit 0
    ;;
  *) # Opción inválida
    echo "Opción inválida."
    ;;
esac
