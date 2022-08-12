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

function checker() {
    which "$1" | grep -o "$1" >/dev/null && return 0 || return 1
}
checker gh

if checker "$1" == 0; then
    echo "# dd" >>README.md
    git init
    git add README.md
    git commit -m "first commit"
    git branch -M master
    gh auth login
    gh repo create --public
    git push -u origin master
else
    echo -n -e "${insertColor}Autoriser l'installation de CLI GitHub ? y/n ${norm}"
    read y_n
    if [ "$y_n" = "$yes" ]; then
        curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
        sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null
        sudo apt update
        sudo apt install gh
        echo "# dd" >>README.md
        git init
        git add README.md
        git commit -m "first commit"
        git branch -M master
        gh auth login
        gh repo create --public
        git push -u origin master
    elif [ "$y_n" = "$non" ]; then
        echo "# dd" >>README.md
        git init
        git add README.md
        git commit -m "first commit"
        git branch -M master
    fi
fi
