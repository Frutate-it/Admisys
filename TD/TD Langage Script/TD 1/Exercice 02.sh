#!/bin/bash

#Récupération des 3 premières sortie de la commande groups
G1=$(groups|cut -d ' ' -f1)
G2=$(groups|cut -d ' ' -f2)
G3=$(groups|cut -d ' ' -f3)

#Affichage du résultat
echo "$G1;$G2;$G3."
