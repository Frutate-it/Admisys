#!/bin/bash

#Initialisations des variables pour compter les groupes
nb_gpe_sys=0
nb_gpe_uti=0

#On parcours le fichier système /etc/group ligne par ligne pour récupérer la valeur du GID
#Si supérieur à 1000 groupe utilisateur, avec une exception pour le groupe root,
#Si inférieur à 1000 groupe système. On augmente les compteurs en fonction de chaque résultat

while IFS=: read -r nom_groupe mot_de_passe gid membres
do
    if [ "$gid" -eq 0 ]; then
      echo "le groupe $nom_groupe est un groupe utilisateur"
    elif [ "$gid" -lt 1000 ]; then
      nb_gpe_sys=$((nb_gpe_sys + 1))
      echo "Le groupe $nom_groupe est un groupe système"
    else
        nb_gpe_uti=$((nb_gpe_uti + 1))
        echo "Le groupe $nom_groupe est un groupe utilisateur"
    fi
done < /etc/group

#On affiche le résultat des compteurs
echo "Nombre de groupes systèmes : $nb_gpe_sys"
echo "Nombre de groupes utilisateurs : $nb_gpe_uti"