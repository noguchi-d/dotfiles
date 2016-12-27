# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions

alias g='git'
alias ll='ls -l'
alias la='ls -la'

alias dstat-full='dstat -Tclmdrn'
alias dstat-mem='dstat -Tclm'
alias dstat-cpu='dstat -Tclr'
alias dstat-net='dstat -Tclnd'
alias dstat-disk='dstat -Tcldr'

hg_branch() {
  hg branch 2> /dev/null | awk '{print " (hg:" $1 ")"}'
}

# add されていない変更の存在を「＊」で示す
# commit されていない変更の存在を「＋」で示す
GIT_PS1_SHOWDIRTYSTATE=true

# add されていない新規ファイルの存在を「％」で示す
GIT_PS1_SHOWUNTRACKEDFILES=true

# stash がある場合は「＄」で示す
#GIT_PS1_SHOWSTASHSTATE=true

# upstream と同期している場合は「＝」で示す
# upstream より進んでいる場合は「＞」で示す
# upstream より遅れている場合は「＜」で示す
GIT_PS1_SHOWUPSTREAM=auto

if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

git_branch() {
  __git_ps1 ' (git:%s)'
}

# .git-completion.bash は git のブランチ名の補完などを行なってくれる。
# ファイルは /usr/share/doc/git-VERSION/cntrib/completion/ あるいは、ソースをダウンロードしてきて、 cntrib/completion/ にあるはず。
# 以下では、現在のブランチ名が表示されるようにしている。ついでに、色を変えたり、時間を表示させたりもしている。
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
  if [ -r "$HOME/.git-completion.bash" ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w$(git_branch)$(hg_branch) \n\[\033[00m\]$(date "+%Y/%m/%d %T") \$ '
  else
    PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w \n\[\033[00m\]$(date "+%Y/%m/%d %T")\$ '
  fi
fi

if [ -f ~/.git-flow-completion.sh ]; then
  source ~/.git-flow-completion.sh
fi

