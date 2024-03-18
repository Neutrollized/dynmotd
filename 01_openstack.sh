# https://docs.openstack.org/nova/latest/user/metadata.html
OS_INSTANCE_EXTERNAL_IP=$(curl --fail -s http://169.254.169.254/latest/meta-data/public-ipv4)
OS_INSTANCE_EXTERNAL_IP=${OS_INSTANCE_EXTERNAL_IP:-'None'}

OS_INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
OS_INSTANCE_TYPE=$(curl -s http://169.254.169.254/latest/meta-data/instance-type)
OS_INSTANCE_ZONE=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)

echo -e "===== INSTANCE METADATA ======================================================
 ${COLOR_COLUMN}- External IP${RESET_COLORS}........: ${COLOR_VALUE} ${OS_INSTANCE_EXTERNAL_IP} ${RESET_COLORS}
 ${COLOR_COLUMN}- Instance ID${RESET_COLORS}........: ${COLOR_VALUE} ${OS_INSTANCE_ID} ${RESET_COLORS}
 ${COLOR_COLUMN}- Instance Type${RESET_COLORS}......: ${COLOR_VALUE} ${OS_INSTANCE_TYPE} ${RESET_COLORS}
 ${COLOR_COLUMN}- Zone${RESET_COLORS}...............: ${COLOR_VALUE} ${OS_INSTANCE_ZONE} ${RESET_COLORS}"
