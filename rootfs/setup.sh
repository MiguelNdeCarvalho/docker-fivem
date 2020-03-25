#!/bin/sh

echo "Moving the Deafult Config for TXAdmin"
mv /txadmin/data/* /panel/data/
rm -rf /txadmin

echo "Installing dependencies"
cd /panel
/usr/bin/npm i
/usr/bin/npm install --global bcrypt-cli

echo "Creating the Admin User"
#sed -i 's/username/new/g' /panel/data/admins.json #Change Username
#sed -i "s/test/$(bcrypt-cli password 5)/g" /panel/data/admins.json #Generate password and Replace it