if command -sq hview
    hview init fish | source
else
    echo 'hview: command not found, please install it from https://github.com/execRooted/hview'
end