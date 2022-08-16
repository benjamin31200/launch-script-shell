#!/bin/bash
set -o posix
insertColor='\033[1;33;4m'
answerColor='\033[01;35m'
importantColor='\033[01;31m'
successColor='\033[1;32m'
greenColor='\033[1;37;42m'
creationColor='\033[1;35m'
indicationColor='\033[3;32m'
indicationColor2='\033[1;32m'
indicationItalic='\033[3;37m'
hugeIndicationColor='\033[5;37;41m'
exampleColor='\033[01;34m'
norm='\033[0m'
n='\n'
doubleNext=$'\n\n'
tab=$'\t\t'
yes=y
non=n
countLines=$(wc --lines <"$(find ~/ -name path.sh)")
min=1

for ((i = 1; i < countLines + 1; i++)); do
    path=$(sed -n "${i}"p path.sh)
    project=$(sed -n "${i}"p name.sh)
    declare -a projectArray=("${projectArray[@]}" "${project}")
    declare -a pathArray=("${pathArray[@]}" "${path}")
done
Lignes=$countLines
Colonnes=1

printf "$doubleNext$indicationColor Aperçu des projets configurés: %s$n$norm"
load_data() {
    local rc=0
    local index
    local ligne
    local colonne
    for i in "${!projectArray[@]}"; do
        ligne=$((rc / Colonnes))
        colonne=1
        ((index = i))
        alpha[$index]=$(echo -e "$indicationColor2 ${projectArray[$i]}$norm ✒ $indicationItalic ${pathArray[$i]} $norm")
        ((rc += 1))
    done
}

affiche_data() {
    local ligne=0
    local index

    echo

    while [ "$ligne" -lt "$Lignes" ]; do
        local colonne=0

        echo -e -n "          $indicationColor2$ligne ▶$norm "

        while [ "$colonne" -lt "$Colonnes" ]; do
            ((index = ligne))
            echo -n "${alpha[index]} "
            ((colonne += 1))
        done

        ((ligne += 1))
        echo

    done
}
load_data
affiche_data

printf "$n$insertColor Copier le chemin du projet à passer en principal%s$norm"
printf "$n$tab$answerColor Appuyer sur $norm${hugeIndicationColor}entrée%s$norm"
printf "$n$tab$answerColor Appuyer sur $norm${hugeIndicationColor}CTRL+D%s$norm$n"
if [ -e "${path}" ]; then
    cat > "$(find ~/ -name mainProject.sh)"
    printf "$answerColor Changement réussi %s$n$norm"
    bash "$(find ~/ -name menu.sh)"
else
    printf "$answerColor Erreur dans la sauvegarde %s$n$norm"
    bash "$(find ~/ -name main.sh)"
fi
