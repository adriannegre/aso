#!/bin/bash
if [ -z "$1" ]; then
  echo "Error: Debes proporcionar un directorio como parámetro."
  exit 1
fi

fecha=$(date +%Y-%m-%d)
directorio="$1"
nombre_archivo="${fecha}_${directorio}.tar.gz"
tar -czvf "$nombre_archivo" "$directorio"
echo "El directorio '$directorio' se ha comprimido en el archivo '$nombre_archivo'."