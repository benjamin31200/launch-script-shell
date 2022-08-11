#!/bin/bash
insertColor=$(echo -en '\033[1;33;4m')
answerColor=$(echo -en '\033[01;35m')
errorColor=$(echo -en '\033[01;31m')
indicationColor=$(echo -en '\033[3;32m')
successColor=$(echo -en '\033[01;32m')
norm=$(echo -en '\033[0m')
yes=y
non=n

function start_project {

	echo -n -e "${insertColor} On boss sur le projet ? y/n : ${norm}"
	read y_n
	if [ "$y_n" = "$yes" ]; then
		echo -e "${answerColor} go, lancement du projet ! ${norm}"
		#Changer la ligne suivante par votre projet actuel
		code "$(cat ./savePath.sh)"
		#Va lancer le projet sans aucunes commandes C  chaque fois.
	elif [ "$y_n" = "$non" ]; then
		#Lancement du projet principal, changer le projet principal ou lancement d'un projet spC)cifique.
		echo -n -e "${insertColor} Voulez-vous configurer un nouveau projet à la place de celui existant ? y/n ${norm}"
		read y_n
		if [ "$y_n" = "$yes" ]; then
			bash "$(find ./ -name search_dir.sh)"
		elif [ "$y_n" = "$non" ]; then
			echo -e "${answerColor}Projet conservé, sorti du programme.${norm}"
		fi
	fi

}

start_project

exit 0
