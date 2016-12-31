#!/bin/bash

DOT_DIRECTORY=~/dotfiles

cd ${DOT_DIRECTORY}

# symlink list
file_list=`find ${DOT_DIRECTORY} -maxdepth 2 -type f`

for f in $file_list
do
  if `echo dirname ${f}` | grep -q 'dotfiles/.git'; then
    continue
  fi
  [[ `basename ${f}` = 'README.md' ]] && continue
  [[ `basename ${f}` = $0 ]] && continue

  f_name=`basename ${f}`
  ln -snfv ${f} ${HOME}/${f_name}
done
echo "$(tput setaf 2)Deploy dotfiles complete !"

