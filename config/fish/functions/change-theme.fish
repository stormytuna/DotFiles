function change-theme
  # parse args
  argparse "w/wallpapers" "t/themes" "W/skipwallpaper" "T/skiptheme" "f/favourites" -- $argv
  or return

  # print valid wallpapers
  if set -ql _flag_wallpapers
    echo "Available wallpapers:"
    eza --oneline ~/Pictures/Wallpapers
    return 0
  end

  # print valid colour schemes
  if set -ql _flag_themes
    echo "Available themes:"
    flavours list --lines
    return 0
  end

  # fzf wallpaper if we're not skipping it
  if test -z "$_flag_skipwallpaper"
    set -l chosen_wallpaper (eza --oneline --absolute ~/Pictures/Wallpapers | ffzf --preview "kitten icat --clear --transfer-mode=memory --stdin=no --place={\$FZF_PREVIEW_COLUMNS}x{\$FZF_PREVIEW_LINES}@20x1 {}" )
    ln -sf $chosen_wallpaper ~/.config/hypr/wallpaper.png
    refresh-wallpaper
  end

  # fzf theme if we're not skipping it
  if test -z "$_flag_skiptheme"
    # pick from our favourites if we chose that flag
    set -l flavours_list (flavours list --lines)
    if set -ql _flag_favourites
      set flavours_list (cat ~/.dotfiles/theming/favourite-themes)
    end

    set -l theme (string split "\n" $flavours_list | ffzf --preview "flavours-theme-preview {}" --preview-window down --preview-window 5 )
    flavours apply $theme.yml &> /dev/null
    or flavours apply $theme.yaml &> /dev/null
    or flavours apply $theme &> /dev/null
    or echo "Failed to apply Flavours theme!"
  end
end
