#!/bin/bash

# Obtener la salida del comando last
last_output=$(last)

# Filtrar las líneas que contienen una dirección IP utilizando egrep
egrep '([1-9]{1,3}\.){3}[1-9]{1,3}' <<< "$last_output" 
