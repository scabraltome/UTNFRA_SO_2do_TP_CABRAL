#!/bin/bash
# Desarrollo del Punto A - LVM
sudo pvcreate /dev/sdb /dev/sdc
sudo vgcreate vg_datos /dev/sdb /dev/sdc
sudo lvcreate -L 1.5G -n lv_compartido vg_datos
sudo lvcreate -l 100%FREE -n lv_datos vg_datos
sudo mkfs.ext4 /dev/vg_datos/lv_compartido
sudo mkfs.ext4 /dev/vg_datos/lv_datos
sudo mkdir -p /mnt/compartido
sudo mkdir -p /mnt/datos
sudo mount /dev/vg_datos/lv_compartido /mnt/compartido
sudo mount /dev/vg_datos/lv_datos /mnt/datos
