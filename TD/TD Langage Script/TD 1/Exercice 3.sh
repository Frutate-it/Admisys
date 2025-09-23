#!/bin/bash

#Récupération des valeurs dans la variable tri
tri=$(printf "%s\n" "$@" | tr ' ' '\n'| sort)

#Affichage de la valeur
echo $tri
