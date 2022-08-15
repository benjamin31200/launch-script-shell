#!/bin/bash
set -o posix
insertColor='\033[1;33;4m'
answerColor='\033[01;35m'
importantColor='\033[01;31m'
successColor='\033[1;32m'
greenColor='\033[1;37;42m'
creationColor='\033[1;35m'
indicationColor='\033[3;32m'
hugeIndicationColor='\033[5;37;41m'
exampleColor='\033[01;34m'
norm='\033[0m'
n='\n'
doubleNext=$'\n\n'
tab=$'\t\t'
yes=y
non=n

path=~/

process() {
    printf "${doubleNext}${insertColor} suiver les instructions: %s$n${norm}"
    find ~/ -wholename "${1}"
    printf "${doubleNext}${tab}${indicationColor} copier/coller le chemin d'accès du projet.%s$n${tab}${norm}"
    printf "${indicationColor} puis appuyer sur ${norm}${hugeIndicationColor}entrée%s${norm}$n"
    printf "${tab}${indicationColor} enfin, appuyer sur ${norm}${hugeIndicationColor}CTRL+D%s${norm}$n"
    cat >>"$(find ~/ -name path.sh)"
    printf "${insertColor}Nommer votre projet: %s$n${norm}"
    printf "${indicationColor} Appuyer sur ${norm}${hugeIndicationColor}entrée%s${norm}$n"
    printf "${tab}${indicationColor} enfin, appuyer sur ${norm}${hugeIndicationColor}CTRL+D%s${norm}$n"
    cat >>"$(find ~/ -name name.sh)"
}

createProject() {
    if [ -e "name.sh" ]; then
        touch ~/bin/bash/name.sh
        chmod +x "$(find ./ -name name.sh)"
        process "$1"
    else
        process "$1"
    fi
}

addDir() {
    min=1
    printf "${insertColor}Rentrer le nom du dossier à chaque demande, s'il n'existe pas le créera automatiquement. %s$n${norm}"
    printf "${importantColor}IMPORTANT sans les / %s$n${norm}"
    printf "${insertColor}Taper ${norm}${hugeIndicationColor}exit${norm}${insertColor} pour confirmer le chemin et passer à la suite.%s$n${norm}"
    printf "${insertColor}Taper ${norm}${hugeIndicationColor}l${norm}${insertColor} pour inspecter le répertoire courant.%s$n${norm}"
    for ((i = 0; i < min; i++)); do
        echo -n -e "${insertColor}Nom du dossier: $n${norm}"
        read dir
        if [ "${dir}" != "exit" ] && [ "${dir}" != "l" ]; then
            path+="${dir}"/
            ((min += 1))
            if [ -d "$(find ~/ -wholename "${path%?}")" ]; then
                printf "${successColor}Ce dossier existe.%s$n${norm}"
            else
                printf "${creationColor}Création du dossier.%s$n${norm}"
                mkdir "${path}"
            fi
            printf "${insertColor}Aperçu du chemin: ${norm}${exampleColor}${path}${norm}%s$doubleNext"
        elif [ "${dir}" = "exit" ]; then
            printf "${insertColor} Sortie...%s$n${norm}"
        elif [ "${dir}" = "l" ]; then
            cd "${path}" || exit
            ls
            ((min += 1))
        fi
    done
}
addDir
cd "${path}" || exit
printf "${insertColor}Processus d'enregistrement dans le répertoire${norm}${exampleColor}$(pwd)%s$n${norm}"
echo -n -e "${insertColor}Suivre les consignes: ${norm}"
printf "${doubleNext}${tab}${indicationColor}Taper ${norm}${hugeIndicationColor}dependancies${norm}${indicationColor} pour installer des dépendances. %s$n${norm}"
printf "${tab}${indicationColor}Taper ${norm}${hugeIndicationColor}restart${norm}${indicationColor} pour recommencer.%s$n${norm}"
printf "${tab}${indicationColor}Taper ${norm}${hugeIndicationColor}menu${norm}${indicationColor} pour retourner au menu principal.%s$n${norm}"
printf "${tab}${indicationColor}Taper ${norm}${hugeIndicationColor}finish${norm}${indicationColor} pour finaliser et enregistrer votre projet.%s$n${norm}"
printf "${tab}${indicationColor}Taper ${norm}${hugeIndicationColor}gitClone${norm}${indicationColor} pour cloner un dépot distant.%s$n${norm}"
read y_n
case "${y_n}" in
dependancies)
    cd "${path}" || exit
    bash "$(find ~/ -name dependancies.sh)"
    bash "$(find ~/ -name git.sh)"
    createProject "${path%?}"
    printf "${answerColor} Projet enregistré ! %s$n${norm}"
    bash "$(find ~/ -name menu.sh)"
    ;;
restart)
    bash "$(find ~/ -name new.sh)"
    ;;
menu)
    bash "$(find ~/ -name menu.sh)"
    ;;
finish)
    createProject "${path%?}"
    printf "${answerColor} Projet enregistré ! %s$n${norm}"
    bash "$(find ~/ -name menu.sh)"
    ;;
gitClone)
    bash "$(find ~/ -name gitClone.sh)"
    createProject "${path%?}"
    printf "${answerColor} Projet enregistré ! %s$n${norm}"
    bash "$(find ~/ -name menu.sh)"
    ;;
esac
exit 0
