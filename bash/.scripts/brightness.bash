set_brightness() {
  local level=$1

  # regex-verificaiton to check that number characters are provided, as argument instead of alphabet or other characters
  if ! [[ "$level" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Invalid brightness level. Please use a number between 1 and 10." >&2
    return 1
  fi

  # number be between 1 to 10
  if (( $(echo "$level < 1 || $level > 10" | bc -l) )); then
    echo "Error: Brightness level must be between 1 and 10." >&2
    return 1
  fi

  # divide level by 10 using `bc`(a command-line calculator) to get a decimal value
  # scale=2 insures that result has 2 decimal places
  local brightness=$(echo "scale=2; $level / 10" | bc)
  
  # set brightness using xrandr
  # to get HDMI device name, execute `xrandr`
  xrandr --output HDMI-A-0 --brightness "$brightness"
}

# Make the function available directly using an alias
alias br="set_brightness"

