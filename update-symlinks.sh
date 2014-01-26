#!/bin/bash

THIS=`basename "$(pwd)"`
IP=$1

echo "Exporting new worlds from git..."
for i in *.points; do
    pushd .. > /dev/null
    if [ ! -e $IP.$i ]; then
        echo "Exporting $IP.$i"
        ln -s $THIS/$i $IP.$i
    fi
    popd > /dev/null
done
