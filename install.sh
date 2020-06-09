#! /bin/bash
set +x

DYNMOTD_BIN_PATH='/usr/local/bin'
DYNMOTD_CUSTOM_SCRIPTS_PATH='/etc/dynmotd.d'


cp ./dynmotd ${DYNMOTD_BIN_PATH}/dynmotd
chmod 755 ${DYNMOTD_BIN_PATH}/dynmotd
ln -s ${DYNMOTD_BIN_PATH}/dynmotd ${DYNMOTD_BIN_PATH}/dm

echo "${DYNMOTD_BIN_PATH}/dynmotd" > /etc/profile.d/dynmotd.sh
chmod 644 /etc/profile.d/dynmotd.sh

mkdir -p ${DYNMOTD_CUSTOM_SCRIPTS_PATH}


cat /etc/os-release | grep -q 'Raspbian'
if [ $? -eq 0 ]
then
  # if you want to disable it afterwards, just rename the file so that id doesn't have an .sh extension (i.e .sh_disabled)
  cp ./00_raspberry_pi.sh ${DYNMOTD_CUSTOM_SCRIPTS_PATH}/.
fi

dynmotd
