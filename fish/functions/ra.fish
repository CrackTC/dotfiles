# Defined in - @ line 1
function ra --wraps=ranger --description 'alias ra ranger'
    if test $RANGER_LEVEL
        exit
    else
        ranger $argv;
    end
end
