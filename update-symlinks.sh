#!/bin/bash

THIS=`basename "$(pwd)"`
IP=$1

if [ -n "$IP" ]; then
    echo "Updating saved IP to $IP"
    echo -n $IP > .ip
fi
if [ -z "$IP" ]; then
    IP=`cat .ip`
    echo "Using saved IP $IP"
fi

echo "Importing worlds from minecraft..."
pushd .. > /dev/null
for i in $IP.*.points; do
    if [ ! -h $i ]; then
        T=${i//$IP./}
        mv $i $THIS/$T
    fi
done
popd > /dev/null

echo "Exporting new worlds from git..."
for i in *.points; do
    pushd .. > /dev/null
    if [ ! -e $IP.$i ]; then
        echo "Exporting $IP.$i"
        ln -s $THIS/$i $IP.$i
    fi
    popd > /dev/null
done
