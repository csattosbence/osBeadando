#! /bin/bash

#Jelenlegi dátum 
now=$(date +"%B")

#A directory neve
dir_name="Dump_""$now"

#Letöltés directory-ban található fájlok neve
file_names=($(ls ~/Downloads))

#Letöltésben található fájlok száma
elements=${#file_names[*]}

#ha a fájlok neve között nem szerepel a directory neve
#akkor hozzuk létre
if [[ ${file_names[@]}  == !"$dir_name" ]]; then
	mkdir "$dir_name"
fi

#Az áthelyezéshez szükséges cél paraméter
target_dir="~/Downloads/""${dir_name}/"

#Ha a fájlok  i-dik eleme nem a direcotry neve akkor helyezzük át
for ((i=1;i < $elements ;i++)) {
        if [ ${file_names[$i]} == !"$dir_name" ]; then
	mv "~/Downloads/""${file_name[$i]}/"" ""$target_dir"
	fi
    }

