#!/bin/sh

echo "Set permissions for fivem user"
usermod -u ${UID} ${USER}
usermod -g ${GID} ${USER}

# See if resources folder exists
if [ "$(ls -A /fivem/resources/)" ]; then
    echo "Resources folder already there"
else
    mv /fivem/server-data/* /fivem/resources/
    rm /fivem/server-data/
fi

# Start the Server
chown -R ${UID}:${GID} /fivem
su fivem -c "/bin/sh /fivem/server/run.sh"