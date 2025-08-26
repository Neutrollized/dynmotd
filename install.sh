#! /bin/bash
set +x

echo '+ starting install'
DYNMOTD_BIN_PATH='/usr/local/bin'
DYNMOTD_CUSTOM_SCRIPTS_PATH='/etc/dynmotd.d'


echo ' + installing dynmotd'
cp ./dynmotd ${DYNMOTD_BIN_PATH}/dynmotd
chmod 755 ${DYNMOTD_BIN_PATH}/dynmotd
ln -s ${DYNMOTD_BIN_PATH}/dynmotd ${DYNMOTD_BIN_PATH}/dm 2>/dev/null

echo '  + setting up MOTD'
echo "${DYNMOTD_BIN_PATH}/dynmotd" > /etc/profile.d/dynmotd.sh
chmod 644 /etc/profile.d/dynmotd.sh

echo '  + creating custom scripts folder'
mkdir -p ${DYNMOTD_CUSTOM_SCRIPTS_PATH}
rm ${DYNMOTD_CUSTOM_SCRIPTS_PATH}/00_*.sh 2>/dev/null


echo ' + detecting additional OS info'
# always do this -- the logic of whether it will run resides in 00_wsl.sh
cp ./00_wsl.sh ${DYNMOTD_CUSTOM_SCRIPTS_PATH}/.
# check to see if it's a Raspberry Pi
cat /etc/os-release | grep -q 'Raspbian'
if [ $? -eq 0 ] || [ -f '/etc/rpi-issue' ]
then
  # if you want to disable it afterwards, just rename the file so that id doesn't have an .sh extension (i.e .sh_disabled)
  cp ./00_raspberry_pi.sh ${DYNMOTD_CUSTOM_SCRIPTS_PATH}/.
elif [ -f '/etc/redhat-release' ] && [ `which tuned-adm` ]
then 
  cp ./00_rhel.sh ${DYNMOTD_CUSTOM_SCRIPTS_PATH}/.
fi

echo '  + checking for cloud provider status'
# check to see if VM belongs to one of the big 3 CSPs
# done via checking against https://ipinfo.io/, getting the org and cutting out the asn
# then checking to see if the metadata server/internal address responds
IPINFO_ORG=$(curl -s ipinfo.io/org | awk {'first = $1; $1=""; print $0'}|sed 's/^ //g')

if [[ 'Google LLC' = "${IPINFO_ORG}" && $(curl --max-time 1 --write-out %{http_code} -s --output /dev/null 169.254.169.254) == '200' ]]
then
  cp ./01_gcp.sh ${DYNMOTD_CUSTOM_SCRIPTS_PATH}/.
elif [[ 'Amazon.com, Inc.' = "${IPINFO_ORG}" && $(curl --max-time 1 --write-out %{http_code} -s --output /dev/null 169.254.169.254 --header "X-aws-ec2-metadata-token: $(curl -s --request PUT "http://169.254.169.254/latest/api/token" --header "X-aws-ec2-metadata-token-ttl-seconds: 30")") == '200' ]]
then
  cp ./01_aws.sh ${DYNMOTD_CUSTOM_SCRIPTS_PATH}/.
elif [[ 'Microsoft Corporation' = "${IPINFO_ORG}" && $(curl --max-time 1 --write-out %{http_code} -s --output /dev/null 169.254.169.254) == '400' ]]
then
  cp ./01_azure.sh ${DYNMOTD_CUSTOM_SCRIPTS_PATH}/.
fi


echo ' + checking for fortune binary'
if [ -x $(which fortune) ]
then
  cp ./99_fortune.sh ${DYNMOTD_CUSTOM_SCRIPTS_PATH}/.
fi


echo '+ install complete!'
${DYNMOTD_BIN_PATH}/dynmotd
