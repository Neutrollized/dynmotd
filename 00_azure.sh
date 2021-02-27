# https://docs.microsoft.com/en-us/azure/virtual-machines/linux/instance-metadata-service?tabs=linux
AZURE_RG=$(curl -s -H Metadata:true --noproxy "*" http://169.254.169.254/metadata/)
AZURE_VM_ID=$(curl -s -H Metadata:true --noproxy "*" http://169.254.169.254/metadata/)
AZURE_VM_SIZE=$(curl -s -H Metadata:true --noproxy "*" http://169.254.169.254/metadata/)
AZURE_VM_ZONE=$(curl -s -H Metadata:true --noproxy "*" http://169.254.169.254/metadata/)

echo -e "===== AZURE INSTANCE METADATA ================================================
 ${COLOR_COLUMN}- Resource Group${RESET_COLORS}.....: ${COLOR_VALUE} ${AZURE_RG} ${RESET_COLORS}
 ${COLOR_COLUMN}- VM ID${RESET_COLORS}..............: ${COLOR_VALUE} ${AZURE_VM_ID} ${RESET_COLORS}
 ${COLOR_COLUMN}- VM Size${RESET_COLORS}............: ${COLOR_VALUE} ${AZURE_VM_SIZE} ${RESET_COLORS}
 ${COLOR_COLUMN}- Zone${RESET_COLORS}...............: ${COLOR_VALUE} ${AZURE_VM_ZONE} ${RESET_COLORS}"
