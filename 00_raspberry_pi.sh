# the "tr" command is to suppress the "warning: command substitution: ignored null byte in input" errors
# https://askubuntu.com/questions/926626/how-do-i-fix-warning-command-substitution-ignored-null-byte-in-input
PI_REVISION=$(cat /proc/device-tree/model | tr '\0' '\n')
PI_TEMP=$(vcgencmd measure_temp | awk -F'=' '{ print $2 }')

echo -e "===== PI INFO ================================================================
 ${COLOR_COLUMN}- Revision${RESET_COLORS}...........: ${COLOR_VALUE} ${PI_REVISION} ${RESET_COLORS}
 ${COLOR_COLUMN}- Temperature${RESET_COLORS}........: ${COLOR_VALUE} ${PI_TEMP} ${RESET_COLORS}"
