# the "tr" command is to suppress the "warning: command substitution: ignored null byte in input" errors
# https://askubuntu.com/questions/926626/how-do-i-fix-warning-command-substitution-ignored-null-byte-in-input
TUNED_PROFILE=$(tuned-adm active | awk -F': ' '{ print $2 }')

echo -e "===== RHEL/OL INFO ===========================================================
 ${COLOR_COLUMN}- Tuned profile${RESET_COLORS}......: ${COLOR_VALUE} ${TUNED_PROFILE} ${RESET_COLORS}"
