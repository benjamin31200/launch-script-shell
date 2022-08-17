#!/bin/bash
set -o posix
insertColor='\033[1;33;4m'
indicationColor='\033[3;32m'
hugeIndicationColor='\033[5;37;41m'
norm='\033[0m'
n=$'\n'
doubleNext=$'\n\n'
tab=$'\t\t'

    echo -n -e "$insertColor Suivre les consignes: $norm"
    printf "$doubleNext$tab$indicationColor Choisir l'une des options en tapant le mot surligné: %s$n$norm"
    printf "$tab$indicationColor Pour paramétrer un projet existant, taper: $norm${hugeIndicationColor}old%s$norm$n"
    printf "$tab$indicationColor Pour paramétrer un nouveau projet, taper: $norm${hugeIndicationColor}new%s$norm$n"
    printf "$tab$indicationColor Pour lancer/supprimer un projet spécifique, taper: $norm${hugeIndicationColor}project%s$norm$n"
    printf "$tab$indicationColor Pour changer de projet principal, taper: $norm${hugeIndicationColor}main%s$norm$n"
    printf "$tab$indicationColor Pour quitter le script, taper: $norm${hugeIndicationColor}exit%s$norm$n"
    read answer
    case "$answer" in
    old)
        bash "$(find ~/ -name old.sh)"
        ;;
    new)
        bash "$(find ~/ -name new.sh)"
        ;;
    project)
        bash "$(find ~/ -name project.sh)"
        ;;
    main)
        bash "$(find ~/ -name main.sh)"
        ;;
    exit)
        exit 0
        ;;
    *)
        exit 0
        ;;
    esac
