# In Bash scripting, 
# `$1`, `$2`, etc., are **positional parameters** (arguments) passed to a function or script.
# `;;` is the **branch terminator** in a Bash `case` statement.
#   - It tells Bash that the current branch (e.g., `on) ... ;;`) is complete, and to stop checking further branches for that match.
#   - Without `;;`, Bash would continue executing the next branch, which could cause errors.
#   - It's similar to `break` in other programming languages.
# `esac` is the closing keyword for a `case` statement in Bash (it's "case" spelled backward).
# `fi` is the closing keyword for a `if` statement (it's "if" spelled backward)
#
# it is harmless to execute `bluetoothctl connect <mac-address>` even if that device is already connected
bt() {

  on_command="bluetoothctl power on"

  case $1 in
    on)
      bluetoothctl power on
      ;;
    off)
      bluetoothctl power off
      ;;
    rock111)
      connect_command="bluetoothctl connect 41:42:37:A3:15:00"
      if [ "$2" = "headset" ]; then
        profile="headset-head-unit-msbc"
      else
        profile="a2dp-sink-sbc_xq"
      fi
      $on_command && $connect_command && pactl set-card-profile bluez_card.41_42_37_A3_15_00 $profile
      ;;
    nirvana)
      connect_command="bluetoothctl connect 90:A0:BE:49:9D:5C"
      if [ "$2" = "headset" ]; then
        profile="headset-head-unit-msbc"
      else
        profile="a2dp-sink-sbc_xq"
      fi
      $on_command && $connect_command && pactl set-card-profile bluez_card.90_A0_BE_49_9D_5C $profile
      ;;
    *)
      echo "Usage: bt {on | off | rock111 [headset] | nirvana [headset]}"
      echo "You cannot switch audio-profile during call, you need to disconnect-call -> switch profile -> reconnect-call"
      ;;
  esac
}

