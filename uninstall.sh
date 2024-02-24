#! /bin/bash
set +x

echo '+ starting uninstall'
DYNMOTD_BIN_PATH='/usr/local/bin'
DYNMOTD_CUSTOM_SCRIPTS_PATH='/etc/dynmotd.d'


echo ' + uninstalling dynmotd'
rm /etc/profile.d/dynmotd.sh
rm -Rf ${DYNMOTD_CUSTOM_SCRIPTS_PATH}
rm ${DYNMOTD_BIN_PATH}/dm 
rm ${DYNMOTD_BIN_PATH}/dynmotd

echo '+ uninstall complete!'
