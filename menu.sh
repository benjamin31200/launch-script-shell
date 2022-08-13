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

    echo -n -e "$insertColor Suivre les consignes: $norm"
    printf "$doubleNext$tab$indicationColor Choisir l'une des options en tapant le mot en surlignement: %s$n$norm"
    printf "$tab$indicationColor Pour paramétrer un projet existant, taper: $norm${hugeIndicationColor}old%s$norm$n"
    printf "$tab$indicationColor Pour paramétrer un nouveau projet, taper: $norm${hugeIndicationColor}new%s$norm$n"
    printf "$tab$indicationColor Pour lancer un projet spécifique, taper: $norm${hugeIndicationColor}project%s$norm$n"
    printf "$tab$indicationColor Pour changer de projet principal, taper: $norm${hugeIndicationColor}main%s$norm$n"
    printf "$tab$indicationColor Pour quitter le menu, taper: $norm${hugeIndicationColor}exit%s$norm$n"
    read y_n
    case "$y_n" in
    old)
        bash "$(find ~/ -name old.sh)"
        ;;
    new)
        bash "$(find ~/ -name new.sh)"
        ;;
    project)
        echo "en construction"
        ;;
    main)
        echo "en construction"
        ;;
    exit)
        printf "$answerColor Sortie du menu. %s$n$norm"
        bash "$(find ~/ -name start.sh)"
        ;;
    *)
        exit 0
        ;;
    esac
