#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Error: Se debe proporcionar un directorio como argumento."
  exit 1
fi

directorio=$1

if [ ! -d "$directorio" ]; then
  echo "Error: El directorio '$directorio' no existe."
  exit 1
fi

total_entradas=0

for entrada in "$directorio"/*; do
  total_entradas=$((total_entradas + 1))

  if [ -f "$entrada" ]; then
    echo "Fichero: $entrada"
  elif [ -d "$entrada" ]; then
    echo "Directorio: $entrada"
  else
    echo "Otro: $entrada"
  fi
done

echo "Total de entradas procesadas: $total_entradas"