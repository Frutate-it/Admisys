#!/bin/bash

#Récupération du login à vérifier
read -p "Saisir le login d'un utilisateur : " login

#Vérification que cette utilisateur existe via utilisation du code de retour de la commande
id "$login" &> /dev/null
id=$?
if [[ $id -eq 1 ]]; then
  echo "L'utilisateur $login n'existe pas. Relancer le script avec un utilisateur existant."
  exit
else
#On réutilise id mais avec les options pour récupérer les groupes de l'utilisateur saisie
#Puis on supprime le groupe principale avec la commande cut et les bonnes options
 echo "Voici la liste des groupes secondaires de l'utilisateur $login :"
 id -Gn $login | cut -d ' ' -f2-
fi