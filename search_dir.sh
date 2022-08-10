#!/bin/bash
insertColor=$(echo -en '\033[1;33;4m')
answerColor=$(echo -en '\033[01;35m')
errorColor=$(echo -en '\033[01;31m')
indicationColor=$(echo -en '\033[3;32m')
hugeIndicationColor=$(echo -en '\033[5;37;41m')
successColor=$(echo -en '\033[01;32m')
norm=$(echo -en '\033[0m')
next=$'\n'
tab=$'\t\t'

function find_gitignore {
    echo -e "${answerColor} Tous les dossiers contenant un .gitinore: ${norm}"
    find ~/ -type f -name ".gitignore" -exec ls -d {} +
    echo -n -e "${insertColor} Voyez-vous votre projet ? y/n : ${norm}"
    read change
    if [ "$change" = "Y" ] || [ "$change" = "y" ]; then
        bash "$(find ./ -name search_dir.sh)"
    else
        error
    fi

}

function error {
    echo -e "${answerColor} Le fichier/dossier n'existe pas, du moins pas depuis la racine.${norm}"
    echo -n -e "${insertColor} Voulez-vous recommencer ? y/n : ${norm}"
    read y_n
    if [ "$y_n" = "Y" ] || [ "$y_n" = "y" ]; then
        find_gitignore
    elif [ "$y_n" = "N" ] || [ "$y_n" = "n" ]; then
        echo "Sortie des configurations..."
        bash "$(find ./ -name startProject.sh)"
    fi
}

function search_dir {
    echo -n -e "${insertColor} Nom du projet à rechercher, sans espaces/tabulations, exemple:${next}${tab}${norm}${indicationColor} monProjet OU mon_projet${next}${tab} taper ${norm}${hugeIndicationColor}help${norm}${indicationColor} pour de l'aide: ${norm}\c"
    read newSrc
    if [ "$newSrc" = "Help" ] || [ "$newSrc" = "help" ]; then
        find_gitignore
    elif [ -f "$newSrc" ]; then
        find ~/ -name "${newSrc}"
        echo -n -e "${insertColor} Voyez-vous le chemin du répertoire ? Y/N : ${norm}"
        read y_n
        if [ "$y_n" = "Y" ] || [ "$y_n" = "y" ]; then
            echo -e "${answerColor} Processus d'enregistrement du nouveau projet... ${norm}"
            if [ -e "savePath.sh" ]; then
                rm -rf ~/savePath.sh
                touch ~/bin/bash/savePath.sh
                chmod +x savePath.sh
                echo -e "${insertColor} suiver les instructions: ${norm}${next}${tab}${hugeIndicationColor} copier/coller le bon chemin d'accès ${next}${tab} puis appuyer sur entrée ${next}${tab} enfin, appuyer sur CTRL+D ${norm}"
                cat >~/bin/bash/savePath.sh
            else
                touch ~/bin/bash/savePath.sh
                chmod +x savePath.sh
                echo -e "${insertColor} suiver les instructions: ${norm}${next}${tab}${hugeIndicationColor} copier/coller le bon chemin d'accès ${next}${tab} puis appuyer sur entrée ${next}${tab} enfin, appuyer sur CTRL+D ${norm}"
                cat >~/bin/bash/savePath.sh
            fi

            #Lance le nouveau dossier/fichier dans votre éditeur de code
            echo -e "${answerColor} Enregistrement du projet réussi !${norm}"
            echo -e "${answerColor} démarrage en cours...${norm}"
            code "$(cat ./savePath.sh)"
            exit 0
        elif [ "$y_n" = "N" ] || [ "$y_n" = "n" ]; then
            error
        fi
    else
        error
    fi
}
search_dir
