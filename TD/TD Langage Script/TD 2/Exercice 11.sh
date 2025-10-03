#!/bin/bash

#Fonction de copie des fichiers
copiepasswd() {
  cp /etc/passwd /mypasswd
  echo "Copie du fichier réussi !"
}

#Fonction qui compte le nombre de lignes
lecturemypasswd() {
 wc -l /mypasswd
}

#Fonction qui retourne la taille du fichier
taillemypasswd() {
  taille=$(du -k /mypasswd | cut -f1)
  echo "La taille du fichier est : $taille ko"
}

echo "Quel traitement souhaitez vous effectuer sur le fichier ?"
echo "1) Copier le fichier /etc/passwd vers /mypasswd."
echo "2) Afficher le nombre de ligne dans /mypasswd ?"
echo "3) Afficher la taille du fichier /mypasswd en ko ?"
echo "4) Quitter le script"
read -p "Entrez votre choix (1-4) : " choix

case $choix in
    1)
        copiepasswd
        ;;
    2)
        lecturemypasswd
        ;;
    3)
        taillemypasswd
        ;;
    4)
        echo "Vous avez choisi de quitter le script"
        exit
        ;;
    *)
        echo "Choix invalide. Relancer le script et saisir un numéro entre 1 et 4"
        exit
        ;;
esac