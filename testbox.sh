#!/bin/bash

PROGNAME=`basename $0`

function usage()
{
    echo "Usage: $PROGNAME [vagrantbox-filename]" 1>&2
    exit 0
}

test $# -gt 0 || usage;

vagrant box add --name test $1
vagrant up
vagrant ssh
vagrant destroy --force
vagrant box remove --force test
