#!/bin/bash

echo "Question 1"
find ~ -type f -name "*bash*"

echo "Question 2"
find ~ -type f -mmin -30

echo "Question 3"
find /usr -type f -size +2M

echo "Question 4"
for rep in $(find /usr/share/bug -type d); do
    ls -ld "$rep"
done

echo "Question 5"
find /etc -type f -size +100k -user root

echo "Question 6"
find /etc -type d -mtime 10 -size -100k

#Création du fichier adresses
# 7 à 10 : création du fichier 'adresses'

echo "192.168.1.245.www.test.com.80" > adresses
echo "192.168.1.17.www.test.net.8012" >> adresses
echo "192.168.2.5.www.test.org.8001" >> adresses
echo "192.168.3.1.www.test.ma.8098" >> adresses
echo "192.168.2.15.www.test.to.8080" >> adresses

echo "Question 7"
#L'option -t permet de choisir le séparateur de champs,
#L'option -k permet de trier selon des champs précis dans la ligne
#Ici l'ip est dans le champ 1,2,3,4 donc on vérifie 1 par 1 les champs
sort -t. -k1,1 -k2,2 -k3,3 -k4,4 adresses

echo "Question 8"
#Même principe mais ici le nom de domaine est dans les champ 5,6,7
sort -t. -k5,5 -k6,6 -k7,7 adresses

echo "Question 9"
#On tri d'abord les IP comme la question 7,
#Mais on rajoute l'option r du port en ordre inverse
#Le port est le 8ème champ de notre ligne
sort -t. -k1,1 -k2,2 -k3,3 -k4,4 -k8,8r adresses

echo "Question 10"
#On refait la même commande mais on tri tout les champs puis on redirige
#La sortie vers le fichier que l'on souhaite avec >
sort -t. -k1,1 -k2,2 -k3,3 -k4,4 -k5,5 -k6,6 -k7,7 -k8,8 adresses > adresses_tri

echo "Question 11"
#On affiche déjà le contenu avec ls
#On supprime ensuite les double espaces qui posent problèmes ensuite
#Puis on récupère les champs qui nous intéresse avec cut soit le type de fichier et le nom
#On trie ensuite avec sort
ls -l /etc | tr -s ' ' | cut -d' ' -f1,9 | sort > filtre_ls

echo "Question 12"
#Ici on récupère ls
#On supprime ensuite les double espaces qui posent problèmes
#On récupère les champs que l'on souhaite avec cut
#Donc on récupère les droits d’accès,l'utilisateur,le groupe et le nom du fichier
#Et enfin on utilise les même options de sort
#On tri par droits d'accès donc le champ 1 et le champ 2 de la sortie de cut
ls -l /etc | tr -s ' ' | cut -d' ' -f1,3,4,9 | sort -k1,1 -k2,2 >> filtre_ls
