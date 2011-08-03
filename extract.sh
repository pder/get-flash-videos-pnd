#!/bin/bash

rm -rf perl5
mkdir perl5
for i in packages/*.ipk packages/*.deb ; do 
    ar -x $i 
    tar xzf data.tar.gz 
done

rm data.tar.gz control.tar.gz debian-binary

cp -r usr/share/perl5/* perl5
cp -r usr/lib/perl5/* perl5
rm -rf usr
