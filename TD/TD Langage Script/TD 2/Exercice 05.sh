#!/bin/bash

#Vérification du nombre d'arguments saisie avec message d'erreur si plus d'un argument
if [[ $# -eq 1 ]]; then
#On vérifie que c'est un répertoire et on affiche le contenu
  if [[ -d $1 ]]; then
    echo "Affichage du contenu du répertoire :"
    ls "$1"
#Si ce n'est pas un dossier on vérifie si c'est un fichier et on affiche son contenu
  elif [[ -f $1 ]]; then
    echo "Affichage du contenu du fichier :"
    cat "$1"
#Si c'est aucun des deux on affiche un message d'erreur
  else
    echo "Veuillez saisir un nom de répertoire ou un nom de fichier en argument"
  fi
else
  echo "Mauvais nombre d'arguments saisie, merci de relancer le script avec un seul argument"
fi