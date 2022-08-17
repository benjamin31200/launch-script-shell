#!/bin/bash
set -o posix
insertColor='\033[1;33;4m'
answerColor='\033[01;35m'
indicationColor='\033[3;32m'
hugeIndicationColor='\033[5;37;41m'
exampleColor=$(echo -en '\033[01;34m')
norm='\033[0m'
n=$'\n'
doubleNext=$'\n\n'
tab=$'\t\t'
yes=y
non=n

function find_gitignore {
    echo -n -e "${insertColor} Suiver les instructions: ${doubleNext}${tab}${norm}"
    printf "${indicationColor} Taper: ${norm}${hugeIndicationColor}git${norm}${indicationColor} Pour trouver tous vos projets contenant un .gitignore.%s$n${tab}${norm}"
    printf "${indicationColor} Taper: ${norm}${hugeIndicationColor}least${norm}${indicationColor} Pour trouver tous vos projets récemment créer (7j max et +20ko).%s$n${norm}"
    read answer
    if [ "$answer" = "git" ]; then
        printf "${answerColor} Tous les dossiers contenant un .gitinore: %s$n${norm}"
        dirname "$(find ~/ -type f -name "*.gitignore" -exec ls -d {} +) | less"
        search_dir
    elif [ "$answer" = "least" ]; then
        printf "${answerColor} Tous les projets récents et pesant au moins 20ko: %s$n${norm}"
        dirname "$(find ~/ -type d -ctime +5 -size +20k -exec ls -d {} + | less)"
        search_dir
    else
        find_gitignore
    fi
}

function error {
    printf "${answerColor} Le fichier/dossier n'existe pas, du moins pas depuis la racine.%s$n${norm}"
    echo -n -e "${insertColor} Recommencer ? $norm${hugeIndicationColor}oui$norm / ${hugeIndicationColor}non${norm}"
    read answer
    if [ "$answer" = "$yes" ]; then
        search_dir
    elif [ "$answer" = "$non" ]; then
        echo "Sortie des configurations..."
        bash "$(find ./ -name start.sh)"
    fi
}

function process {
    printf "${insertColor} suiver les instructions: %s$n${norm}"
    find ~/ -name "${1}"
    printf "${doubleNext}${tab}${indicationColor} copier/coller le bon chemin d'accès du projet parmi ceux de la liste ci-dessus%s$n${tab}${norm}"
    printf "${indicationColor} puis appuyer sur ${norm}${hugeIndicationColor}entrée%s${norm}$n"
    printf "${tab}${indicationColor} enfin, appuyer sur ${norm}${hugeIndicationColor}CTRL+D%s${norm}$n"
    cat >>"$(find ./ -name path.sh)"
    printf "$n${insertColor}Nommer le projet: %s$n${norm}"
    printf "$tab${indicationColor} Appuyer sur ${norm}${hugeIndicationColor}entrée%s${norm}$n"
    printf "${tab}${indicationColor} enfin, appuyer sur ${norm}${hugeIndicationColor}CTRL+D%s${norm}$n"
    cat >>"$(find ~/ -name name.sh)"
}

function search_dir {
    echo -n -e "${insertColor} Nom du projet à rechercher, sans espaces/tabulations, exemple:${doubleNext}${tab}${norm}"
    printf "${exampleColor} monProjet ${norm}${indicationColor} OU ${norm}${exampleColor}mon_projet%s$n${norm}"
    printf "${tab}${indicationColor} taper ${norm}${hugeIndicationColor}help${norm}${indicationColor} pour de l'aide %s$n${norm}"
    read newSrc
    declare -a checkSrc=("${checkSrc[@]}" "$(find ~/ -name "${newSrc}")")
    if [ "$newSrc" = "Help" ] || [ "$newSrc" = "help" ]; then
        find_gitignore
    elif [ ${#checkSrc[0]} -gt 0 ]; then
        printf "${answerColor} Processus d'enregistrement du nouveau projet: %s$n${norm}"
        if [ -e "name.sh" ] && [ -e "path.sh" ]; then
        touch ~/bin/bash/name.sh
        touch ~/bin/bash/path.sh
        process "$newSrc"
    else
        process "$newSrc"
    fi
        printf "${answerColor} Enregistrement du projet réussi !%s$n${norm}"
        bash "$(find ./ -name menu.sh)"
        exit 0
    else
        error
    fi
}
search_dir
