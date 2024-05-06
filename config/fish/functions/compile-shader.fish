function compile-shader
  for file in $argv
    set -l file_extension (path extension $file)
    if test $file_extension != ".fx"
      continue
    end

    set -l file_name (basename $file .fx)
    if wine ~/Code/Shaders/HlslCompiler/fxc.exe /T fx_2_0 $file_name.fx /Fo $file_name.fxc &> /tmp/hlsl-compiler-log.log
      echo "Compiled '$file_name!'"
    else
      echo "Error compiling '$file_name'"
      cat /tmp/hlsl-compiler-log.log
    end
  end
end
