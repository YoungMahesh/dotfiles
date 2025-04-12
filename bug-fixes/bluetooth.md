- can't turn on bluetooth on ubuntu 24.04 GNOME

  ```bash
  # rmmod == remove module from linux kernel
  sudo rmmod btusb

  # modprobe == add module to the linux kernel
  sudo modprobe btusb
  ```

- i3wm does not support gnome bluetooth
  ```bash
  # install blueman which is GUI app for bluetooth management on ubuntu
  sudo apt install blueman

  # launch blueman
  blueman-manager
  ```

- error (for itel feature phone while file transfer): One headset is already activated, please deactivate it first, to activate another
  - solution: on itel feature phone, open Extra -> BT (bluetooth) -> Paired device -> hover on connected device
    -> click center button to disconnect (this is will disconnect voice transport and enable file transfer)
