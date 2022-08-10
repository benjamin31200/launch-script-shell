#!/bin/bash
insertColor=$(echo -en '\033[1;33;4m')
answerColor=$(echo -en '\033[01;35m')
errorColor=$(echo -en '\033[01;31m')
warningColor=$(echo -en '\033[00;33m')
successColor=$(echo -en '\033[01;32m')
norm=$(echo -en '\033[0m')

function search_dir {
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
                    fi
}
search_dir