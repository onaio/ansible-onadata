#!/bin/bash

# Check whether the prerequisites for this example are set up
check-prerequisites() {
    prereqs="vagrant"
    for curPrereq in $prereqs; do
        if ! hash $curPrereq; then
            echo "$curPrereq needs to be installed"
            return 1
        fi
    done

    return 0
}

# Bring up Vagrant machines
vagrant-cleanup() {
    if ! check-prerequisites ; then
        return 1
    fi
    
    curDir=$PWD
    cd `dirname "$0"`/vagrant
    vagrant destroy -f
    res=$?
    cd "${curDir}"

    return $res
}

vagrant-cleanup "$0"