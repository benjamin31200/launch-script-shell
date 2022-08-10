#!/bin/bash
insertColor=$(echo -en '\033[1;33;4m')
answerColor=$(echo -en '\033[01;35m')
errorColor=$(echo -en '\033[01;31m')
warningColor=$(echo -en '\033[00;33m')
successColor=$(echo -en '\033[01;32m')
norm=$(echo -en '\033[0m')

function start_project {
     echo -n -e "${insertColor} On boss sur le projet ? Y/N : ${norm}"
     read projet
        if [ "$projet" = "Y" ] || [ "$projet" = "y" ]; then
            echo -e "${answerColor} go, lancement du projet ! ${norm}"
            #Changer la ligne suivante par votre projet actuel
             code perso_project/votre_projet
             #Va lancer le projet sans aucunes commandes à chaque fois.
        elif [ "$projet" = "N" ] || [ "$projet" = "n" ]; then
            #Lancement du projet principal, changer le projet principal ou lancement d'un projet spécifique.
            echo -n -e "${insertColor} Voulez-vous configurer un nouveau projet à la place de celui existant ? Y/N ${norm}" 
            read change
                if [ "$change" = "Y" ] || [ "$change" = "y" ]; then
                #Sans espaces/caractères/tabulation.
                echo -n -e "${insertColor} Nom du fichier ou du dossier à rechercher, sans espaces/tabulations, exemple:\033[3;32m monProjet ${norm} : \c${norm}"
                read newSrc
                find ~/ -name "${newSrc}"
                echo -n -e "${insertColor} Voyez-vous le chemin du répertoire ? Y/N : ${norm}"
                read change
                      if [ "$change" = "Y" ] || [ "$change" = "y" ]; then
                        echo -n -e "${insertColor} Veuillez copier/coller le bon chemin : ${norm}"
                        read newSrcPath
                        #Lance le nouveau dossier/fichier dans votre éditeur de code
                        echo -e "${answerColor} Lancement du nouveau projet !${norm}"
                        code "${newSrcPath}"
                    else
                        echo -e "${answerColor} Le fichier/dossier n'existe pas, du moins pas depuis la racine.${norm}"
                        echo -n -e "${insertColor} Voulez-vous recommencer ? Y/N : ${norm}"
                        read change
                        if [ "$change" = "Y" ] || [ "$change" = "y" ]; then
                        bash "$(find ~/ -name search_dir.sh)"
                        elif [ "$change" = "N" ] || [ "$change" = "n" ]; then
                        echo "Sortie des configurations..."
                        fi
                    fi
                elif [ "$change" = "N" ] || [ "$change" = "n" ]; then
                    echo -e "${answerColor} Ok, projet conserver.${norm}"
                fi
        fi

}
start_project