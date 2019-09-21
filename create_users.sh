#!/bin/bash

echo "Attention! You need change default users, before create image in create_users.sh"
exit 1

# Public user files will be shared by nbviewer

password="qwerty"
pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
username="public"

useradd -m -p $pass $username

password="qwerty"
pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
username="jupiter_admin"

useradd -m -p $pass $username
