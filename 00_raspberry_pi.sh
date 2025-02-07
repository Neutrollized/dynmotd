# the "tr" command is to suppress the "warning: command substitution: ignored null byte in input" errors
# https://askubuntu.com/questions/926626/how-do-i-fix-warning-command-substitution-ignored-null-byte-in-input
PI_REVISION=$(cat /proc/device-tree/model | tr '\0' '\n')
PI_BOOTLOADER=$(vcgencmd bootloader_version | awk 'NR==1 {printf "%s ", $0} NR==3 {printf "(%s)", $2}')
PI_GPU_MEM=$(vcgencmd get_mem gpu | awk -F'=' '{ print $2 }')
PI_TEMP=$(vcgencmd measure_temp | awk -F'=' '{ print $2 }')

echo -e "===== PI INFO ================================================================
 ${COLOR_COLUMN}- Revision${RESET_COLORS}...........: ${COLOR_VALUE} ${PI_REVISION} ${RESET_COLORS}
 ${COLOR_COLUMN}- Bootloader${RESET_COLORS}.........: ${COLOR_VALUE} ${PI_BOOTLOADER} ${RESET_COLORS}
 ${COLOR_COLUMN}- GPU memory${RESET_COLORS}.........: ${COLOR_VALUE} ${PI_GPU_MEM} ${RESET_COLORS}
 ${COLOR_COLUMN}- Temperature${RESET_COLORS}........: ${COLOR_VALUE} ${PI_TEMP} ${RESET_COLORS}"
