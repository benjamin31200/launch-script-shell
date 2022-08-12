#!/bin/bash
insertColor=$(echo -en '\033[1;33;4m')
answerColor=$(echo -en '\033[01;35m')
errorColor=$(echo -en '\033[01;31m')
indicationColor=$(echo -en '\033[3;32m')
hugeIndicationColor=$(echo -en '\033[5;37;41m')
successColor=$(echo -en '\033[01;32m')
exampleColor=$(echo -en '\033[01;34m')
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
        bash "$(find ./ -name start.sh)"
    fi
}

function process {
    echo -e "${insertColor} suiver les instructions: ${norm}"
    find ~/ -name "${1}"
    echo -e "${doubleNext}${tab}${indicationColor} copier/coller le bon chemin d'accès du projet parmi ceux de la liste ci-dessus${tab}${norm}"
    echo -e  "${tab}${indicationColor} puis appuyer sur ${norm}${hugeIndicationColor}entrée${norm}"
    echo -e "${tab}${indicationColor} enfin, appuyer sur ${norm}${hugeIndicationColor}CTRL+D${norm}${next}"
    cat >>"$(find ./ -name path.sh)"
}

function search_dir {
    echo -n -e "${insertColor} Nom du projet à rechercher, sans espaces/tabulations, exemple:${doubleNext}${tab}${norm}"
    echo -e "${exampleColor} monProjet ${norm}${indicationColor} OU ${norm}${exampleColor}mon_projet${norm}"
    echo -e "${tab}${indicationColor} taper ${norm}${hugeIndicationColor}help${norm}${indicationColor} pour de l'aide ${next}${norm}"
    read newSrc
    declare -a checkSrc
    checkSrc=("${checkSrc[@]}" "$(find ~/ -name "${newSrc}")")
    if [ "$newSrc" = "Help" ] || [ "$newSrc" = "help" ]; then
        find_gitignore
    elif [ ${#checkSrc[0]} -gt 0 ]; then
        echo -e "${answerColor} Processus d'enregistrement du nouveau projet: ${norm}"
        if [ -e "path.sh" ]; then
            touch ~/bin/bash/path.sh
            chmod +x "$(find ./ -name path.sh)"
            process "${newSrc}"
        else
            process "${newSrc}"
        fi
        echo -e "${answerColor} Enregistrement du projet réussi !${norm}"
        #code "$(cat "$(find ./ -name path.sh)")"
        bash "$(find ./ -name start.sh)"
        exit 0
    else
        error
    fi
}
search_dir
