#!/bin/bash

numero_secreto=42

while true; do
  read -p "Adivina un número entre 1 y 100 (o ingresa 0 para rendirte): " numero_ingresado

  if [[ $numero_ingresado -eq 0 ]]; then
    echo "Te rindes. El número secreto era $numero_secreto."
    break
  fi

  if [[ $numero_ingresado -eq $numero_secreto ]]; then
    echo "¡Felicidades! Adivinaste el número."
    break
  fi

  if [[ $numero_ingresado -lt $numero_secreto ]]; then
    echo "El número secreto es mayor."
  else
    echo "El número secreto es menor."
  fi
done