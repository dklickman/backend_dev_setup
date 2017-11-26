#! /bin/bash
red=$(tput setaf 1)
green=$(tput setaf 2)
normal=$(tput sgr0)

if [[ $EUID -ne 0 ]]; then
	printf "\n********** ERROR *********"
    printf "\nThis script needs be run as root!\n\n"
	exit 1
fi

printf "${red}This text is red${normal}\n"
printf "${green}should be green${normal}\n"

mkdir ~/Downloads/dl_temp
