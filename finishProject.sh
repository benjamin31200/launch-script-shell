#!/bin/bash
set -o posix
insertColor='\033[1;33;4m'
indicationColor='\033[3;32m'
hugeIndicationColor='\033[5;37;41m'
norm='\033[0m'
n=$'\n'
doubleNext=$'\n\n'
tab=$'\t\t'
path=$(pwd)

process() {
    printf "${doubleNext}${insertColor} suiver les instructions: %s$n${norm}"
    find ~/ -wholename "${1}"
    printf "${doubleNext}${tab}${indicationColor} copier/coller le chemin d'accès du projet.%s$n${tab}${norm}"
    printf "${indicationColor} puis appuyer sur ${norm}${hugeIndicationColor}entrée%s${norm}$n"
    printf "${tab}${indicationColor} enfin, appuyer sur ${norm}${hugeIndicationColor}CTRL+D%s${norm}$n"
    cat >>"$(find ~/ -name path.sh)"
    printf "${insertColor}Nommer votre projet: %s$n${norm}"
    printf "${tab}${indicationColor} Appuyer sur ${norm}${hugeIndicationColor}entrée%s${norm}$n"
    printf "${tab}${indicationColor} enfin, appuyer sur ${norm}${hugeIndicationColor}CTRL+D%s${norm}$n"
    cat >>"$(find ~/ -name name.sh)"
}

createProject() {
    if [ -e "name.sh" ] && [ -e "path.sh" ]; then
        process "$1"
    else
        touch ~/bin/bash/name.sh
        touch ~/bin/bash/path.sh
        chmod +x name.sh ; chmod +x path.sh
        process "$1"
    fi
}

createProject "${path}"
