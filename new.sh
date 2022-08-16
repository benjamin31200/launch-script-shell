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
date=$(date +%d-%m-%Y)
pseudo=$(git config --global user.name)
path=~/

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
    if [ -e "name.sh" ]; then
        touch ~/bin/bash/name.sh
        chmod +x "$(find ./ -name name.sh)"
        process "$1"
    else
        process "$1"
    fi
}

init() {
    printf "${doubleNext}${tab}$answerColor Création du package.json en cours... %s$norm$n"
    npm init
    touch .gitignore
    git add .
    git commit -m "npm init"
    git push origin master
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

createGit() {
    gh auth login
    echo -n -e "${insertColor}Nommer le repository ${norm}"
    read name
    echo -n -e "${insertColor}dépôt privé ou public ? private/public ${norm}"
    read visibility
    echo "# dépôt créer le ${date}" >>README.md
    gh repo create "${name}" --description "Repo créer le ${date}" --push --source="${path%?}" --"${visibility}"
    printf "${answerColor} Lien du projet:${norm} https://github.com/${pseudo}/${name} %s"
}

createGitClone() {
    echo -n -e "${insertColor}Copier l'adresse https du dépot: ${norm}"
    read adress
    gh repo clone "${adress}"
    printf "${answerColor} Repository cloner localement. %s"
}

isGH() {
    if [ "$(which gh)" == /usr/bin/gh ]; then
        $1
    else
        curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
        sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null
        sudo apt update
        sudo apt install gh
        $1
    fi
}

addDir
cd "${path}" || exit
printf "${insertColor}Processus d'enregistrement dans le répertoire${norm}${exampleColor}$(pwd)%s$n${norm}"
echo -n -e "${insertColor}Suivre les consignes: ${norm}"
printf "${doubleNext}${tab}${indicationColor}Taper ${norm}${hugeIndicationColor}dependancies${norm}${indicationColor} pour installer des dépendances. %s$n${norm}"
printf "${tab}${indicationColor}Taper ${norm}${hugeIndicationColor}restart${norm}${indicationColor} pour recommencer.%s$n${norm}"
printf "${tab}${indicationColor}Taper ${norm}${hugeIndicationColor}menu${norm}${indicationColor} pour retourner au menu principal.%s$n${norm}"
printf "${tab}${indicationColor}Taper ${norm}${hugeIndicationColor}gitClone${norm}${indicationColor} pour cloner un dépot distant.%s$n${norm}"
read y_n
case "${y_n}" in
dependancies)
    cd "${path}" || exit
    bash "$(find ~/ -name dependancies.sh)"
    git init
    git add .
    git commit -m "initialisation du projet"
    isGH createGit
    init
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
gitClone)
    cd "${path}" || exit
    isGH createGitClone
    createProject "${path%?}"
    printf "${answerColor} Projet enregistré ! %s$n${norm}"
    bash "$(find ~/ -name menu.sh)"
    ;;
esac
exit 0
