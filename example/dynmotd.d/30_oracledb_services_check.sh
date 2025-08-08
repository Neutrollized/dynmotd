# NOTE: requires sudo
ORACLE_SVC_LISTENER=$(sudo service oracle-xe-21c status | grep 'LISTENER status:' | awk '{ print $3 }')
ORACLE_SVC_DB=$(sudo service oracle-xe-21c status | grep 'Database status:' | awk '{ print $4 }')

echo -e "===== ORACLE DB STATUS =======================================================
 $COLOR_COLUMN- Listener$RESET_COLORS...........: $COLOR_VALUE ${ORACLE_SVC_LISTENER}$RESET_COLORS
 $COLOR_COLUMN- Database$RESET_COLORS...........: $COLOR_VALUE ${ORACLE_SVC_DB}$RESET_COLORS"
