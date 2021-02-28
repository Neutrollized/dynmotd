# https://docs.microsoft.com/en-us/azure/virtual-machines/linux/instance-metadata-service?tabs=linux
# https://github.com/cloudbooster/Azure-Instance-Metadata/blob/master/Instance-Metadata.md#tracking-vm-running-on-azure
# you need the "\&format=text" at the end or you'll get an error as the default return format is JSON
API_VERSION=2020-09-01

AZURE_RG=$(curl -s -H Metadata:true --noproxy "*" http://169.254.169.254/metadata/instance/compute/resourceGroupName?api-version=${API_VERSION}\&format=text)
AZURE_VM_ID=$(curl -s -H Metadata:true --noproxy "*" http://169.254.169.254/metadata/instance/compute/vmId?api-version=${API_VERSION}\&format=text)
AZURE_VM_SIZE=$(curl -s -H Metadata:true --noproxy "*" http://169.254.169.254/metadata/instance/compute/vmSize?api-version=${API_VERSION}\&format=text)
AZURE_VM_LOCATION=$(curl -s -H Metadata:true --noproxy "*" http://169.254.169.254/metadata/instance/compute/location?api-version=${API_VERSION}\&format=text)

echo -e "===== AZURE INSTANCE METADATA ================================================
 ${COLOR_COLUMN}- Resource Group${RESET_COLORS}.....: ${COLOR_VALUE} ${AZURE_RG} ${RESET_COLORS}
 ${COLOR_COLUMN}- VM ID${RESET_COLORS}..............: ${COLOR_VALUE} ${AZURE_VM_ID} ${RESET_COLORS}
 ${COLOR_COLUMN}- VM Size${RESET_COLORS}............: ${COLOR_VALUE} ${AZURE_VM_SIZE} ${RESET_COLORS}
 ${COLOR_COLUMN}- Location${RESET_COLORS}...........: ${COLOR_VALUE} ${AZURE_VM_LOCATION} ${RESET_COLORS}"
