#!/bin/bash
set -o posix
insertColor='\033[1;33;4m'
answerColor='\033[01;35m'
indicationColor='\033[3;32m'
hugeIndicationColor='\033[5;37;41m'
norm='\033[0m'
yes=y
non=n
n='\n'
doubleNext='\n\n'
tab='\t\t'

function start_project {

	printf "$answerColor démarrage du serveur mysql... %s$n$norm"
	sudo service mysql start
	printf "$answerColor lancement de mysql ok. %s$n$norm"
	echo -n -e "$insertColor Lancer le projet principal ? y/n $norm"
	read y_n
	if [ "$y_n" = "$yes" ]; then
		printf "$answerColor Lancement du projet ! %s$n$norm"
		code "$(cat "$(find ./ -name mainProject.sh)")"
	elif [ "$y_n" = "$non" ]; then
		echo -n -e "$insertColor Suivre les consignes: $norm"
		printf "$doubleNext$tab$indicationColor Choisir l'une des options en tapant le mot en surlignement: %s$n$norm"
		printf "$tab$indicationColor Pour paramétrer un projet existant, taper: $norm${hugeIndicationColor}old%s$n$norm"
		printf "$tab$indicationColor Pour paramétrer un nouveau projet, taper: $norm${hugeIndicationColor}new%s$n$norm"
		printf "$tab$indicationColor Pour lancer un projet spécifique, taper: $norm${hugeIndicationColor}project%s$n$norm"
		printf "$tab$indicationColor Pour changer de projet principal, taper: $norm${hugeIndicationColor}main%s$n$norm"
		printf "$tab$indicationColor Pour quitter le script, taper: $norm${hugeIndicationColor}exit%s$n$norm"
		read y_n
		case "$y_n" in
		old)
			bash "$(find ./ -name old.sh)"
			;;
		new)
			bash "$(find ./ -name new.sh)"
			;;
		project)
			echo "en construction"
			;;
		main)
			echo "en construction"
			;;
		exit)
			printf "$answerColor Sortie du script. %s$n$norm"
			printf "$answerColor Bonne session ! %s$n$norm"
			exit 0
			;;
			*)
			start_project
		esac
	else
		start_project
	fi
}

start_project
exit 0
