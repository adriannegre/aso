#!/bin/bash

numero=$1

if [[ $numero -le 1 ]]; then
  echo "$numero no es un número primo."
  exit 1
fi

es_primo=1

for ((i=2; i*i<=$numero; i++)); do
  if [[ $((numero % i)) -eq 0 ]]; then
    es_primo=0
    break
  fi
done

if [[ $es_primo -eq 1 ]]; then
  echo "$numero es un número primo."
else
  echo "$numero no es un número primo."
fi
