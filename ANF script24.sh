#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Error: Se debe proporcionar un directorio como argumento."
  exit 1
fi

directorio=$1

if [ ! -d "$directorio" ]; then
  echo "Error: '$directorio' no existe o no es un directorio."
  exit 1
fi

num_ficheros=0
num_subdirectorios=0

for entrada in "$directorio"/*; do
  if [ -f "$entrada" ]; then
    num_ficheros=$((num_ficheros + 1))
  elif [ -d "$entrada" ]; then
    num_subdirectorios=$((num_subdirectorios + 1))
  fi
done

echo "Estadísticas del directorio '$directorio':"
echo "Ficheros: $num_ficheros"
echo "Subdirectorios: $num_subdirectorios"