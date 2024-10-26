#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Error: Debes proporcionar un número como parámetro."
  exit 1
fi

n="$1"

for i in {1..10}; do
  resultado=$(( i * n ))
  echo "$i x $n = $resultado"
done

exit 0