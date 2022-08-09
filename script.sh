#!/bin/bash
#~/.bashrc, script de démarrage pour le sous-système windows wsl2 ubuntu
#Initialisation de la fonction permettant le démarrage du projet
#Doit-on lancer le script ?
echo -n -e '\033[1;33;4m Lancement du script de démarrage ? Y/N \033[0m'
read start
if [ "$start" = "Y" ] || [ "$start" = "y" ]; then
    #Lancement du serveur mysql
    echo -e '\033[1;34m démarrage du serveur mysql... \033[0m'
    sudo service mysql start
    echo -e '\033[1;34m lancement de mysql ok. \033[0m'
    #Lancement du projet ou d'un projet spécifique ?.
    echo -n -e '\033[1;33;4m lancer un projet spécifique en ligne de commande ? Y/N \033[0m' 
    read change
    if [ "$change" = "Y" ] || [ "$change" = "y" ]; then
        #Sans espaces/caractères/tabulation.
        ls
        echo -n -e '\033[1;33;4m Nom du fichier ou du dossier, sans espaces/tabulation, exemple:\033[3;32m dossier/monProjet \033[0m :\033[0m'
        read newSrc
        #Va lancer le dossier/fichier dans votre éditeur de code s'il existe
        code newSrc
    elif [ "$change" = "N" ] || [ "$change" = "n" ]; then
    echo -n -e '\033[1;33;4m On boss sur le projet ? Y/N : \033[0m'
        read projet
        if [ "$projet" = "Y" ] || [ "$projet" = "y" ]; then
            echo -e '\033[1;34m go, lancement du projet ! \033[0m'
            #Changer la ligne suivante par votre projet actuel
             code perso_project/votre_projet
             #Va lancer le projet sans aucunes commandes à chaque fois.
        elif [ "$projet" = "N" ] || [ "$projet" = "n" ]; then
            echo -e '\033[1;34m Okey pas cette fois \033[0m'
        fi
    fi
elif [ "$start" = "N" ] || [ "$start" = "n" ]; then
    echo -e '\033[1;34m Bonne session ! \033[0m'
fi