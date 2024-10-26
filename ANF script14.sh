#!/bin/bash

if [[ $# -lt 4 ]] || [[ $# -gt 5 ]]; then
  echo "Error. La sintaxis correcta es ./ANF script14.sh alta/baja nombre apellido1 apellido2 [grupo]"
  exit 1
fi

accion="$1"
nombre="$2"
apellido1="$3"
apellido2="$4"
grupo="$5"

id_usuario="alu${apellido1:0:2}${apellido2:0:2}${nombre:0:1}"

case "$accion" in
  alta)
    if [[ -z "$grupo" ]]; then
      grupo="$id_usuario"
      groupadd "$grupo"
    fi

    useradd -m -g "$grupo" -d "/home/$id_usuario" "$id_usuario"

    passwd "$id_usuario"

    echo "Usuario '$id_usuario' creado correctamente en el grupo '$grupo'."
    ;;

  baja)
    userdel -r "$id_usuario"

    echo "Usuario '$id_usuario' eliminado correctamente."
    ;;

  *)
    echo "Error. La sintaxis correcta es ./ANF script14.sh alta/baja nombre apellido1 apellido2 [grupo]"
    exit 1
    ;;
esac

exit 0