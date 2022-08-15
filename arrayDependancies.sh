#!/bin/bash
set -o posix
insertColor='\033[1;33;4m'
greenColor='\033[4;30;42m'
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
yes=y
non=n

Lignes=5
Colonnes=5
min=1

declare -a dependanciesName=([0]=react [1]=express [2]=eslint [3]=prettier [4]=styled-components [5]=react-router-dom [6]=nodemon [7]=dotenv [8]=express-promise-router [9]=mysql [10]=mysql2 [11]=joi
    [12]=argon2 [13]=sequelize [14]=json-webtoken [15]=jwt-decode [16]=express-session [17]=sweetalert2 [18]=cookie [19]=nestJS [20]=multer [21]=mongoose [22]=axios)

declare -a selectDependancies

nb_element=${#dependanciesName[*]}

for ((i = 0; i < nb_element; i++)); do
    dependanciesName=("${dependanciesName[@]}" "$redColor✘ ${dependanciesName[$i]}$norm")
done

dependanciesName=("${dependanciesName[@]:nb_element}")

load_data() {
    local rc=0
    local index
    for i in "${!dependanciesName[@]}"; do
        local ligne=$(expr $rc / $Colonnes)
        local colonne=$(expr $rc % $Lignes)
        let "index = $ligne * $Lignes + $colonne"
        alpha[$index]=$(echo -e "${dependanciesName[$i]}")
        let "rc += 1"
    done
}

affiche_data() {
    local ligne=0
    local index

    echo

    while [ "$ligne" -lt "$Lignes" ]; do
        local colonne=0

        echo -n "          ● "

        while [ "$colonne" -lt "$Colonnes" ]; do
            let "index = $ligne * $Lignes + $colonne"
            echo -n "${alpha[index]} "
            let "colonne += 1"
        done

        let "ligne += 1"
        echo

    done
}
load_data
affiche_data
for ((e = 0; e < min; e++)); do
    echo -n -e "$doubleNext$insertColor copier/coller la dépendance pour l'ajouter, taper $norm${hugeIndicationColor}end$norm pour confirmer: $norm$n"
    read answer
    if [ "${answer}" != "end" ]; then
        for ((i = 0; i < nb_element; i++)); do
            if [ "${dependanciesName[i]}" = "$redColor✘ $answer$norm" ]; then
                dependanciesName=("${dependanciesName[@]//"$redColor✘ ${answer}$norm"/"$greenColor✔ ${answer}$norm"}")
                selectDependancies=("${selectDependancies[@]}" "${answer}")
                echo "${selectDependancies[@]}"
                load_data
                affiche_data
                ((min += 1))
            fi
        done
    elif [ "${answer}" = "end" ]; then
        exit 0
    fi
done

exit 0
