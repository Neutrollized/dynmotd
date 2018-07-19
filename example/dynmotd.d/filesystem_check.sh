#file systems
ROOT_LV=$(df -Ph | grep "/$" | awk '{print $4,"-",$5}' | tr -d '\n')
OPT_LV=$(df -Ph | grep "/opt$" | awk '{print $4,"-",$5}' | tr -d '\n')
VARLOG_LV=$(df -Ph | grep "/var/log$" | awk '{print $4,"-",$5}' | tr -d '\n')

echo -e "===== FILESYSTEM ==============================================================
 $COLOR_COLUMN- /$RESET_COLORS................: $COLOR_VALUE ${ROOT_LV} (free-use%) $RESET_COLORS
 $COLOR_COLUMN- /opt$RESET_COLORS.............: $COLOR_VALUE ${VARLOGL_V} (free-use%) $RESET_COLORS
 $COLOR_COLUMN- /var/log$RESET_COLORS.........: $COLOR_VALUE ${VARLOGL_V} (free-use%) $RESET_COLORS"
