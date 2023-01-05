# Defined in - @ line 1
function pacman --wraps=pacman --description 'alias pacman yay'
  yay $argv;
end
