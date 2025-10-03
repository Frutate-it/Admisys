#!/bin/bash

#Vérification du nombre d'arguments avant la boucle pour compter
if [ $# -ne 2 ]; then
    echo "Veuillez saisir deux arguments correspondant à deux répertoire"
else
#Initialisation d'un compteur pour compter le nombre de fichier identique
  compteur=0
#On parcours les fichiers du premier répertoire
  for fichier in "$1"/*; do
#On vérifie que c'est bien un fichier
    if [ -f "$fichier" ]; then
#On crée une variable qui récupère uniquement le nom du fichier
      nom=$(basename "$fichier")
#On vérifie ensuite si un fichier du même nom existe dans le second répertoire
      if [ -f "$2/$nom" ]; then
      compteur=$((compteur+1))
      fi
   fi
  done
#On affiche le résultat
  echo "Il y a $compteur fichiers communs entre ces deux répertoire"
fi