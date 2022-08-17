#!/bin/bash
set -o posix
insertColor='\033[1;33;4m'
answerColor='\033[01;35m'
norm='\033[0m'
yes=y
non=n
n='\n'

start() {
	echo -n -e "$insertColor Lancer le projet principal ? y/n $norm"
	read y_n
	if [ "$y_n" = "$yes" ]; then
		printf "$answerColor Lancement du projet ! %s$n$norm"
		code "$(cat "$(find ./ -name mainProject.sh)")"
	elif [ "$y_n" = "$non" ]; then
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
