if command -sq peek
    peek init fish | source
else
    echo 'peek: command not found, please install it from https://github.com/execRooted/peek'
end
