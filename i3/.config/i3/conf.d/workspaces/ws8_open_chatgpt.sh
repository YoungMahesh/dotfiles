# in first setup use - `chmod +x <file-name>`
# switch/open workspace 8
i3-msg "workspace number 8"

if ! i3-msg '[class="Google-chrome" workspace="8"] focus' 2>/dev/null; then
    google-chrome --new-window --profile-directory="Default" "https://chatgpt.com"
fi
