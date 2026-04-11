# the "tr" command is to suppress the "warning: command substitution: ignored null byte in input" errors
# https://askubuntu.com/questions/926626/how-do-i-fix-warning-command-substitution-ignored-null-byte-in-input
#
# DGX_SWBUILD_VERSION indicates the base version that was installed from ISO image
# DGX_OTA_VERSION indicates the latest version after over-the-air (OTA) updates

DGX_VERSION=$(cat /etc/dgx-release | grep DGX_OTA_VERSION | awk -F'=' '{ print $2 }' | tr -d '"')
DGX_GPU=$(nvidia-smi --query-gpu=name --format=noheader)
DGX_SERIAL_NUMBER=$(cat /etc/dgx-release | grep DGX_SERIAL_NUMBER | awk -F'=' '{ print $2 }' | tr -d '"')

echo -e "===== DGX SPARK INFO ==========================================================
 ${COLOR_COLUMN}- Version${RESET_COLORS}............: ${COLOR_VALUE} ${DGX_VERSION} ${RESET_COLORS}
 ${COLOR_COLUMN}- GPU${RESET_COLORS}................: ${COLOR_VALUE} ${DGX_GPU} ${RESET_COLORS}
 ${COLOR_COLUMN}- Serial Number${RESET_COLORS}......: ${COLOR_VALUE} ${DGX_SERIAL_NUMBER} ${RESET_COLORS}"
