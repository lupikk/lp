#!/bin/bash
echo "1. Ubah Wallpaper"
echo "2. Ubah Icon"
echo "3. Ubah Tema"
echo "4. Tambah User"
echo "Pilih nomer berapa?"
read in

if [ $in -eq 1 ] 
then
	echo "Masukkan lokasi gambar yang akan dijadikan Wallpaper:"
	read input
	gsettings set org.gnome.desktop.background picture-uri "file://$input"
elif [ $in -eq 2 ]
then
	echo "Masukkan lokasi file yang akan diubah Iconnya: "
	read input
	echo "Masukkan lokasi file yang akan dijadikan Icon barunya: "
	read input2
	gvfs-set-attribute -t string "$input" metadata::custom-icon "file://$input2"
elif [ $in -eq 3 ]
then
	echo "Masukkan nama tema yang akan digunakan: "
	read input
	gsettings set org.gnome.desktop.interface gtk-theme "$input"
else
	echo "Masukkan username: "
	read nama
	sudo useradd -m "$nama"
	sudo passwd "$nama"
fi
