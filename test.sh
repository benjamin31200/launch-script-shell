#!/bin/bash
 
echo -e "Saisir le nom du fichier a rechercher \c"
read fnom
 
find ~/ -name *$fnom* 
 
exit 0
