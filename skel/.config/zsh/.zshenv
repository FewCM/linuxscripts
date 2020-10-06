skip_global_compinit=1

ZDOTDIR=$HOME/.config/zsh

export TERM='rxvt-unicode'
export HISTFILE="$HOME/.config/zsh/history"
export PATH="/home/fewcm/bin:$PATH"
export PATH="/home/fewcm/.scripts:$PATH"
export PATH="/home/fewcm/.config/openbox/bin/:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"

export BROWSER="google-chrome-stable"
export EDITOR="/usr/bin/nvim"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LESS=-XFr

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export FZF_DEFAULT_COMMAND='ag -l \
  --nocolor \
  --hidden \
  --follow \
  --skip-vcs-ignores \
  {%@@ for folder in standard_ignored_folders @@%}
  --ignore {{@@ folder @@}} \
  {%@@ endfor @@%}
  {%@@ for file in standard_ignored_files @@%}
  --ignore "{{@@ file @@}}" \
  {%@@ endfor @@%}
  -g ""'