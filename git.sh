#!/bin/bash
set -o posix
insertColor='\033[1;33;4m'
answerColor='\033[01;35m'
importantColor='\033[01;31m'
indicationColor='\033[3;32m'
hugeIndicationColor='\033[5;37;41m'
successColor='\033[01;32m'
exampleColor='\033[01;34m'
norm='\033[0m'
n=$'\n'
doubleNext=$'\n\n'
tab=$'\t\t'
yes=y
non=n
date=$(date +%d-%m-%Y)
pseudo=$(git config --global user.name)

createGit() {
    gh auth login
    echo -n -e "$insertColor cloner un dépôt distant ? y/n $norm"
    read y_n
    if [ "$y_n" = "$yes" ]; then
        echo -n -e "${insertColor}Copier l'adresse https du dépot: ${norm}"
        read adress
        gh repo clone "${adress}"
        printf "${answerColor} Repository cloner localement. %s"
    elif [ "$y_n" = "$non" ]; then
        echo -n -e "${insertColor}Nommer le repository ${norm}"
        read name
        echo -n -e "${insertColor}dépôt privé ou public ? private/public ${norm}"
        read visibility
        echo "# dépôt créer le ${date}" >>README.md
        gh repo create "${name}" --clone --description "Repo créer le ${date}" --gitignore VisualStudio --"${visibility}"
        printf "${answerColor} Lien du projet:${norm} https://github.com/${pseudo}/${name} %s"
    fi
}

if [ "$(which gh)" == /usr/bin/gh ]; then
    createGit
else
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null
    sudo apt update
    sudo apt install gh
    createGit
fi
