#!/bin/bash
#~/.bashrc, script de démarrage pour le sous-système windows wsl2 ubuntu
#Initialisation de la fonction permettant le démarrage du projet
#Doit-on lancer le script ?
insertColor="\033[1;33;4m"
answerColor="\033[01;35m"
errorColor="\033[01;31m"
warningColor="\033[00;33m"
successColor="\033[01;32m"
norm="\033[0m"

echo -n -e "${insertColor} Lancement du script de démarrage ? Y/N ${norm}"
read start
if [ "$start" = "Y" ] || [ "$start" = "y" ]; then
    #Lancement du serveur mysql
    echo -e "${answerColor} démarrage du serveur mysql... ${norm}"
    sudo service mysql start
    echo -e "${answerColor} lancement de mysql ok. ${norm}"
    #Lancement du projet ou d'un projet spécifique ?.
    echo -n -e "${insertColor} lancer un projet spécifique en ligne de commande ? Y/N ${norm}"
    read change
    if [ "$change" = "Y" ] || [ "$change" = "y" ]; then
        #Sans espaces/caractères/tabulation.
        ls
        echo -n -e "${insertColor} Nom du fichier ou du dossier, sans espaces/tabulation, exemple:${highlight} dossier/monProjet ${norm} :${norm}"
        read newSrc
        #Va lancer le dossier/fichier dans votre éditeur de code s'il existe
        code "${newSrc}"
    elif [ "$change" = "N" ] || [ "$change" = "n" ]; then
        echo -n -e "${insertColor} On boss sur le projet ? Y/N : ${norm}"
        read projet
        if [ "$projet" = "Y" ] || [ "$projet" = "y" ]; then
            echo -e "${answerColor} go, lancement du projet ! ${norm}"
            #Changer la ligne suivante par votre projet actuel
            code perso_project/votre_projet
            #Va lancer le projet sans aucunes commandes à chaque fois.
        elif [ "$projet" = "N" ] || [ "$projet" = "n" ]; then
            echo -e "${answerColor} Okey pas cette fois ${norm}"
        fi
    fi
elif [ "$start" = "N" ] || [ "$start" = "n" ]; then
    echo -e "${answerColor} Bonne session ! ${norm}"
fi
