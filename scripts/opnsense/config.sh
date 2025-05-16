#!/bin/bash

set -e

WANIP=192.168.1.25
WAN_GW=192.168.1.1
LAN_NET=172.18
HOSTNAME=opn17
DOMAIN=lan
DNS_SERVER=192.168.1.1

cat config.xml.tpl | \
    sed -e "s/\#\#WANIP\#\#/${WANIP}/" | \
    sed -e "s/\#\#WANGW\#\#/${WAN_GW}/" | \
    sed -e "s/\#\#LANNET\#\#/${LAN_NET}/" | \
    sed -e "s/\#\#HOSTNAME\#\#/${HOSTNAME}/" | \
    sed -e "s/\#\#DOMAIN\#\#/${DOMAIN}/" | \
    sed -e "s/\#\#DNSSERVER\#\#/${DNS_SERVER}/" | tee config.xml

