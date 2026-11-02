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

  # regex-verification, ✅ Allow ONLY:
  # - exactly 2 digits (10–99)
  # - OR exactly 100
  if ! [[ "$level" =~ ^([1-9][0-9]|100)$ ]]; then
    echo "Error: Use a number between 10 and 100 (e.g., 57)." >&2
    return 1
  fi

  # convert to xrandr brightness
  # divide level by 100 using `bc`(a command-line calculator) to get a decimal value
  # scale=2 insures that result has 2 decimal places
  # Convert percentage → xrandr value (0.10–1.00)
  local brightness=$(echo "scale=2; $level / 100" | bc)

  # Apply brightness
  # to get HDMI device name, execute `xrandr`
  xrandr --output HDMI-A-0 --brightness "$brightness"

  # store level
  echo "$level" > "$state_file"
}

# Make the function available directly using an alias
alias br="set_brightness"

