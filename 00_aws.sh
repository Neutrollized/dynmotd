# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html
AWS_INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
AWS_INSTANCE_TYPE=$(curl -s http://169.254.169.254/latest/meta-data/instance-type)
AWS_INSTANCE_ZONE=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)

echo -e "===== AWS INSTANCE METADATA ==================================================
 ${COLOR_COLUMN}- Instance ID${RESET_COLORS}........: ${COLOR_VALUE} ${AWS_INSTANCE_ID} ${RESET_COLORS}
 ${COLOR_COLUMN}- Instance Type${RESET_COLORS}......: ${COLOR_VALUE} ${AWS_INSTANCE_TYPE} ${RESET_COLORS}
 ${COLOR_COLUMN}- Zone${RESET_COLORS}...............: ${COLOR_VALUE} ${AWS_INSTANCE_ZONE} ${RESET_COLORS}"
