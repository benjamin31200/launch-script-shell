#!/bin/bash
insertColor=$(echo -en '\033[1;33;4m')
answerColor=$(echo -en '\033[01;35m')
errorColor=$(echo -en '\033[01;31m')
indicationColor=$(echo -en '\033[3;32m')
hugeIndicationColor=$(echo -en '\033[5;37;41m')
successColor=$(echo -en '\033[01;32m')
norm=$(echo -en '\033[0m')
yes=y
non=n
next=$'\n'
doubleNext=$'\n\n'
tab=$'\t\t'

function start_project {

	echo -e "${answerColor} démarrage du serveur mysql... ${norm}"
	sudo service mysql start
	echo -e "${answerColor} lancement de mysql ok. ${norm}"
	echo -n -e "${insertColor} Lancer le projet principal ? y/n ${norm}"
	read y_n
	if [ "$y_n" = "$yes" ]; then
		echo -e "${answerColor} Lancement du projet ! ${norm}"
		code "$(cat "$(find ./ -name mainProject.sh)")"
	elif [ "$y_n" = "$non" ]; then
		echo -n -e "${insertColor} Suivre les consignes: ${norm}"
		echo -e "${doubleNext}${tab}${indicationColor} Choisir l'une des options en tapant le mot en surlignement: ${next}${norm}"
		echo -e "${tab}${indicationColor} Pour paramétrer un projet existant, taper: ${norm}${hugeIndicationColor}old${norm}"
		echo -e "${tab}${indicationColor} Pour paramétrer un nouveau projet, taper: ${norm}${hugeIndicationColor}new${norm}"
		echo -e "${tab}${indicationColor} Pour lancer un projet spécifique, taper: ${norm}${hugeIndicationColor}project${norm}"
		echo -e "${tab}${indicationColor} Pour changer de projet principal, taper: ${norm}${hugeIndicationColor}main${norm}"
		echo -e "${tab}${indicationColor} Pour quitter le script, taper: ${norm}${hugeIndicationColor}exit${norm}"
		read y_n
		case "${y_n}" in
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
			echo -e "${answerColor} Sortie du script. ${norm}"
			echo -e "${answerColor} Bonne session ! ${norm}"
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
