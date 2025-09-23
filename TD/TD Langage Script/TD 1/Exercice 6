#!/bin/bash

#Variable qui récupère le nombre de références pour les deux arguments
dossier1=$(ls $1 | wc -l)
dossier2=$(ls $2 | wc -l)

#boucle if qui permet de déterminer le dossier avec le plus de références et d'afficher le message correspondant
if (( $dossier1 < $dossier2 )); then
	echo "Le répertoire contenant le plus de référence est $2."
else
	echo "Le répertoire contenant le plus de référence est $1."
fi
