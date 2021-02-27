# https://docs.microsoft.com/en-us/azure/virtual-machines/linux/instance-metadata-service?tabs=linux
API_VERSION=2020-09-01

AZURE_RG=$(curl -s -H Metadata:true --noproxy "*" http://169.254.169.254/metadata/instance?api-version=${API_VERSION} | jq -r '.compute.resourceGroupName')
AZURE_VM_ID=$(curl -s -H Metadata:true --noproxy "*" http://169.254.169.254/metadata/instance?api-version=${API_VERSION} | jq -r '.compute.vmId')
AZURE_VM_SIZE=$(curl -s -H Metadata:true --noproxy "*" http://169.254.169.254/metadata/instance?api-version=${API_VERSION} | jq -r '.compute.vmSize')
AZURE_VM_ZONE=$(curl -s -H Metadata:true --noproxy "*" http://169.254.169.254/metadata/instance?api-version=${API_VERSION} | jq -r '.compute.zone')

echo -e "===== AZURE INSTANCE METADATA ================================================
 ${COLOR_COLUMN}- Resource Group${RESET_COLORS}.....: ${COLOR_VALUE} ${AZURE_RG} ${RESET_COLORS}
 ${COLOR_COLUMN}- VM ID${RESET_COLORS}..............: ${COLOR_VALUE} ${AZURE_VM_ID} ${RESET_COLORS}
 ${COLOR_COLUMN}- VM Size${RESET_COLORS}............: ${COLOR_VALUE} ${AZURE_VM_SIZE} ${RESET_COLORS}
 ${COLOR_COLUMN}- Zone${RESET_COLORS}...............: ${COLOR_VALUE} ${AZURE_VM_ZONE} ${RESET_COLORS}"
