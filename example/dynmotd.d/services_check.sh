AUTOFS_SVC=$(systemctl status autofs | grep "Active:" | awk '{ print $2 }')
DOCKER_SVC=$(systemctl status docker | grep "Active:" | awk '{ print $2 }')
JENKINS_SVC=$(systemctl status jenkins | grep "Active:" | awk '{ print $2 }')
RUNDECKD_SVC=$(systemctl status rundeckd | grep "Active:" | awk '{ print $2 }')
SUPERVISORD_SVC=$(systemctl status supervisord | grep "Active:" | awk '{ print $2 }')

echo -e "===== SERVICES ================================================================
 $COLOR_COLUMN- autofs$RESET_COLORS...........: $COLOR_VALUE ${AUTOFS_SVC}$RESET_COLORS
 $COLOR_COLUMN- docker$RESET_COLORS...........: $COLOR_VALUE ${DOCKER_SVC}$RESET_COLORS
 $COLOR_COLUMN- jenkins$RESET_COLORS..........: $COLOR_VALUE ${JENKINS_SVC}$RESET_COLORS
 $COLOR_COLUMN- rundeckd$RESET_COLORS.........: $COLOR_VALUE ${RUNDECKD_SVC}$RESET_COLORS
 $COLOR_COLUMN- supervisord$RESET_COLORS......: $COLOR_VALUE ${SUPERVISORD_SVC}$RESET_COLORS"
