#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# autoload -U colors
#colors

########
########
########
#------------------------------------------------------------------------------------------#
# environment variables                                                                    #
#------------------------------------------------------------------------------------------#
export LANG=ja_JP.UTF-8
export PATH=~/bin:/usr/local/bin:$PATH:/sbin:/usr/sbin:/usr/local/mysql/bin:/Applications/android-sdk-mac_x86/tools
export PERL5LIB=/usr/share/perl5:$PERL5LIB

export SVN_EDITOR="vi"

# export FTP_PASSIVE=1
# export SVN_EDITOR=vi
# export PAGER=jless
# export PAGER="lv -c"

## enviroment variables for zsh
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000

#------------------------------------------------------------------------------------------#
# aliases                                                                                  #
#------------------------------------------------------------------------------------------#
#alias ls='ls --color=auto'
#alias ll='ls -l'
alias grep='grep --color'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias scdr='screen -dr'
alias gst='git status'
alias gd='git diff --color'
alias gcb='git checkout -b'
alias gdc='git diff --color --cached'
alias gb='git branch'
alias ga='git add'
alias gc='git commit'
alias gba='git branch -a'
alias gl='git log --color'
alias g='git '
alias glg='git log --graph --color'
alias gls='git log --stat --color'
alias glp='git log -p --color'
alias push='git push'
alias gpuo='git push -u origin '
alias pull='git pull'
alias vi='vim'
alias batch='cd ~/htdocs/batch/'
alias cdh='cd ~/htdocs/'
alias cdsf='cd ~/htdocs/symfony'
alias cdec='cd ~/htdocs/symfony/src/Raksul/EcBundle/'
alias cdservice='cd ~/htdocs/symfony/src/Raksul/EcBundle/Service'
alias cdadminservice='cd ~/htdocs/symfony/src/Raksul/EcAdminBundle/Service'
alias cdap='cd ~/htdocs/class/CodeIgniter/application'
alias apc='php ~/htdocs/symfony/app/console'
alias screen='screen -U'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
alias ws1='sudo -u raksul ssh 10.1.3.167'
alias ws2='sudo -u raksul ssh 10.1.3.176'
alias ws3='sudo -u raksul ssh 10.1.1.100'
alias ws4='sudo -u raksul ssh 10.1.0.147'
alias ws10='sudo -u raksul ssh 10.1.3.167'
alias ws11='sudo -u raksul ssh 10.1.1.101'
alias ws12='sudo -u raksul ssh 10.1.0.124'
alias ws13='sudo -u raksul ssh 10.1.3.0'
alias db1='sudo -u raksul ssh 10.1.1.166'
alias db2='sudo -u raksul ssh 10.1.1.50'
#------------------------------------------------------------------------------------------#
# bindkeys                                                                                 #
#------------------------------------------------------------------------------------------#
bindkey -e
bindkey '\C-u' undo

#------------------------------------------------------------------------------------------#
# zsh configuration                                                                        #
#------------------------------------------------------------------------------------------#
unsetopt promptcr
setopt prompt_subst
setopt notify
setopt nobeep
setopt rec_exact
setopt long_list_jobs
setopt list_types
setopt auto_resume
setopt auto_list
setopt hist_ignore_dups
setopt autopushd
setopt pushd_minus
setopt extended_glob
setopt auto_menu
setopt no_list_beep
setopt pushd_ignore_dups
setopt no_nomatch
setopt extended_history
setopt equals
setopt magic_equal_subst
setopt hist_verify
setopt numeric_glob_sort
setopt print_eight_bit
setopt complete_in_word # ZSH FAQ: 4.4
setopt complete_aliases
setopt share_history
unsetopt ignore_eof
unsetopt hash_cmds
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

setopt auto_cd
setopt auto_param_keys
setopt auto_param_slash
setopt auto_remove_slash
setopt NO_beep
setopt correct

autoload -U compinit
compinit

#------------------------------------------------------------------------------------------#
# functions                                                                                #
#------------------------------------------------------------------------------------------#
function history-all { history -E 1 }
function histail { history -E 1 | grep $1 | tail }

#------------------------------------------------------------------------------------------#
# screen                                                                                   #
#------------------------------------------------------------------------------------------#
preexec () {
  echo -ne "\ek${1%% *}\e\\"
}

preexec () {
  [ ${STY} ] && echo -ne "\ek${1%% *}\e\\"
}
# VCSの情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '{%b}'
zstyle ':vcs_info:*' actionformats '{b|%a}'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
PS1='[%n@%m %1d]% %1(v|%F{red} %1v%f|) % '

# peco incremental history
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
