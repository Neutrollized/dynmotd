# the "tr" command is to suppress the "warning: command substitution: ignored null byte in input" errors
# https://askubuntu.com/questions/926626/how-do-i-fix-warning-command-substitution-ignored-null-byte-in-input

# https://github.com/microsoft/WSL/issues/9719
if [ `whoami` == 'root' ]
then
  WSL_DISTRO_NAME='not available as root user'
fi

echo -e "===== WSL INFO ===============================================================
 ${COLOR_COLUMN}- WSL distro name${RESET_COLORS}....: ${COLOR_VALUE} ${WSL_DISTRO_NAME} ${RESET_COLORS}"
