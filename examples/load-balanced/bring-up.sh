#!/bin/bash

# Check whether the prerequisites for this example are set up
check-prerequisites() {
    prereqs="vagrant ansible"
    for curPrereq in $prereqs; do
        if ! hash $curPrereq; then
            echo "$curPrereq needs to be installed"
            return 1
        fi
    done

    if [ ! -f "$HOME/.ssh/id_ed25519.pub" ]; then
        echo "You need to generate an SSH key that Ansible will use to connect to the hosts"
        echo "Do this by running:"
        echo "  ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519"
        return 1
    fi

    return 0
}

# Bring up Vagrant machines
vagrant-up() {
    if ! check-prerequisites ; then
        return 1
    fi
    
    curDir=$PWD
    cd `dirname "$0"`/vagrant
    vagrant up
    res=$?
    cd "${curDir}"

    return $res
}

vagrant-up "$0"
exit $?