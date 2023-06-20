function miniconda
    if test -f /opt/miniconda/bin/conda
        eval /opt/miniconda/bin/conda "shell.fish" "hook" $argv | source
    end
end
