#! /bin/bash
# Attribution: https://github.com/pyenv/pyenv

#check if root

function 

echo 'Starting pyenv installation...'
echo ''
echo 'Pulling git repository...'
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'done'
echo 'Setting up environmental variables and adding to PATH'
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'done'
echo 'Adding pyenv to init'
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
echo 'done'
echo 'Restarting shell and exiting...'
exec "$SHELL"

