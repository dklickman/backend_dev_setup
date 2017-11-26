#! /bin/bash
# Attribution: https://github.com/pyenv/pyenv

# Installation Variables
USER=$SUDO_USER
red=$(tput setaf 1)
green=$(tput setaf 2)
normal=$(tput sgr0)
mkdir /home/$USER/Downloads/dl_temp 
dl_temp=/home/$USER/Downloads

#check if root
if [[ $EUID -ne 0 ]]; then
	printf "\n********** ERROR *********"
    printf "\nThis script needs be run as root!\n\n"
	exit 1
fi

function prompt_install_option() {
    printf "\nEnter 1 for Desktop Install (GUI and CLI tools)\nEnter 2 for Server Option (CLI tools)\n"
    printf "Both options will import config files and place them in the appropriate directory.\n"
        read -p "Installation Selection: " userChoice
        case $userChoice in 

                [1] )
                    echo "Desktop selected..."
                    desktop_install;
                    ;; 
                [2] )
                    echo "Server selected..." 
                    server_install;
                    ;;
                *) printf "${red} \nInvalid input!, Please make a valid selection!${normal}\n"
                        prompt_install_option;
                    ;;
        esac
    }

function install_apt_packages() {
    printf "Checking for and applying system updates...\n"
    #apt update && apt upgrade -y
    printf "Installing native apt packages...\n"
    #apt install vim git -y
    printf "${green}Sucessfully installed: vim, git${normal}\n"
    }

function install_youtubedl() {
    printf "Fetching youtube-dl...\n"
    #wget -c https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
    printf "Updating permissions...\n"
    #chmod a+rx /usr/local/bin/youtube-dl
    printf "Installing ffmpeg...\n"
    #app install ffmpeg
    printf "done\n"
    printf "${green}Successfully installed youtube-dl${normal}\n"
    }

function install_postman() {
    printf "Fetching postman package...\n"
    #wget -c -O $dl_temp/postman https://dl.pstmn.io/download/latest/linux64 
    printf "done\n"
    printf "Extracting postman to /opt...\n"
    #tar -xvf $dl_temp/postman -C /opt
    printf "Creating sym link...\n"
    #ln -s /opt/Postman/Postman /usr/bin/postman
    printf "${green}Successfully installed Postman${normal}\n"
    }

function install_vs_code() {
    printf "Fetching Visual Studio Code...\n"
    #wget -c $dl_temp/code.deb https://go.microsoft.com/fwlink/?LinkID=760868
    printf "done\n"
    printf "Installing Visual Studio Code...\n"
    #dpkg -i $dl_temp/code.deb
    printf "${green}Successfully installed Visual Studio Code${normal}\n"
    }

function install_chrome() {
    printf "Fetching chrome package...\n"
    #wget -c -O $dl_temp/chrome_stable.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    printf "done\n"
    printf "Installing chrome stable...\n"
    #dpkg -i $dl_temp/chrome_stable.deb
    printf "${green}Successfully installed Chrome Stable${normal}\n"
    }

# ToDo: Come back to automate / check for docker latest stable to handle the 
# addition of the apt-key fingerprint
function install_docker() {
    printf "Removing older versions of Docker...\n"
    printf "This will NOT remove docker containers, images, or networks\n"
    #apt remove docker docker-engine docker.io
    printf "Adding dokcer community edition repository\n"
    #apt install linux-image-extra-$(uname -r) linux-image-extra-virtual
    #apt install apt-transport-https ca-certificates curl software-properties-common
    #curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    #apt-key fingerprint 0EBFCD88
    #add-apt-repository \
   #"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   #$(lsb_release -cs) \
   #stable"
   #apt update
   printf "Installing docker community edition...\n"
   #apt install docker-ce
   printf "Adding user to docker group...\n"
   #usermod -a -G docker $USER
   printf "${green}Successfully installed docker${normal}\n"
}

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
    printf 'Sourcing .bashrc...\n'
    source ~/.bashrc
    printf 'Checking if pyenv is availble\n'
        if [ -d ~/.pyenv ]; then
            printf "${green}Successfully installed pyenv${normal}\n"
        else
            printf "${red}Pyenv failed to install...${normal}\n"
        fi
    }

function server_install() {
    install_apt_packages    
    install_pyenv
    }

function desktop_install() {
    install_apt_packages
    install_pyenv
    install_youtubedl
    install_postman
    install_vs_code
    install_chrome
    install_docker
    }
prompt_install_option