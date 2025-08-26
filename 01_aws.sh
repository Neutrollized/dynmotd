# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html
METADATA_TOKEN=$(curl -s --request PUT "http://169.254.169.254/latest/api/token" --header "X-aws-ec2-metadata-token-ttl-seconds: 30")

AWS_EC2_EXTERNAL_IP=$(curl --fail -s http://169.254.169.254/latest/meta-data/public-ipv4 --header "X-aws-ec2-metadata-token: ${METADATA_TOKEN}")
AWS_EC2_EXTERNAL_IP=${AWS_EC2_EXTERNAL_IP:-'None'}

AWS_EC2_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id --header "X-aws-ec2-metadata-token: ${METADATA_TOKEN}")
AWS_EC2_TYPE=$(curl -s http://169.254.169.254/latest/meta-data/instance-type --header "X-aws-ec2-metadata-token: ${METADATA_TOKEN}")
AWS_EC2_ZONE=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone --header "X-aws-ec2-metadata-token: ${METADATA_TOKEN}")

echo -e "===== AWS INSTANCE METADATA ===================================================
 ${COLOR_COLUMN}- External IP${RESET_COLORS}........: ${COLOR_VALUE} ${AWS_EC2_EXTERNAL_IP} ${RESET_COLORS}
 ${COLOR_COLUMN}- Instance ID${RESET_COLORS}........: ${COLOR_VALUE} ${AWS_EC2_ID} ${RESET_COLORS}
 ${COLOR_COLUMN}- Instance Type${RESET_COLORS}......: ${COLOR_VALUE} ${AWS_EC2_TYPE} ${RESET_COLORS}
 ${COLOR_COLUMN}- Zone${RESET_COLORS}...............: ${COLOR_VALUE} ${AWS_EC2_ZONE} ${RESET_COLORS}"
