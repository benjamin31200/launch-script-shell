#!/bin/bash
set -o posix
insertColor='\033[1;33;4m'
answerColor='\033[01;35m'
importantColor='\033[01;31m'
successColor='\033[1;32m'
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

function process {
    printf "${doubleNext}${insertColor} suiver les instructions: %s$n${norm}"
    find ~/ -wholename "${1}"
    printf "${doubleNext}${tab}${indicationColor} copier/coller le chemin d'accès du projet.%s$n${tab}${norm}"
    printf "${indicationColor} puis appuyer sur ${norm}${hugeIndicationColor}entrée%s${norm}$n"
    printf "${tab}${indicationColor} enfin, appuyer sur ${norm}${hugeIndicationColor}CTRL+D%s${norm}$n"
    cat >>"$(find ~/ -name path.sh)"
}

function addDir {
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
printf "${doubleNext}${tab}${indicationColor}Taper ${norm}${hugeIndicationColor}git${norm}${indicationColor} pour finaliser votre projet et créer un dépot git.%s$n${norm}"
printf "${tab}${indicationColor}Taper ${norm}${hugeIndicationColor}restart${norm}${indicationColor} pour recommencer la création.%s$n${norm}"
printf "${tab}${indicationColor}Taper ${norm}${hugeIndicationColor}dependancies${norm}${indicationColor} pour installer des dépendances sur le projet nouvellement créer.%s$n${norm}"
printf "${tab}${indicationColor}Taper ${norm}${hugeIndicationColor}menu${norm}${indicationColor} pour retourner au menu principal.%s$n${norm}"
read y_n
case "${y_n}" in
git)
    bash "$(find ~/ -name git.sh)"
    process "${path%?}"
    printf "${answerColor} Projet enregistré ! %s$n${norm}"
    bash "$(find ~/ -name menu.sh)"
    ;;
restart)
    bash "$(find ~/ -name new.sh)"
    ;;
dependancies)
    bash "$(find ~/ -name dependencies.sh)"
    ;;
esac
exit 0
