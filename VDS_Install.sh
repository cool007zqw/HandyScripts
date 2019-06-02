#!/bin/sh

wget http://www.vdsheaven.com/statics/V-Dimension-0.9.13-1-1f520b4-amd64.deb -O VDS.deb
apt install ./VDS.deb
mkdir ~/.vds
wget https://raw.githubusercontent.com/cool007zqw/HandyScripts/master/vds.conf -P ~/.vds
vds-fetch-params
vdsd
