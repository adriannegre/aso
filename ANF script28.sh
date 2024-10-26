#!/bin/bash

# Función para obtener información de la red
obtener_info_red() {
  # Obtener la dirección IP y la máscara de subred
  ip=$(ip addr show | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)
  mascara=$(ip addr show | grep 'inet ' | awk '{print $2}' | cut -d/ -f2)

  # Convertir la máscara de subred a formato decimal punteado
  mascara_decimal=$(echo $(( 2**(32 - $mascara) - 1 )) | awk '{ printf "%d.%d.%d.%d\n", ($1/16777216)%256, ($1/65536)%256, ($1/256)%256, $1%256 }')

  # Calcular la dirección de red usando operaciones bit a bit
  red=$(printf "%d.%d.%d.%d\n" $(($(( $(echo $ip | cut -d. -f1) << 24 )) & $(echo $mascara_decimal | cut -d. -f1) << 24)) $(($(( $(echo $ip | cut -d. -f2) << 16 )) & $(echo $mascara_decimal | cut -d. -f2) << 16)) $(($(( $(echo $ip | cut -d. -f3) << 8  )) & $(echo $mascara_decimal | cut -d. -f3) << 8)) $(($(( $(echo $ip | cut -d. -f4)       )) & $(echo $mascara_decimal | cut -d. -f4)      )))

  # Calcular la dirección de broadcast usando operaciones bit a bit
  broadcast=$(printf "%d.%d.%d.%d\n" $(( $(echo $red | cut -d. -f1) | $(echo $mascara_decimal | cut -d. -f1) ^ 255 )) $(( $(echo $red | cut -d. -f2) | $(echo $mascara_decimal | cut -d. -f2) ^ 255 )) $(( $(echo $red | cut -d. -f3) | $(echo $mascara_decimal | cut -d. -f3) ^ 255 )) $(( $(echo $red | cut -d. -f4) | $(echo $mascara_decimal | cut -d. -f4) ^ 255 )))

  # Mostrar la información de la red
  echo "Información de la red:"
  echo "  Rango CIDR: $ip/$mascara"
  echo "  Dirección de red: $red"
  echo "  Dirección de broadcast: $broadcast"
  echo "  Máscara de subred: $mascara_decimal"
}

# Función para verificar si una IP está libre (sin cambios)
verificar_ip() {
  ping -c 1 -W 1 "$1" > /dev/null 2>&1
  if [[ $? -eq 0 ]]; then
    echo "  $1: En uso"
  else
    echo "  $1: Libre"
  fi
}

# Función para generar el informe de IPs libres (sin cambios)
generar_informe() {
  obtener_info_red

  ultimo_octeto=$(echo $ip | cut -d. -f4)

  echo "Listado de IPs:"
  for i in $(seq 1 254); do
    ip_completa=$(echo $ip | sed "s/$ultimo_octeto/$i/")
    verificar_ip $ip_completa
  done
}

# Generar el informe
generar_informe