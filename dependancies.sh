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

declare -a dependanciesLink=([0]="npx create-react-app" [1]="npm install express --save" [2]="npm install eslint --save-dev" [3]="npm install --save-dev prettier"
    [4]="npm install --save styled-components" [5]="npm i react-router-dom"
    [6]="npm install --save-dev nodemon" [7]="npm install dotenv --save" [8]="npm install express-promise-router --save"
    [9]="npm install mysql" [10]="npm install --save mysql2" [11]="npm i joi"
    [12]="npm i argon2" [13]="npm install --save sequelize" [14]="npm install jsonwebtoken" [15]="npm i jwt-decode" [16]="npm i express-session"
    [17]="npm install sweetalert2" [18]="npm install cookie-parser" [19]="npm install --save sweetalert2-react-content"
    [20]="npm i -g @nestjs/cli" [21]="npm install --save multer" [22]="npm install mongoose --save" [23]="npm install axios"
)

preconfigure() {
    case "$1" in
    react)
        echo -n -e "$insertColor Nom du dossier React: $norm"
        read name
        ${dependanciesLink[0]} "${name}"
        path="$(pwd)"/"${name}"
        cd "${path}" || exit
        ;;
    nest)
        ${dependanciesLink[20]}
        echo -n -e "$insertColor Nom du dossier Nest: $norm"
        read name
        nest new "${name}"
        path="$(pwd)"/"${name}"
        cd "${path}" || exit
        ;;
    express)
        ${dependanciesLink[1]}
        ;;
    reactExpress)
        ${dependanciesLink[1]}
        echo -n -e "$insertColor Nom du dossier React: $norm"
        read name
        ${dependanciesLink[0]} "${name}"
        ;;
    reactNest)
        ${dependanciesLink[20]}
        echo -n -e "$insertColor Nom du dossier Nest: $norm"
        read nameNest
        nest new "${nameNest}"
        echo -n -e "$insertColor Nom du dossier React: $norm"
        read nameReact
        ${dependanciesLink[0]} "${nameReact}"
        cd "${path}" || exit
        ;;
    *)
        exit 0
        ;;
    esac
}
echo -n -e "${insertColor}Choisir un projet préconfigurer ou faire sa propre configuration: $norm${hugeIndicationColor}full$norm / ${hugeIndicationColor}empty${norm}$n"
read answer
if [ "${answer}" = "full" ]; then
    echo -n -e "$insertColor Suivre les consignes: $norm"
    printf "$doubleNext$tab$indicationColor Choisir l'une des options en tapant le mot en surlignement: %s$n$norm"
    printf "$tab$indicationColor Pour paramétrer un projet React, taper: $norm${hugeIndicationColor}react%s$norm$n"
    printf "$tab$indicationColor Pour paramétrer un projet NestJS, taper: $norm${hugeIndicationColor}nest%s$norm$n"
    printf "$tab$indicationColor Pour paramétrer un projet Express, taper: $norm${hugeIndicationColor}express%s$norm$n"
    printf "$tab$indicationColor Pour paramétrer un projet React et express, taper: $norm${hugeIndicationColor}reactExpress%s$norm$n"
    printf "$tab$indicationColor Pour paramétrer un projet React et NestJS, taper: $norm${hugeIndicationColor}reactNest%s$norm$n"
    printf "$tab$indicationColor Pour quitter le menu, taper: $norm${hugeIndicationColor}exit%s$norm$n"
    read answer
    preconfigure "${answer}"
    cd "${path}" || exit
    git init
    git add .
    git commit -m "création du projet ${answer}"
    bash "$(find ~/ -name git.sh)"
    bash "$(find ~/ -name finishProject.sh)"
elif [ "${answer}" = "empty" ]; then
    cd "${path}" || exit
    bash "$(find ~/ -name arrayDependancies.sh)"
fi
exit 0
