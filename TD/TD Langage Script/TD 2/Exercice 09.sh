#!/bin/bash

#Vérification qu'un argument a bien été fourni
if [ -z "$1" ]; then
    echo "Merci de saisir un nom d'utilisateur en argument lors du lancement du script."
    exit
fi

#Variable qui sauvegarde le nom d'utilisateur saisie
nom_util=$1

#Création d'une fonction pour chaque fonction du script
#Récupération des informations de l'utilisateur

util_infos() {
    read -p "Entrez l'UID : " util_uid
    read -p "Entrez le GID : " util_gid
    read -p "Entrez le shell (ex: /bin/bash) : " util_shell
    read -p "Entrez les groupes secondaires (séparés par des virgules) : " util_groupes
    read -p "Entrez le répertoire personnel : " util_home
}

#Création d'un utilisateur
util_crea() {
  util_infos
  sudo useradd -u "$util_uid" -g "$util_gid" -s "$util_shell" -G "$util_groupes" -d "$util_home" "$nom_util"
#On vérifie que l'utilisateur a bien été créé
  if [ $? -eq 0 ]; then
    echo "L'utilisateur $nom_util à été créé avec succès !"
  else
    echo "Erreur lors de la création de l'utilisateur $nom_util"
  fi
}

#Modification d'un utilisateur
util_modif() {
  util_infos
  sudo usermod -u "$util_uid" -g "$util_gid" -s "$util_shell" -G "$util_groupes" -d "$util_home" "$nom_util"
#On vérifie que l'utilisateur a bien été modifié
  if [ $? -eq 0 ]; then
    echo "L'utilisateur $nom_util à été modifié avec succès !"
  else
    echo "Erreur lors de la modification de l'utilisateur $nom_util"
  fi
}

#Suppression d'un utilisateur
util_supp() {
  sudo userdel -r "$nom_util"
    if [ $? -eq 0 ]; then
        echo "L'utilisateur $nom_util à été supprimé avec succès."
    else
        echo "Erreur lors de la suppression de l'utilisateur $nom_util."
    fi
}

#On crée ensuite un menu via case afin d'utiliser les fonctions précédentes
echo "Que voulez-vous faire avec l'utilisateur $nom_util ?"
echo "1) Créer l'utilisateur"
echo "2) Modifier l'utilisateur"
echo "3) Supprimer l'utilisateur"
echo "4) Quitter le script"
read -p "Entrez votre choix (1-4) : " choix

case $choix in
    1)
        util_crea
        ;;
    2)
        util_modif
        ;;
    3)
        util_supp
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