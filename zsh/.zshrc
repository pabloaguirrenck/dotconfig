#============================================================
# ZSHRC UCONFIGURATION FILE
# OWNERSHIP: USER
# PABLO AGUIRRE NÚÑEZ
#============================================================

#------------------------------------------------------------
# BEGINNING OF ZSHRC CONFIGURATION FILE
#------------------------------------------------------------

#============================================================
#  General configuration
#============================================================
# Instant Prompt (from pk10 theme)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable scrolling through partial commands on history
bindkey "^[OA" history-beginning-search-backward
bindkey "^[OB" history-beginning-search-forward

# Use most as pager (instead of less)
#export PAGER=most
export PAGER=less

umask 022


# Display man pages in color when using pager = less (Currently using most as pager)
#export LESS_TERMCAP_mb=$'\e[1;32m'
#export LESS_TERMCAP_md=$'\e[1;32m'
#export LESS_TERMCAP_me=$'\e[0m'
#export LESS_TERMCAP_se=$'\e[0m'
#export LESS_TERMCAP_so=$'\e[01;33m'
#export LESS_TERMCAP_ue=$'\e[0m'
#export LESS_TERMCAP_us=$'\e[1;4;31m'

#------------------------------------------------------------
# Custom Functions Export
#------------------------------------------------------------
# Export custom functions paths
export FPATH=$HOME/.config/zsh/custom_funs:$FPATH
fpath=( ~/.config/zsh/custom_funs "${fpath[@]}" )

# Autoload every file listed on custom_funs directory
autoload -U $fpath[1]/*(.:t)

# Load complist module (needed for using nvim keys in tab complete menu)

# Basic auto/tab complete:
#autoload -U compinit
##zstyle ':completion:*' menu select
#zstyle ':completion:*' file-patterns '%p(D):globbed-files *(D-/):directories' '*(D):all-files'
#compinit
zmodload zsh/complist

# Solution for percent sign on prompt
#unsetopt PROMPT_SP
setopt PROMPT_CR
unsetopt PROMPT_SP
export PROMPT_EOL_MARK=""

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

#------------------------------------------------------------
# Export Path Variables
#------------------------------------------------------------
# Export bin paths
# Export the following paths, plus the already exported $PATH variables
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.config/oh-my-zsh

# Export cache path
export ZSH_CACHE_DIR=$HOME/.config/zsh/hist-cache

# Export hist file
HISTFILE=/home/pabloagnck/.cache/zsh/.zsh_history
SAVEHIST=100000
HISTFILESIZE=500000
setopt appendhistory

#------------------------------------------------------------
# Pastel color mode settings
#------------------------------------------------------------
export PASTEL_COLOR_MODE=24bit

#------------------------------------------------------------
# Auto tab complete
#------------------------------------------------------------
# Allow for showing hidden files
setopt globdots

# Other useful set opts
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_cd # cd by typing directory name if it's not a command
#setopt correct_all # autocorrect commands
#setopt auto_list # automatically list choices on ambiguous completion
#setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

#------------------------------------------------------------
# Use vim keys in tab complete menu
#------------------------------------------------------------
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

#============================================================
# OH-MY-ZSH CONFIGURATION
#============================================================
# Would you like to use another custom folder than $ZSH/custom?
export ZSH_CUSTOM=$HOME/.config/oh-my-zsh/custom

#============================================================
# ANTIGEN CONFIGURATION
#============================================================

#------------------------------------------------------------
# Export Antigen Path Variables
#------------------------------------------------------------
# Export adotfir, which will contain bundle config files
export ADOTDIR=$HOME/.config/antigen

# Export zcompdump dir
export ANTIGEN_COMPDUMP=$HOME/.config/antigen/.zcompdump

# Export Antigen log dir
export ANTIGEN_LOG=$HOME/.config/antigen/antigen.log

# Let Antigen auto check configuration files
typeset -a ANTIGEN_CHECK_FILES=($HOME/.config/zsh/.zshrc)

#------------------------------------------------------------
# Initialize Antigen & Plugins
#------------------------------------------------------------
# Load Antigen
source ~/.config/antigen/antigen.zsh

# Load oh-my-zsh library.
antigen use oh-my-zsh
# Load bundles from the default repo (oh-my-zsh).
antigen bundle git
antigen bundle command-not-found
antigen bundle docker

# Load bundles from external repos.
antigen bundle git
antigen bundle pip
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle python
antigen bundle sudo
antigen bundle virtualenv
antigen bundle heroku
antigen bundle shopt
antigen bundle zsh-users/vi-mode
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

#============================================================
# Vi mode configuration
#============================================================
# Initialize vi-mode
bindkey -v
export KEYTIMEOUT=1

# Enable edit mode on vim (edits current line and returns it)
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Enable yank to cliboard with conventional yank and paste keybindings
function x11-clip-wrap-widgets() {
    local copy_or_paste=$1
    shift

    for widget in $@; do
        # Ugh, zsh doesn't have closures
        if [[ $copy_or_paste == "copy" ]]; then
            eval "
            function _x11-clip-wrapped-$widget() {
                zle .$widget
                xclip -in -selection clipboard <<<\$CUTBUFFER
            }
            "
        else
            eval "
            function _x11-clip-wrapped-$widget() {
                CUTBUFFER=\$(xclip -out -selection clipboard)
                zle .$widget
            }
            "
        fi

        zle -N $widget _x11-clip-wrapped-$widget
    done
}


local copy_widgets=(
    vi-yank vi-yank-eol vi-delete vi-backward-kill-word vi-change-whole-line
)
local paste_widgets=(
    vi-put-{before,after}
)

# NB: can atm. only wrap native widgets
x11-clip-wrap-widgets copy $copy_widgets
x11-clip-wrap-widgets paste  $paste_widgets

#============================================================
# P10K CONFIGURATION
#============================================================
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

#============================================================
# GENERAL ZSH CONFIGURATION
#============================================================
# Case-sensitive completion.
CASE_SENSITIVE="true"
zstyle ':completion:*' group-name '' # group results by category
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Set UTF-8 encoding
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8 

#Prompt indent (removes unwanted right prompt one-char indent)
ZLE_RPROMPT_INDENT=0

#============================================================
# ALIASES
#============================================================
# Append shell aliases.
test -r ~/.config/zsh/.aliases && source ~/.config/zsh/.aliases

# Set vim filetype
# vim: set ft=zsh:

#------------------------------------------------------------
# END OF ZSHRC CONFIGURATION FILE
#------------------------------------------------------------
