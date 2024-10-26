#!/bin/bash
ls /etc > listado_etc.txt
cat listado_etc.txt
echo "Número de líneas: $(wc -l < listado_etc.txt)"
echo "Número de palabras: $(wc -w < listado_etc.txt)"