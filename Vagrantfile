# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/ubuntu-20.04"

  config.vm.provider :virtualbox do |v|
    v.name = "i3"
    v.gui = true
    v.memory = 4096
    v.cpus = 2
  end

  config.vm.hostname = "i3"

  # Ansible provisioner.
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "vagrant.yml"
    ansible.verbose = "v"
    ansible.sudo = true
  end

end
