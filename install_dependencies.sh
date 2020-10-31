#!/bin/bash

# install ansible
sudo apt update
sudo apt-get install --yes python3-pip
sudo pip3 install ansible
sudo apt install --yes python3-docker

# install docker
# setup docker repo
sudo apt-get update
sudo apt-get install --yes \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
# now install it
sudo apt-get update
sudo apt-get install --yes docker-ce docker-ce-cli containerd.io

#install kubectl
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# install kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.9.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# install kustomize
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash
sudo mv kustomize /usr/local/bin/kustomize

# install molecule
sudo apt-get install -y libffi-dev git
sudo apt-get install -y python3-pip libssl-dev
sudo python3 -m pip install "molecule[ansible]"

# install oc cli
wget https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
tar xvzf openshift*.tar.gz
sudo mv openshift-origin-client-tools*/oc /usr/local/bin/oc
sudo pip3 install openshift
