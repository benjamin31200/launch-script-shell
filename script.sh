#!/bin/bash
#~/.bashrc, script de démarrage pour le sous-système windows wsl2 ubuntu
#Initialisation de la fonction permettant le démarrage du projet
#Doit-on lancer le script ?
highlight=$(echo -en '\033[01;37m')
questionColor=$(echo -en '\033[01;35m')
answerColor=$(echo -en '\033[1;33;4m')
errorColor=$(echo -en '\033[01;31m')
warningColor=$(echo -en '\033[00;33m')
successColor=$(echo -en '\033[01;32m')
norm=$(echo -en '\033[0m')

echo -n -e "${questionColor} Lancement du script de démarrage ? Y/N ${norm}"
read start
if [ "$start" = "Y" ] || [ "$start" = "y" ]; then
    #Lancement du serveur mysql
    echo -e "${answerColor} démarrage du serveur mysql... ${norm}"
    sudo service mysql start
    echo -e "${answerColor} lancement de mysql ok. ${norm}"
    #Lancement du projet ou d'un projet spécifique ?.
    echo -n -e "${questionColor} lancer un projet spécifique en ligne de commande ? Y/N ${norm}" 
    read change
    if [ "$change" = "Y" ] || [ "$change" = "y" ]; then
        #Sans espaces/caractères/tabulation.
        ls
        echo -n -e "${questionColor} Nom du fichier ou du dossier, sans espaces/tabulation, exemple:${highlight} dossier/monProjet ${norm} :${norm}"
        read newSrc
        #Va lancer le dossier/fichier dans votre éditeur de code s'il existe
        code "${newSrc}"
    elif [ "$change" = "N" ] || [ "$change" = "n" ]; then
    echo -n -e "${questionColor} On boss sur le projet ? Y/N : ${norm}"
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