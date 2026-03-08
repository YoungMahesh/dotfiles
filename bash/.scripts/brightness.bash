set_brightness() {
  # xrandr cannot report the current brightness. It only sets brightness (multiplicative gamma factor). 
  # So the only way to know the current value is to store it yourself when you change it.
  local state_file="$HOME/.brightness_level"

  # If no argument -> show current brightness
  # -z = check if string exists, true if string is empty; here $1 - first argument;
  if [ -z "$1" ]; then
    # -f = check if file exists
    if [ -f "$state_file" ]; then
      cat "$state_file"
    else
      echo "Brightness not set yet"
    fi
    return 0
  fi


  local level=$1

  # regex-verificaiton to check that number characters are provided, as argument instead of alphabet or other characters
  if ! [[ "$level" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Invalid brightness level. Please use a number between 1 and 10." >&2
    return 1
  fi

  # range check (1 to 10)
  if (( $(echo "$level < 1 || $level > 10" | bc -l) )); then
    echo "Error: Brightness level must be between 1 and 10." >&2
    return 1
  fi

  # convert to xrandr brightness
  # divide level by 10 using `bc`(a command-line calculator) to get a decimal value
  # scale=2 insures that result has 2 decimal places
  local brightness=$(echo "scale=2; $level / 10" | bc)
  
  # set brightness using xrandr
  # to get HDMI device name, execute `xrandr`
  xrandr --output HDMI-A-0 --brightness "$brightness"

  # store level
  echo "$level" > "$state_file"
}

# Make the function available directly using an alias
alias br="set_brightness"

