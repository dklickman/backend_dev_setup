#! /bin/bash
# Attribution: https://github.com/pyenv/pyenv

# Variables
red=$(tput setaf 1)
green=$(tput setaf 2)
normal=$(tput sgr0)


#check if root
if [[ $EUID -ne 0 ]]; then
	printf "\n********** ERROR *********"
    printf "\nThis script needs be run as root!\n\n"
	exit 1
fi


function install_pyenv() {
    printf 'Starting pyenv installation...\n'
    printf 'Pulling git repository...\n'
    #git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    printf 'done\n'
    printf 'Setting up environmental variables and adding to PATH\n'
    #echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    #echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    printf 'done\n'
    printf 'Adding pyenv to init\n'
    #echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
    printf 'done\n'
    printf 'Restarting shell and exiting...\n'
    source ~/.bashrc
    printf 'Checking if pyenv is availble\n'
        if [ -d ~/.pyenv ]; then
            printf "${green}Pyenv has been installed successfully${normal}\n"
        else
            printf "${red}Pyenv failed to install...${normal}\n"
        fi
}

install_pyenv