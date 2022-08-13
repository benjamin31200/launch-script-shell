#!/bin/bash
insertColor=$(echo -en '\033[1;33;4m')
answerColor=$(echo -en '\033[01;35m')
importantColor=$(echo -en '\033[01;31m')
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

path=~/

function process {
    echo -e "${insertColor} suiver les instructions: ${norm}"
    find ~/ -wholename "${1}"
    echo -e "${doubleNext}${tab}${indicationColor} copier/coller le chemin d'accès du projet.${tab}${norm}"
    echo -e "${tab}${indicationColor} puis appuyer sur ${norm}${hugeIndicationColor}entrée${norm}"
    echo -e "${tab}${indicationColor} enfin, appuyer sur ${norm}${hugeIndicationColor}CTRL+D${norm}${next}"
    cat >>"$(find ~/ -name path.sh)"
}

function addDir {
    min=1
    echo -e "${insertColor}Rentrer le nom du dossier à chaque demande, s'il n'existe pas le créera automatiquement. ${norm}"
    echo -e "${importantColor}IMPORTANT sans les / ${norm}"
    echo -e "${insertColor}Taper ${norm}${hugeIndicationColor}exit${norm}${insertColor} pour confirmer le chemin et passer à la suite.${norm}"
    echo -e "${insertColor}Taper ${norm}${hugeIndicationColor}l${norm}${insertColor} pour inspecter le répertoire courant.${norm}"
    for ((i = 0; i < min; i++)); do
        echo -n -e "${insertColor}Nom du dossier: ${norm}"
        read dir
        if [ "${dir}" != "exit" ] && [ "${dir}" != "l" ]; then
            path+="${dir}"/
            ((min += 1))
            if [ -d "$(find ~/ -wholename "${path%?}")" ]; then
                echo -e "${insertColor}Ce dossier existe.${norm}"
            else
                echo -e "${insertColor}Création du dossier.${norm}"
                mkdir "${path}"
            fi
            echo -e "${insertColor}Aperçu du chemin: ${norm}${exampleColor}${path}${norm}${next}"
        elif [ "${dir}" = "exit" ]; then
            echo -e "${insertColor} Sortie...${norm}"
        elif [ "${dir}" = "l" ]; then
            cd "${path}" || exit
            ls -l
            ((min += 1))
        fi
    done
}
addDir
cd "${path}" || exit
echo -e "${insertColor}Processus d'enregistrement dans le répertoire${norm}${exampleColor}$(pwd)${norm}"
echo -n -e "${insertColor}Suivre les consignes: ${norm}"
echo -e "${doubleNext}${tab}${indicationColor}Taper ${norm}${hugeIndicationColor}git${norm}${indicationColor} pour finaliser votre projet et créer un dépot git.${norm}"
echo -e "${tab}${indicationColor}Taper ${norm}${hugeIndicationColor}restart${norm}${indicationColor} pour recommencer la création.${norm}"
echo -e "${tab}${indicationColor}Taper ${norm}${hugeIndicationColor}dependancies${norm}${indicationColor} pour installer des dépendances sur le projet nouvellement créer.${norm}"
echo -e "${tab}${indicationColor}Taper ${norm}${hugeIndicationColor}gitclone${norm}${indicationColor} pour finaliser votre projet depuis un dépot git existant.${norm}"
echo -e "${tab}${indicationColor}Taper ${norm}${hugeIndicationColor}save${norm}${indicationColor} pour enregistrer votre projet.${norm}"
read y_n
case "${y_n}" in
git)
    bash "$(find ~/ -name git.sh)"
    process "${path%?}"
    echo -e "${answerColor} Projet enregistré ! ${norm}"
    bash "$(find ~/ -name start.sh)"
    ;;
restart)
    bash "$(find ~/ -name new.sh)"
    ;;
dependancies)
    echo "en construction"
    ;;
gitclone)
    echo "en construction"
    ;;
save)
    echo "en construction"
    ;;
esac
exit 0