#! /bin/bash
set +x

DYNMOTD_BIN_PATH='/usr/local/bin'
DYNMOTD_CUSTOM_SCRIPTS_PATH='/etc/dynmotd.d'


cp ./dynmotd ${DYNMOTD_BIN_PATH}/dynmotd
chmod 755 ${DYNMOTD_BIN_PATH}/dynmotd

echo "${DYNMOTD_BIN_PATH}/dynmotd" > /etc/profile.d/dynmotd.sh
chmod 644 /etc/profile.d/dynmotd.sh

mkdir -p ${DYNMOTD_CUSTOM_SCRIPTS_PATH}


dynmotd
