#!/bin/bash

ca_china=(
CNNIC_ROOT.pem
China_Internet_Network_Information_Center_EV_Certificates_Root.pem
WoSign_China.pem
)
blacklist_path="/etc/ca-certificates/trust-source/blacklist/"
ca_path="/etc/ca-certificates/extracted/cadir/"
update_cmd="update-ca-trust"

usage="Usage: sudo remove-cnnic.sh <remove_blacklist|add_blacklist>"

function remove() {
    for (( i = 0; i < ${#ca_china[@]}; i++ )); do
        if [[ -f ${blacklist_path}${ca_china[i]} ]]; then
            cmd="rm ${blacklist_path}${ca_china[i]}"
            echo ${cmd}
            `${cmd}`
        else
            echo "${blacklist_path}${ca_china[i]} not exists!"
        fi
    done
}

function add_blacklist() {
    remove
    `${update_cmd}`
    for (( i = 0; i < ${#ca_china[@]}; i++ )); do
        if [[ -f ${ca_path}${ca_china[i]} ]]; then
            cmd="cp ${ca_path}${ca_china[i]} ${blacklist_path}${ca_china[i]}"
            echo ${cmd}
            `${cmd}`
        else
            echo "${ca_path}${ca_china[i]} not exists!"
        fi
    done
    `${update_cmd}`
    echo "Adding done!"
}

if [[ $1 == 'remove_blacklist' && $(id -u) == 0 ]]; then
    remove
elif [[ $1 == 'add_blacklist' && $(id -u) == 0 ]]; then
    add_blacklist
else
    echo ${usage}
fi
