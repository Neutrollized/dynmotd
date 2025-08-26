# with services, the command can be very simple or a bit more complicated depending on how much information you want to get out of it
# the output of the command below would be something like:
# active (running) since Fri 2018-08-03 09:37:39 CDT
# where as the others would just simply say 'active'
# DOCKER_SVC=$(systemctl status docker | grep 'Active:' | awk -F': ' '{$1=""; print $0}' | awk -F';' '{print $1}' | xargs)

DOCKER_SVC=$(systemctl status docker | grep 'Active:' | awk '{ print $2 }')
JENKINS_SVC=$(systemctl status jenkins | grep 'Active:' | awk '{ print $2 }')
RUNDECKD_SVC=$(systemctl status rundeckd | grep 'Active:' | awk '{ print $2 }')
SUPERVISORD_SVC=$(systemctl status supervisord | grep 'Active:' | awk '{ print $2 }')

echo -e "===== SERVICES ================================================================
 $COLOR_COLUMN- docker$RESET_COLORS.............: $COLOR_VALUE ${DOCKER_SVC}$RESET_COLORS
 $COLOR_COLUMN- jenkins$RESET_COLORS............: $COLOR_VALUE ${JENKINS_SVC}$RESET_COLORS
 $COLOR_COLUMN- rundeckd$RESET_COLORS...........: $COLOR_VALUE ${RUNDECKD_SVC}$RESET_COLORS
 $COLOR_COLUMN- supervisord$RESET_COLORS........: $COLOR_VALUE ${SUPERVISORD_SVC}$RESET_COLORS"
