#!bin/bash
path=~/
min=1
for ((i = 0; i <min; i++)); do
    echo -n -e "nom du répertoire"
    read dir
    if [ "${dir}" != "exit" ]; then
        path+="${dir}"+="${i}"+=/
        ((min+=1))
echo "${min}"
    elif [ "${dir}" = "exit" ]; then
        echo "${path}"
    fi
done
