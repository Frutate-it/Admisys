#!/bin/bash

#copie du fichier dans le home de l'utilisateur
cp /etc/passwd ~/passwd.txt

#changement des droits
cd ~
chmod 666 "passwd.txt"

#tri du fichier par ordre décroissant
cd ~
sort -r "passwd.txt"