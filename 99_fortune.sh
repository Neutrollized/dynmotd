COLOR_COLUMN="\e[1m"

FORTUNE=$(fortune 2> /dev/null)

if [ -n "${FORTUNE}" ]
then
  echo -e "===== FORTUNE =================================================================
${FORTUNE_COLOR_VALUE}${FORTUNE}${RESET_COLORS}"
fi
