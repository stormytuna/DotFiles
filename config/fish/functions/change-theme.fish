function change-theme
    # parse args
    argparse "w/wallpapers" "t/themes" "W/skipwallpaper" "T/skiptheme" -- $argv
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
        set -l chosen_wallpaper (eza --oneline ~/Pictures/Wallpapers | fzf) # TODO: Fix issue with this - ctrl+c out of the fzf causes a symlink to be made in current dir
        ln -sf ~/Pictures/Wallpapers/$chosen_wallpaper ~/.config/hypr/wallpaper.png
        refresh-wallpaper
    end

    # fzf theme if we're not skipping it
    if test -z "$_flag_skiptheme"
        set -l theme (flavours list --lines | fzf)
        flavours apply $theme.yml &> /dev/null
        or flavours apply $theme.yaml &> /dev/null
        or flavours apply $theme &> /dev/null
        or echo "Failed to apply Flavours theme!"
    end

    # refresh waybar
    killall waybar && waybar &> /dev/null & disown
end
