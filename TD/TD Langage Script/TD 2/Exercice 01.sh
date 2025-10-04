#!/bin/bash

#Récuperation de l'adresse ip et mise en forme pour les contenir dans 4 variables
IFS='.' read -p "Saisir l'adresse ip sous forme de 4 octets 255.255.255.255 : " o1 o2 o3 o4

#Boucle qui permet de vérifier que chaque octet est bien compris entre 0 et 255 et qui affiche un message d'erreur sinon
for ((i=1;i<=4;i++)); do
  oi="o$i"
  octet=${!oi}
  if [[ $octet -gt 255 || $octet -lt 0 ]]; then
    echo "La valeur de l'octet n° $i n'est pas comprise entre 0 et 255"
    IFS='.' read -p "Veuillez ressaisir l'adresse ip sous forme de 4 octets 255.255.255.255 : " o1 o2 o3 o4
    i=0
  fi
done

#Affiche l'adresse ip valable puis ping 5 fois la cible.
echo "Ping de l'adresse $o1.$o2.$o3.$o4 "
ping "$o1.$o2.$o3.$o4" -c 5
