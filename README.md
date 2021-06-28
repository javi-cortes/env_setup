# Ansible development environment 

Ansible playbook to install and configure my dev env on Ubuntu.

This playbook installs i3-gaps and some additional tools to provide a complete i3 environment.

## Features

This Ansible role installs the following components:

  * [i3-gaps](https://github.com/Airblader/i3) the tiling window manager with a custom config.
  * [rofi](https://davedavenport.github.io/rofi/): A window switcher, run dialog and dmenu replacement
  * [compton](https://github.com/chjj/compton) a compositor for X11.
  * [ansible](https://www.ansible.com/)
  * [sublime](https://www.sublimetext.com/)
  * [fzf](https://www.sublimetext.com/)
  * [vscode](https://code.visualstudio.com/)
  * [docker](https://www.docker.com/)
  * [docker-compose](https://docs.docker.com/compose/)
  * [google-chrome]
  * [firefox]
  * [node](https://nodejs.org/en/)
  * [libreoffice]
  * [vlc]
  * [openfortigui]
  * [zoom]
  * [silversearcher-ag](https://github.com/ggreer/the_silver_searcher)
  * [pulseaudio]
  * [ansible](https://www.ansible.com/)
  * [pycharm](https://www.jetbrains.com/pycharm/)
  * [themes] Random wallpapers and custom betterlockscreen(https://github.com/pavanjadhaw/betterlockscreen) modified


## Usage

Clone repo and run the playbook:

```
ansible-playbook playbook.yml -i hosts -e action=install
```

This repo contains ssh private keys encrypted with ansible-vault. By default are disabled, if you want to add them or create your own set add_ssh_pkeys to true and encrypt your own.

```
ansible-playbook playbook.yml -i hosts -e action=install add_ssh_pkeys=true
```

## Encrypting pkeys example:

You'll need a password in the host that executes ansible and encrypt the private keys with that.

```
touch ~/.ansible.cfg

# set the following content
[defaults]
vault_password_file=/path/to/your/vault_secret.sh

# After that set the password in /path/to/your/vault_secret.sh, e.g.:
#!/bin/bash
echo yourpassword

chmod +x vault_secret.sh

# Run encrypt 

ansible-vault encrypt path/to/my/pkeys/id_rsa*
```


## Testing your playbook with Vagrant 

To Ansible playbook can be tested with Vagrant:

```
vagrant up --provision
```

Once the VM is running you can use the following to run ansible anytime:

```
vagrant provision
```


## TODO
  * add python3.9 utils: sudo apt-get install python3.9-distutils --reinstall
  * install pipenv
  * ngrok
  * Polybar
  * Lightdm greeter:https://github.com/nick92/Enso-OS/tree/master/greeter
  * https://github.com/AdguardTeam/AdGuardHome#getting-started
  * Remove login box rendered on betterlockscreen
  * change dns server 
  ** https://www.unixmen.com/how-to-find-best-and-fast-dns-servers-to-optimize-your-internet-speed/ 
  ** https://www.tecmint.com/set-permanent-dns-nameservers-in-ubuntu-debian/
  * install pyenv: https://github.com/pyenv/pyenv-installer
     sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git


