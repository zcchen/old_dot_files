#!/bin/bash

fusermount -u ~/Documents/Dropbox/
encfs ~/Documents/Dropbox/.crypt/ ~/Documents/Dropbox/decrypt_dir/ \
    --extpass="cat ~/.myPasswd/encfs-dropbox.txt"
