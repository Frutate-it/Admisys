#!/bin/bash

#Vérification que le répertoire saisie en paramètre existe bien
if [ ! -d "$1" ]; then
    echo "Erreur: Le répertoire '$1' n'existe pas. Merci de saisir un répertoire existant."
fi

#Affiche tous les fichiers puis récupère le 1er caractère
#et tri/compte le nombre de d correspondant à un dossier
dos=$(ls -l "$1" | cut -c 1 | grep -i -c "d")
echo "Il y a $dos dossiers dans le répertoire"

#Affiche tous les fichiers puis récupère le 1er caractère
#et tri/compte le nombre de - correspondant à un fichier
fic=$(ls -l "$1" | cut -c 1 | grep -i -c "-")
echo "Il y a $fic fichiers dans le répertoire"

#Affiche les noms de fichiers avec les fichiers cachés
#Puis récupère uniquement les fichiers commençant par . puis les compte
cach=$(ls -A "$1" | grep "^\." | wc -l)
echo "Il y a $cach fichiers cachés dans le répertoire"

#Vérification que l'on ne sélectionne que les fichiers
#Puis que on vérifie leurs droits et on les modifie si besoin

for i in "$1"/*; do
  if [ -f "$i" ]; then
    if [ ! -x "$i" ]; then
      echo -e "Modification des droits sur le fichier $i"
      chmod u=rx,o= "$i"
    else
      echo "Pas de modifications de droits à effectuer sur ce fichier $i"
    fi
  fi
done

echo "Fin des modifications dans le répertoire : $1"