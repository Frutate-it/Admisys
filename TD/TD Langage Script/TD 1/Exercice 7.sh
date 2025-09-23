#!/bin/bash

#initialisation d'un compteur
c=1

#boucle pour afficher les entier 1 par 1 jusqu'a la valeur du paramètre saisie
while [[ $c -le $1 ]]; do
	echo "$c"
	c=$(( c + 1 ))
done