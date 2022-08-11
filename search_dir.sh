#!/bin/bash
insertColor=$(echo -en '\033[1;33;4m')
answerColor=$(echo -en '\033[01;35m')
errorColor=$(echo -en '\033[01;31m')
indicationColor=$(echo -en '\033[3;32m')
hugeIndicationColor=$(echo -en '\033[5;37;41m')
successColor=$(echo -en '\033[01;32m')
norm=$(echo -en '\033[0m')
next=$'\n'
doubleNext=$'\n\n'
tab=$'\t\t'
yes=y
non=n

function find_gitignore {
    echo -n -e "${insertColor} Suiver les instructions: ${doubleNext}${tab}${norm}${indicationColor} Taper: ${norm}${hugeIndicationColor}git${norm}${indicationColor} Pour trouver tous vos projets contenant un .gitignore.${next}${tab}${norm}${indicationColor} Ou Taper: ${norm}${hugeIndicationColor}least${norm}${indicationColor} Pour trouver tous vos projets récemment créer (7j max et +20ko).${next}${norm}"
    read help
    if [ "$help" = "git" ]; then
        echo -e "${answerColor} Tous les dossiers contenant un .gitinore: ${norm}"
        dirname "$(find ~/ -type f -name "*.gitignore" -exec ls -d {} +) | less"
        search_dir
    elif [ "$help" = "least" ]; then
        echo -e "${answerColor} Tous les projets récents et pesant au moins 20ko: ${norm}"
        dirname "$(find ~/ -type d -ctime +5 -size +20k -exec ls -d {} + | less)"
        search_dir
    else
        find_gitignore
    fi
}

function error {
    echo -e "${answerColor} Le fichier/dossier n'existe pas, du moins pas depuis la racine.${norm}"
    echo -n -e "${insertColor} Voulez-vous recommencer ? y/n : ${norm}"
    read y_n
    if [ "$y_n" = "$yes" ]; then
        search_dir
    elif [ "$y_n" = "$non" ]; then
        echo "Sortie des configurations..."
        bash "$(find ./ -name startProject.sh)"
    fi
}

function search_dir {
    echo -n -e "${insertColor} Nom du projet à rechercher, sans espaces/tabulations, exemple:${doubleNext}${tab}${norm}${indicationColor} monProjet OU mon_projet${next}${tab} taper ${norm}${hugeIndicationColor}help${norm}${indicationColor} pour de l'aide ${next}${norm}\c"
    read newSrc
    declare -a checkSrc
    checkSrc=("${checkSrc[@]}" "$(find ~/ -name "${newSrc}")")
    if [ "$newSrc" = "Help" ] || [ "$newSrc" = "help" ]; then
        find_gitignore
    elif [ ${#checkSrc[0]} -gt 0 ]; then
        echo -e "${answerColor} Processus d'enregistrement du nouveau projet: ${norm}"
        if [ -e "savePath.sh" ]; then
            rm -rf ~/savePath.sh
            touch ~/bin/bash/savePath.sh
            chmod +x savePath.sh
            echo -e "${insertColor} suiver les instructions: ${norm}"
            find ~/ -name "${newSrc}"
            echo -e "${doubleNext}${tab}${indicationColor} copier/coller le bon chemin d'accès du projet parmi ceux de la liste ci-dessus ${next}${tab} puis appuyer sur ${norm}${hugeIndicationColor}entrée${norm}${next}${tab}${indicationColor} enfin, appuyer sur ${norm}${hugeIndicationColor}CTRL+D${norm}"
            cat >~/bin/bash/savePath.sh
        else
            touch ~/bin/bash/savePath.sh
            chmod +x savePath.sh
            echo -e "${insertColor} suiver les instructions: ${norm}${doubleNext}${tab}${indicationColor} copier/coller le bon chemin d'accès ${next}${tab} puis appuyer sur entrée ${next}${tab} enfin, appuyer sur CTRL+D ${norm}"
            cat >~/bin/bash/savePath.sh
        fi

        #Lance le nouveau dossier/fichier dans votre éditeur de code
        echo -e "${answerColor} Enregistrement du projet réussi !${norm}"
        echo -e "${answerColor} démarrage en cours...${norm}"
        code "$(cat ./savePath.sh)"
        exit 0
    else
        error
    fi
}
search_dir
