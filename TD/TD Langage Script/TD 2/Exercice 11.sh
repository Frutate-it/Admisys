#!/bin/bash

#Fonction de copie des fichiers
copiepasswd() {
  echo "La copie nécessite une élévation de privilège"
  sudo cp /etc/passwd /mypasswd
  echo "Copie du fichier réussi !"
}

#Fonction qui compte le nombre de lignes
lecturemypasswd() {
 nblignes=$(wc -l /mypasswd | cut -d ' ' -f1 )
 echo "Il y a $nblignes lignes dans le fichier"
}

#Fonction qui retourne la taille du fichier
taillemypasswd() {
  taille=$(du -k /mypasswd | cut -f1)
  echo "La taille du fichier est de $taille ko"
}

#Menu qui permet d'utiliser les fonctions créer
echo "Quel traitement souhaitez vous effectuer sur le fichier ?"
echo "1) Copier le fichier /etc/passwd vers /mypasswd."
echo "2) Afficher le nombre de ligne dans /mypasswd ?"
echo "3) Afficher la taille du fichier /mypasswd en ko ?"
echo "4) Effectuer toutes les opérations précédentes."
echo "5) Quitter le script"
read -p "Entrez votre choix (1-5) : " choix

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
        copiepasswd
        lecturemypasswd
        taillemypasswd
        ;;
    5)
        echo "Vous avez choisi de quitter le script"
        exit
        ;;
    *)
        echo "Choix invalide. Relancer le script et saisir un numéro entre 1 et 5"
        exit
        ;;
esac