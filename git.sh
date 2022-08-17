#!/bin/bash
set -o posix
insertColor='\033[1;33;4m'
answerColor='\033[01;35m'
hugeIndicationColor='\033[5;37;41m'
norm='\033[0m'
doubleNext=$'\n\n'
tab=$'\t\t'
path=$(pwd)
echo "${path} / fichier git"
date=$(date +%d-%m-%Y_%Hh%M)
pseudo=$(git config --global user.name)

createGit() {
    gh auth login
    echo -n -e "${insertColor}Nommer le repository ${norm}"
    read name
    echo -n -e "${insertColor}dépôt privé ou public ? $norm${hugeIndicationColor}private$norm / ${hugeIndicationColor}public${norm} : "
    read visibility
    echo "# dépôt créer le ${date}" >>README.md
    gh repo create "${name}" --description "Repo créer le ${date}" --push --source="${path}" --"${visibility}"
    printf "${answerColor} Lien du projet:${norm} https://github.com/${pseudo}/${name} %s"
}

init() {
    printf "${doubleNext}${tab}$answerColor Création du package.json en cours... %s$norm$doubleNext"
    npm init
    touch .gitignore
    git add .
    git commit -m "npm init"
    git push origin master
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

isGH createGit
init
