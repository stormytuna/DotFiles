function dotfiles-enable-module
  pushd (pwd)
  z ~/.dotfiles/modules/$argv[1]
  or return -1

  for file in (find * -type f)
    ln -f $file ~/.dotfiles/config/$file
  end

  popd
end
