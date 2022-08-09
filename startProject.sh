#!/bin/bash
function start_project{
     echo -n -e '\033[1;33;4m On boss sur le projet ? Y/N : \033[0m'
        read projet
        if [ "$projet" = "Y" ] || [ "$projet" = "y" ]; then
            echo -e '\033[1;34m go, lancement du projet ! \033[0m'
            #Changer la ligne suivante par votre projet actuel
             code perso_project/votre_projet
             #Va lancer le projet sans aucunes commandes à chaque fois.
        elif [ "$projet" = "N" ] || [ "$projet" = "n" ]; then
            echo -e '\033[1;34m Okey pas cette fois \033[0m'
            #Lancement du projet principal, changer le projet principal ou lancement d'un projet spécifique.
    echo -n -e '\033[1;33;4m Voulez-vous modifier le projet principal de lancement ? Y/N \033[0m' 
    read change
    if [ "$change" = "Y" ] || [ "$change" = "y" ]; then
        #Sans espaces/caractères/tabulation.
        ls
        echo -n -e '\033[1;33;4m Nom du fichier ou du dossier à rechercher, sans espaces/tabulations, exemple:\033[3;32m monProjet \033[0m :\c\033[0m'
        read newSrc
        find ~/ -name *$newSrc*
        #Va lancer le dossier/fichier dans votre éditeur de code s'il existe
        code newSrc
    elif [ "$change" = "N" ] || [ "$change" = "n" ]; then
   
    fi
        fi
    
}