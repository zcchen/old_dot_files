#!/bin/bash

fusermount -u ~/Documents/Dropbox/
encfs ~/Documents/.DropBox-crypt/Dropbox/ ~/Documents/Dropbox/ \
    --extpass="cat ~/.myPasswd/encfs-dropbox.txt"
