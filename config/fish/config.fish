if status is-interactive
    set fish_prompt_pwd_dir_length 80
    set fish_greeting # disables greeting
    zoxide init fish | source
    thefuck --alias | source
    neofetch
end
