function flavours-theme-preview 
  set -l theme_filepath (flavours info $argv[1] | head -1 | cut -d '@' -f2 | string trim)
  set -l theme_colours (cat $theme_filepath | sed -nr 's/base[0-9A-Fa-f]{2}: "([0-9A-Fa-f]{6})".*/\1/p')

  for num in (seq 16)
    set -l colour (echo $theme_colours | awk "{print \$$num}")
    set_color $colour
    printf "██"
  end

  set_color white
end
