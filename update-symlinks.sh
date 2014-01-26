#!/bin/bash

THIS=`basename "$(pwd)"`
IP=$1

for i in *.points; do
    pushd .. > /dev/null
    ln -s $THIS/$i $IP.$i
    popd > /dev/null
done
