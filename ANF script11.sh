#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Error: Debes proporcionar dos parámetros: el archivo de origen y el archivo de destino."
  exit 1
fi

origen="$1"
destino="$2"

if [[ ! -f "$origen" ]]; then
  echo "Error: El archivo de origen '$origen' no existe o no es un archivo ordinario."
  exit 1
fi

if [[ -e "$destino" ]]; then
  echo "Error: Ya existe un archivo o directorio con el nombre '$destino'."
  exit 1
fi

cp "$origen" "$destino"

echo "El archivo '$origen' se ha copiado correctamente a '$destino'."