
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

    module_path+=( "/home/fewcm/.zinit/bin/zmodules/Src" )
    zmodload zdharma/zplugin > /dev/null 2>&1  

#
# Autoloads
#

autoload -Uz allopt zed zmv zcalc colors
colors

autoload -Uz edit-command-line
zle -N edit-command-line
#bindkey -M vicmd v edit-command-line

autoload -Uz select-word-style
select-word-style shell

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic


##-------------------------Custom set-------------------------
HISTSIZE=1000000
SAVEHIST=$HISTSIZE

setopt nonomatch
setopt interactive_comments
setopt correct
setopt clobber
setopt complete_aliases
setopt histignorespace
setopt auto_cd
setopt notify
setopt nobeep

setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt share_history
setopt INC_APPEND_HISTORY

# eliminates duplicates in *paths
typeset -gU cdpath fpath path

# Aliases
# Lists the ten most used commands.
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --embed-thumbnail --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "

alias ytv-best="youtube-dl -f bestvideo+bestaudio "

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


## general use
 alias ls='exa'                                                          # ls
 alias l='exa -lbF --git --color=always --color-scale --group-directories-first --icons'                                                # list, size, type, git
 alias ll='exa -lbGF --color=always --color-scale --group-directories-first --icons'                                             # long list
 alias llm='exa -lbGd --sort=modified --color=always --color-scale --group-directories-first --icons'                            # long list, modified date sort
 alias la='exa -lbhHigmuSa --time-style=long-iso --color-scale'  # all list
 alias lx='exa -lbhHigmuSa@ --time-style=long-iso --color-scale' # all + extended list

# specialty views
alias lS='exa -1'                                                              # one column, just names
alias lt='exa --tree --level=2'                                         # tree

# Changing "ls" to "exa"
#alias l="ls"
#alias l="exa -x --recurse --level=2 --sort=Filename --classify --color=always --color-scale --group-directories-first --icons" # my preferred listing
#alias la="exa --all --long   --tree  --recurse --level=2 --sort=Filename --classify --color=always --color-scale --group-directories-first --icons"  # all files and dirs
#alias lls="exa --long  --recurse --level=2 --sort=Filename --classify --color=always --color-scale --group-directories-first --icons" # my preferred listing

# # Always enable colored `grep` output
# # Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec /usr/bin/zsh -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'
alias fpath='echo -e ${FPATH//:/\\n}'

alias cat="bat"
alias yt="youtube-dl -v"
alias zshrc='micro ~/.config/zsh/.zshrc'
alias edit='exec micro'
alias sedit='sudo micro'


typeset -F4 SECONDS=0

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

setopt promptsubst

zinit snippet PZT::modules/spectrum
zinit snippet PZT::modules/command-not-found
zinit snippet OMZL::functions.zsh
zinit snippet OMZP::colored-man-pages
zinit snippet OMZL::git.zsh
zinit ice atload"unalias grv"
zinit snippet OMZP::git
zinit snippet OMZL::prompt_info_functions.zsh

# zstyle ':prezto:load' pmodule \
#   'environment' \
#   'terminal' \
#   'editor' \
#   'history' \
#   'directory' \
#   'spectrum' \
#   'utility' \
#   'completion' \
#   'prompt'

zinit wait"0e" lucid from"gh-r" as"null" for \
     sbin"**/fd"        @sharkdp/fd \
     sbin"**/bat"       @sharkdp/bat \
     sbin"exa* -> exa"  ogham/exa

zinit pack for ls_colors
zinit pack lucid for dircolors-material  
zinit pack'bgn+keys' for fzf
#zinit pack"bgn" git for pyenv
# ##---------- Bundles from the custom repo.

# # _enhancd-setting() {
# #   export ENHANCD_FILTER=fzf:fzy:peco
# # }

_zsh-history-substring-search-setting() {
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down
  HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
}

zinit ice atload"_zsh_highlight" lucid
zinit load zdharma/fast-syntax-highlighting
zinit ice wait"0b" compile'{src/*.zsh,src/strategies/*}' atload"_zsh_autosuggest_start" lucid
zinit load zsh-users/zsh-autosuggestions
zinit ice wait"0b" lucid
zinit load hlissner/zsh-autopair
zinit ice wait"0f" blockf lucid
zinit load zsh-users/zsh-completions


zinit ice wait'0d' lucid
zinit load brymck/print-alias
zinit ice wait"0c" atload"_zsh-history-substring-search-setting" lucid
zinit load zsh-users/zsh-history-substring-search
zinit ice wait"0d" lucid
zinit load djui/alias-tips
zinit ice wait'0d' lucid
zinit load laggardkernel/zsh-thefuck
zinit ice wait'0d' lucid
zinit load hkbakke/bash-insulter
# add some items to bash-insulter
custom_insults=(
	"B-BAKA!!!"
	"Omae wa mou shindeiru"
	"Nani?!"
)
# increase the probability of my custom additions showing by duplicating them
export CMD_NOT_FOUND_MSGS_APPEND=("${custom_insults[@]}" "${custom_insults[@]}")

# # zinit ice wait"1b" lucid
# # zinit load ytet5uy4/fzf-widgets

# # zinit ice wait"0c" atload"_enhancd-setting" lucid
# # zinit light b4b4r07/enhancd



# zinit snippet OMZL::git.zsh
# zinit ice atload"unalias grv"
# zinit snippet OMZP::git
# zinit snippet OMZL::prompt_info_functions.zsh
# zinit snippet https://raw.githubusercontent.com/carloscuesta/materialshell/master/materialshell.zsh

#zinit atload'!source ~/.p10k.zsh' lucid nocd for \
#    romkatv/powerlevel10k

# zinit lucid load'![[ $MYPROMPT = 4 ]]' unload'![[ $MYPROMPT != 4 ]]' nocd for \
#     DoctorRyner/ryner-zsh-theme

 zinit lucid load'![[ $MYPROMPT = 2 ]]' unload'![[ $MYPROMPT != 2 ]]' nocd for \
     halfo/lambda-mod-zsh-theme

# zinit lucid load'![[ $MYPROMPT = 3 ]]' unload'![[ $MYPROMPT != 3 ]]' nocd for \
#     sindresorhus/pure

# zplugin ice lucid atinit'fpath+=($PWD/functions.zwc $PWD/functions ${XDG_DATA_HOME:-${HOME}/.local/share}/apollo $PWD/modules.zwc $PWD/modules)'
# zplugin light mjrafferty/apollo-zsh-theme

# zplugin light reobin/typewritten

# zinit load mafredri/zsh-async
# zinit load marszall87/lambda-pure


MYPROMPT=2

# zinit is-snippet lucid for \
#     ~/.config/lib/completion.zsh
# # #-----Fzf
# source $HOME/.config/lib/fzf-set.zsh
# # #source $HOME/.config/Lib2/*.zsh

#source /usr/share/doc/find-the-command/ftc.zsh

if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi

print [zshrc] Zinit block took ${(M)$(( SECONDS * 1000 ))#*.?} ms
