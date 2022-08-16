#!/bin/bash
set -o posix
insertColor='\033[1;33;4m'
blueColor='\033[1;37;44m'
redColor='\033[1;37;41m'
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
simpleTab=$'\t'
yes=y
non=n
path=$(pwd)

Lignes=5
Colonnes=5
min=1

declare -a dependanciesName=([0]=react [1]=express [2]=eslint [3]=prettier [4]=styled-components [5]=react-router-dom [6]=nodemon [7]=dotenv [8]=express-promise-router [9]=mysql [10]=mysql2 [11]=joi
    [12]=argon2 [13]=sequelize [14]=json-webtoken [15]=jwt-decode [16]=express-session [17]=sweetalert2 [18]=cookie [19]=sweetalert2-react [20]=nestJS [21]=multer [22]=mongoose [23]=axios)

declare -a selectDependancies

nb_element=${#dependanciesName[*]}

for ((i = 0; i < nb_element; i++)); do
    dependanciesName=("${dependanciesName[@]}" "$redColor✘ ${dependanciesName[$i]} $norm")
done

dependanciesName=("${dependanciesName[@]:nb_element}")

load_data() {
    local rc=0
    local index
    local ligne
    local colonne
    for i in "${!dependanciesName[@]}"; do
        ligne=$((rc / Colonnes))
        colonne=$((rc % Lignes))
        ((index = ligne * Lignes + colonne))
        alpha[$index]=$(echo -e "${dependanciesName[$i]}▉▉")
        ((rc += 1))
    done
}

affiche_data() {
    local ligne=0
    local index

    echo

    while [ "$ligne" -lt "$Lignes" ]; do
        local colonne=0

        echo -n "       ● "

        while [ "$colonne" -lt "$Colonnes" ]; do
            ((index = ligne * Lignes + colonne))
            echo -n "${alpha[index]}"
            ((colonne += 1))
        done

        ((ligne += 1))
        echo "$n$simpleTab▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬"

    done
}
load_data
affiche_data

declare -a dependanciesLink=([0]="npx create-react-app" [1]="npm install express --save" [2]="npm install eslint --save-dev" [3]="npm install --save-dev prettier"
    [4]="npm install --save styled-components" [5]="npm i react-router-dom"
    [6]="npm install --save-dev nodemon" [7]="npm install dotenv --save" [8]="npm install express-promise-router --save"
    [9]="npm install mysql" [10]="npm install --save mysql2" [11]="npm i joi"
    [12]="npm i argon2" [13]="npm install --save sequelize" [14]="npm install jsonwebtoken" [15]="npm i jwt-decode" [16]="npm i express-session"
    [17]="npm install sweetalert2" [18]="npm install cookie-parser" [19]="npm install --save sweetalert2-react-content"
    [20]="npm i -g @nestjs/cli ; nest new" [21]="npm install --save multer" [22]="npm install mongoose --save" [23]="npm install axios"
)

for ((e = 0; e < min; e++)); do
    echo -n -e "$doubleNext$insertColor copier/coller la dépendance pour l'ajouter, taper $norm${hugeIndicationColor}end$norm pour confirmer: $norm$n"
    read answer
    if [ "${answer}" != "end" ]; then
        for ((i = 0; i < nb_element; i++)); do
            if [ "${dependanciesName[i]}" = "$redColor✘ $answer $norm" ]; then
                dependanciesName=("${dependanciesName[@]//"$redColor✘ ${answer} $norm"/"$blueColor✔ ${answer} $norm"}")
                if [ "${answer}" == "react" ]; then
                    echo -n -e "$doubleNext$insertColor Rentrer le nom du dossier react: $norm$n"
                    read name
                    path="$(pwd)"/"${name}"
                    selectDependancies=("${selectDependancies[@]}" "${dependanciesLink[i]} ${name}")
                elif [ "${answer}" != "react" ]; then
                    selectDependancies=("${selectDependancies[@]}" "${dependanciesLink[i]}")
                fi
                load_data
                affiche_data
                ((min += 1))
            fi
        done
    fi
done
echo "${!selectDependancies[0]}" 
exit 0
nb_elementSelect=${#selectDependancies[*]}
for ((i = 0; i < nb_elementSelect; i++)); do
    ${selectDependancies[i]}
done
cd "${path}" || exit
git init
git add .
git commit -m "création du projet ${answer}"
bash "$(find ~/ -name git.sh)"
bash "$(find ~/ -name finishProject.sh)"

exit 0
