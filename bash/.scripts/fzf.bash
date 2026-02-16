ff() {
    local custom_dirs=(~/dotfiles ~/Documents) 
    local dirs=$(
        (find ~/company ~/personal ~/sync -maxdepth 1 -type d; 
         printf '%s\n' "${custom_dirs[@]}") | 
        fzf
    )
    
    if [ -n "$dirs" ]; then
        cd "$dirs" && clear
    fi
}


