#!/bin/bash

#initialisation des variables
path=""

echo -e "$(pwd)\n"

#On supprime les / du chemin pwd et on met le résultat dans un tableau
IFS='/' read -a chemin <<< "$(pwd)"

#boucle for pour créer le chemin petit a petit a partir du tableau
for repertoire in "${chemin[@]}"; do
	if [ -z "$repertoire" ]; then
		path="/"
	else
		if [ "$path" = "/" ]; then
			path="/$repertoire"
		else
			path="$path/$repertoire"
		fi
	fi
	echo "$path"
	ls "$path"
	echo ""
done
