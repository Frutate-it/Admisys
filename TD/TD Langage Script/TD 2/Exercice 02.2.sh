#Explication de la procédure pour choisir les droits voulus
echo -e "Quels sont les permissions que vous voulez appliquer aux nouveaux fichier et répertoire :\n"
echo -e "Pour rappel, r = lecture, w = écriture et x = exécution\n"

#Demande des droits utilisateurs
read -p "Quels sont les permissions pour l'utilisateur actuel ? (ex: r, w, x, rw, rwx, ...) : " user
case $user in
  r)
    echo -e "Lecture uniquement pour l'utilisateur\n"
    puser="4" ;;
  w)
    echo -e "Écriture uniquement pour l'utilisateur\n"
    puser="2" ;;
  x)
    echo -e "Exécution uniquement pour l'utilisateur\n"
    puser="1" ;;
  rw)
    echo -e "Lecture + écriture pour l'utilisateur\n"
    puser="6" ;;
  rx)
    echo -e "Lecture + exécution pour l'utilisateur\n"
    puser="5" ;;
  wx)
    echo -e "Écriture + exécution pour l'utilisateur\n"
    puser="3" ;;
  rwx)
    echo -e "Lecture + écriture + exécution pour l'utilisateur\n"
    puser="7" ;;
  *)
  echo -e "Erreur de saisie, merci de saisir des droits d'exécution sous la forme rwx, rw, r, x."
  echo -e "Pour rappel, r = lecture, w = écriture et x = exécution\n" ;;
esac

#Demande des droits du groupe
read -p "Quels sont les permissions pour le groupe ? (ex: r, w, x, rw, rwx, ...) : " groupe
case $groupe in
  r)
    echo -e "Lecture uniquement pour le groupe\n"
    pgroupe="4" ;;
  w)
    echo -e "Écriture uniquement pour le groupe\n"
    pgroupe="2" ;;
  x)
    echo -e "Exécution uniquement pour le groupe\n"
    pgroupe="1" ;;
  rw)
    echo -e "Lecture + écriture pour le groupe\n"
    pgroupe="6" ;;
  rx)
    echo -e "Lecture + exécution pour le groupe\n"
    pgroupe="5" ;;
  wx)
    echo -e "Écriture + exécution pour le groupe\n"
    pgroupe="3" ;;
  rwx)
    echo -e "Lecture + écriture + exécution pour le groupe\n"
    pgroupe="7" ;;
  *)
  echo -e "Erreur de saisie, merci de saisir des droits d'exécution sous la forme rwx, rw, r, x."
  echo -e "Pour rappel, r = lecture, w = écriture et x = exécution\n" ;;
esac

#Demande du droit des autres utilisateurs
read -p "Quels sont les permissions pour les autres utilisateurs actuel ? (ex: r, w, x, rw, rwx, ...) : " autre
case $autre in
  r)
    echo -e "Lecture uniquement pour les autres utilisateurs\n"
    pautre="4";;
  w)
    echo -e "Écriture uniquement pour les autres utilisateurs\n"
    pautre="2" ;;
  x)
    echo -e "Exécution uniquement pour les autres utilisateurs\n"
    pautre="1" ;;
  rw)
    echo -e "Lecture + écriture pour les autres utilisateurs\n"
    pautre="6" ;;
  rx)
    echo -e "Lecture + exécution pour les autres utilisateurs \n"
    pautre="5" ;;
  wx)
    echo -e "Écriture + exécution pour les autres utilisateurs \n"
    pautre="3" ;;
  rwx)
    echo -e "Lecture + écriture + exécution pour les autres utilisateurs \n"
    pautre="7" ;;
  *)
  echo -e "Erreur de saisie, merci de saisir des droits d'exécution sous la forme rwx, rw, r, x."
  echo -e "Pour rappel, r = lecture, w = écriture et x = exécution\n" ;;
esac

#Calcul du umask via soustraction
uuser=$((7-puser))
ugroupe=$((7-pgroupe))
uautre=$((7-pautre))

#création de la valeur du umask
umaskchoisi="$uCopier-coller depuis un IDE : Certains IDE (VS Code, Sublime, PyCharm…) permettent de copier le code avec la mise en forme (couleurs, indentations) et de le coller dans Word.user$ugroupe$uautre"

#Affichage du umask choisi
echo -e "Le umask choisi pour la session en cours est $uuser$ugroupe$uautre.\n"

#modification du umask
echo -n "#Pour une modification permanente, il faut dé commenter la ligne "
echo -e "echo \"umask $umaskchoisi\" >> ~/.bashrc dans le script et l'exécuter de nouveau.\n"
#echo "umask $umaskchoisi" >> ~/.bashrc

umask $umaskchoisi
echo "Vérification du umask après modification :"
umask