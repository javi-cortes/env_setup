# Ansible development environment 

Ansible playbook to install and configure my dev env on Ubuntu.

This playbook installs i3-gaps and some additional tools to provide a complete i3 environment.


## Features

This Ansible role installs the following components:

  * [i3](https://i3wm.org/) the tiling window manager with a custom config.
  * [rofi](https://davedavenport.github.io/rofi/): A window switcher, run dialog and dmenu replacement
  * [compton](https://github.com/chjj/compton) a compositor for X11.
  * [conky](https://github.com/brndnmtthws/conky) a Light-weight system monitor for X with custom theme.
  * [lightdm](https://www.freedesktop.org/wiki/Software/LightDM/) with custom theme.



## Usage

First, copy `vars/vars.yml.example` to `vars/vars.yml` and add your username and your password.


Then you can start the playbook:

```
ansible-playbook playbook.yml -i hosts -e action=install
```


## Vagrant

To Ansible playbook can be tested with Vagrant:

```
vagrant up
```


## TODO
  * Polybar
  * Lightdm greeter:https://github.com/nick92/Enso-OS/tree/master/greeter
