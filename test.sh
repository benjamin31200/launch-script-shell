#!/bin/bash
 highlight=$(echo -en '\033[01;31m')
norm=$(echo -en '\033[0m')
echo -n -e "${highlight} On boss ?  ${norm}"
exit 0
