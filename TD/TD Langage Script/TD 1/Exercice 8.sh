#!/bin/bash

#Récupération de la saisie utilisateur en 5 secondes maximum

read -p "Chemin absolu de votre home : " -t 5 saisie

#Vérification de la saisie d'une valeur dans la variable
if [[ -z "$saisie" ]]; then
	echo -e "\nTrop Tard !"
else
	echo "Votre home se trouve ici : $saisie"
fi
