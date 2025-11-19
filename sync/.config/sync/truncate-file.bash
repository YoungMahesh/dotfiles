# $1 = first-argument provided to this bash script
LOG_FILE="$1"
# if log-file line count >1000 then keep only last 500 lines
LINE_COUNT=$(wc -l < "$LOG_FILE")
if [ "$LINE_COUNT" -gt 1000 ]; then
  TEMP_FILE=$(mktemp)
  tail -n 500 "$LOG_FILE" > "$TEMP_FILE"
  # by using `mv` we are copying temp_file to log_file and deleting temp_file
  mv "$TEMP_FILE" "$LOG_FILE"
fi
