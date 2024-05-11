if status is-interactive
  set fish_prompt_pwd_dir_length 80
  set fish_greeting # disables greeting
  zoxide init fish | source
  thefuck --alias | source
  starship init fish | source

  starship preset pastel-powerline -o ~/.config/starship.toml

  alias ffzf "fzf --keep-right --margin 3% --no-scrollbar --preview 'head -$LINES {}' --preview-window up"
  alias fvc "fd --type f --hidden -E .git -E obj -E bin -E Decompiled -E OpenSource . ~/Code ~/Code/tModLoader | ffzf | xargs nvim"
  alias qvh "nvim ~/.config/hypr/hyprland.conf"
  alias qvf "nvim ~/.config/fish/config.fish"
  alias dfi "~/.dotfiles/install"
  alias rfw "swww img ~/.config/hypr/wallpaper.png"

  alias cat "bat"
  alias nano "micro"
  alias cl "clear; neofetch"
  alias la "eza --long --all --icons"
  alias ll "eza --long --icons"
  alias ls "eza"
  alias zz "z -"

  alias trim "awk '{\$1=\$1};1'"

  if test (tty) = "/dev/tty1"
    Hyprland
  end

  neofetch
end

