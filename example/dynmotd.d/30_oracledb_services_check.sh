# NOTE: requires sudo
ORACLE_SVC_LISTENER=$(sudo service oracle-xe-21c status | grep 'LISTENER status:' | awk '{ for (i=3; i<=NF; i++) printf "%s%s", $i, (i==NF ? "" : OFS); print "" }')
ORACLE_SVC_DB=$(sudo service oracle-xe-21c status | grep 'Database status:' | awk '{ for (i=4; i<=NF; i++) printf "%s%s", $i, (i==NF ? "" : OFS); print "" }')

echo -e "===== ORACLE DB STATUS =======================================================
 $COLOR_COLUMN- Listener$RESET_COLORS...........: $COLOR_VALUE ${ORACLE_SVC_LISTENER}$RESET_COLORS
 $COLOR_COLUMN- Database$RESET_COLORS...........: $COLOR_VALUE ${ORACLE_SVC_DB}$RESET_COLORS"
