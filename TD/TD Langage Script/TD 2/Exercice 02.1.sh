#!/bin/bash
#commande pour afficher le nombre de fichiers ayant une permission spécial
#On affiche d'abord le contenu avec ls, on récupère l'octet qui nous intéresse avec cut soit le 10ème
#On filtre et on compte les entrée correspondant avec grep et l'option -i pour la casse

ls -l $1 | cut -c 10 | grep -i -c "t"
