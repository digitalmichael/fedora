#!/usr/bin/env bash

set -eux

# Sample custom configuration script - add your own commands here
# to add some additional commands for your environment
#

# Install curl, wget, firefox, git,
#dnf install -y curl wget git tmux firefox xvfb

# Make direectory for downloaded binaries
mkdir /downloads

# Install Fedora Workstation
dnf groupinstall 'Fedora Workstation' -y

# Install DNF Plugin cores
dnf install dnf-plugins-core -y

# Install RPM Fusion repos
dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-24.noarch.rpm -y
dnf install --nogpgcheck http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-24.noarch.rpm -y

# Set environment to boot to graphucal desktop
systemctl set-default graphical.target

# Download and install Fedy
cd /downloads
curl https://www.folkswithhats.org/installer -o fedy-installer
chmod +x fedy-installer && ./fedy-installer

# Install TLP for reduced power consumptio
dnf install tlp -y

# Install Gnoe tweak tool and dconf-editor
dnf install gnome-tweak-tool dconf-editor -y

# Install Yum Extender (gui for package management)
dnf install yumex-dnf -y

# Install Docker
#dnf remove docker docker-common docker-selinux docker-engine-selinux docker-engine -y
dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo -y
dnf makecache fast -y
dnf install docker-ce -y
#groupadd docker
usermod -aG docker vagrant
systemctl enable docker

# Download binaries to /Download
cd /downloads
wget https://packages.chef.io/files/stable/chefdk/2.2.1/el/7/chefdk-2.2.1-1.el7.x86_64.rpm
wget https://releases.hashicorp.com/vagrant/2.0.0/vagrant_2.0.0_x86_64.rpm
wget https://github.com/atom/atom/releases/download/v1.20.1/atom.x86_64.rpm
wget https://bitbucket.org/rhiokim/haroopad-download/downloads/haroopad-v0.13.1-x64.tar.gz
wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh

# Install Git
dnf install git -y

# Update all
#dnf update -y
