#!/bin/bash
set -o posix
insertColor='\033[1;33;4m'
answerColor='\033[01;35m'
hugeIndicationColor='\033[5;37;41m'
norm='\033[0m'
n='\n'

start() {
	echo -n -e "$insertColor Lancer le projet principal: $norm${hugeIndicationColor}oui$norm / ${hugeIndicationColor}non$norm : "
	read answer
	if [ "$answer" = "oui" ]; then
		printf "$answerColor Lancement du projet ! %s$n$norm"
		code "$(cat "$(find ./ -name mainProject.sh)")"
	elif [ "$answer" = "non" ]; then
		bash "$(find ~/ -name menu.sh)"
	else
		start
	fi
}

sudo service mysql status
sql=$?
if [[ $sql == 3 ]]; then
	printf "$answerColor démarrage du serveur mysql... %s$n$norm"
	sudo service mysql start
	printf "$answerColor lancement de mysql ok. %s$n$norm"
	start
elif [[ $sql == 0 ]]; then
	start
fi
exit 0
