#!/bin/bash

# tp
# Pone el touchpad en on/off.

# Ubuntu Peronista 

# Obtiene el Identificador del touchpad.
tp_id=`xinput list | grep -i touchpad | awk '{ print $6 }' | sed 's/id=//'`


# Se fija si el touchpad estaba activado o no.
tp_enabled=`xinput list-props $tp_id | grep Device\ Enabled | awk '{ print $4 }'`


if [ $tp_enabled = 0 ]
then
  # Si el touchpad estaba desactivado, le da gimonte.
  xinput set-prop $tp_id "Device Enabled" 1
  notify-send "Touchpad activado"
elif [ $tp_enabled = 1 ]
then
  # Si el touchad estaba activo, lo apaga.
  xinput set-prop $tp_id "Device Enabled" 0
  notify-send "Touchpad desactivado"
else
  echo "tp_toggle: No se pudo obtener el status del touchpad desde xinput."
  exit 1
fi
