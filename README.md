# Ansible development environment

Ansible playbook to install and configure my dev env on Ubuntu.

This playbook installs i3-gaps and some additional tools to provide a complete i3 environment.

## Features

This Ansible role installs the following components:

  * [sway](https://swaywm.org/)
  * [ansible](https://www.ansible.com/)
  * [sublime](https://www.sublimetext.com/)
  * [fzf](https://www.sublimetext.com/)
  * [vscode](https://code.visualstudio.com/)
  * [docker](https://www.docker.com/)
  * [google-chrome]
  * [firefox]
  * [node](https://nodejs.org/en/)
  * [libreoffice]
  * [vlc]
  * [zoom]
  * [silversearcher-ag](https://github.com/ggreer/the_silver_searcher)
  * [pulseaudio]
  * [ansible](https://www.ansible.com/)
  * [pycharm](https://www.jetbrains.com/pycharm/)
  * [themes] Random wallpapers and custom betterlockscreen(https://github.com/pavanjadhaw/betterlockscreen) modified


## Usage

Clone repo and run the playbook:

```
ansible-playbook playbook.yml -i hosts -e action=install -e sym_links=true -K
```

This repo contains ssh private keys encrypted with ansible-vault. By default are disabled, if you want to add them or create your own set add_ssh_pkeys to true and encrypt your own.

```
ansible-playbook playbook.yml -i hosts -e action=install -e add_ssh_pkeys=true -K
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
  * Install wrk
  * Install wine 
  * Install all python versions
  * Install aws
  * Install wormhole

