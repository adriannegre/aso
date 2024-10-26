#!/bin/bash

archivo="lista.txt"

function mostrar_menu {
  echo "===== AGENDA ====="
  echo "1. Añadir contacto"
  echo "2. Buscar contacto"
  echo "3. Listar contactos"
  echo "4. Ordenar contactos"
  echo "5. Borrar archivo"
  echo "0. Salir"
}

function añadir_contacto {
  read -p "Nombre: " nombre
  read -p "Dirección: " direccion
  read -p "Teléfono: " telefono
  echo "$nombre,$direccion,$telefono" >> "$archivo"
  echo "Contacto añadido."
}

function buscar_contacto {
  echo "Buscar por:"
  echo "1. Nombre"
  echo "2. Dirección"
  echo "3. Teléfono"
  read -p "Opción: " opcion_busqueda

  case $opcion_busqueda in
    1) campo="nombre";;
    2) campo="direccion";;
    3) campo="telefono";;
    *) echo "Opción inválida."; return;;
  esac

  read -p "Valor a buscar: " valor_busqueda

  grep "$valor_busqueda" "$archivo" | cut -d ',' -f $opcion_busqueda
}

function listar_contactos {
  if [[ -f "$archivo" ]]; then
    cat "$archivo"
  else
    echo "El archivo '$archivo' no existe."
  fi
}

function ordenar_contactos {
  if [[ -f "$archivo" ]]; then
    sort -t ',' -k 1 "$archivo" > temp.txt && mv temp.txt "$archivo"
    echo "Contactos ordenados."
  else
    echo "El archivo '$archivo' no existe."
  fi
}

function borrar_archivo {
  read -p "¿Estás seguro de borrar el archivo? (s/n): " confirmar
  if [[ "$confirmar" == "s" ]]; then
    rm "$archivo"
    echo "Archivo borrado."
  else
    echo "Borrado cancelado."
  fi
}

while true; do
  mostrar_menu
  read -p "Opción: " opcion

  case $opcion in
    1) añadir_contacto;;
    2) buscar_contacto;;
    3) listar_contactos;;
    4) ordenar_contactos;;
    5) borrar_archivo;;
    0) exit 0;;
    *) echo "Opción inválida.";;
  esac

  echo ""
done