#!/bin/bash

existe() {
  if [[ -e "$1" ]]; then
    echo "El archivo $1 existe."
    chmod u+x "$1"
  else
    echo "El archivo $1 no existe."
  fi
}

if [[ -z "$1" ]]; then
  echo "Error: Debe proporcionar un nombre de archivo como parámetro."
  exit 1
fi

existe "$1"