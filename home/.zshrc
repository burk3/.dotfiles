if [[ -f "${HOME}/.zshrcpriv" ]]; then
  source "${HOME}/.zshrcpriv"
fi

# vcs debug if you want
#zstyle ':vcs_info:*+*:*' debug true

zstyle ':completion:*' completer _list _expand _oldlist _complete _ignored _match _approximate _prefix
zstyle ':completion:*' condition false
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' match-original both
zstyle ':completion:*' menu select=-1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory autocd extendedglob list_ambiguous histignorespace interactivecomments prompt_subst
unsetopt beep nomatch notify bash_auto_list
bindkey -e
# End of lines configured by zsh-newuser-install
#


# LSCOLORS THINGS
if [[ -f ~/.dir_colors ]] ; then
  eval $(dircolors -b ~/.dir_colors)
elif [[ -f /usr/share/dircolors/dircolors.ansi-light ]] ; then
  eval $(dircolors -b /usr/share/dircolors/dircolors.ansi-light)
elif [[ -f /etc/dir_colors ]] ; then
  eval $(dircolors -b /etc/dir_colors)
fi

if which -s virtualenvwrapper.sh &>/dev/null ; then
  source "$(which virtualenvwrapper.sh)"
fi

if [[ $ITERM_PROFILE != "Quakeish" ]] ; then
  export POWERLEVEL9K_COLOR_SCHEME="light"
fi


# zomg zplug is so dope
#source ~/.zsh/antigen/antigen.zsh
source ~/.zsh/zplug/init.zsh

zplug "lib/clipboard", from:oh-my-zsh
zplug "djui/alias-tips"
zplug "joel-porquet/zsh-dircolors-solarized"
zplug "hcgraf/zsh-sudo"
zplug "b4b4r07/emoji-cli"
zplug "b4b4r07/auto-fu.zsh"
zplug "felixr/docker-zsh-completion"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "plugins/brew", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "plugins/osx", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "plugins/systemd", from:oh-my-zsh, if:"(( $+commands[systemctl] ))"
zplug "plugins/archlinux", from:oh-my-zsh, if:"(( $+commands[pacman] ))"
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

#zplug "thvitt/tvline"

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# legit hg bookmarks biz
function +vi-hg-current-bmark() {
  if [[ -n "${hook_com[hg-active-bookmark]}" ]] ; then
    hook_com[hg-bookmark-string]="$(print_icon 'VCS_BOOKMARK_ICON') ${hook_com[hg-active-bookmark]}"
    ret=1
    return 0
  fi
}


# post zplug zstyle sets
zstyle ':vcs_info:*' disable bzr cdv darcs mtn svk tla
zstyle ':vcs_info:hg*:*' use-simple true
zstyle ':vcs_info:hg*:*' branchformat ""
zstyle ':vcs_info:hg*+gen-hg-bookmark-string:*' hooks hg-current-bmark
zstyle ':vcs_info:hg*:*' disable-flavours hg-hgsubversion hg-hgsvn hg-git

# zle stuff????
# zle-line-init () {auto-fu-init;}; zle -N zle-line-init
# zle -N zle-keymap-select auto-fu-zle-keymap-select

# fix delete key
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

# color my ls plox
alias sssh="TERM=xterm-color ssh"

if [[ -d ~/.keychain ]]; then
  keychain ~/.ssh/id_rsa_tactilecactus ~/.ssh/id_rsa
  . ~/.keychain/$HOST-sh
  . ~/.keychain/$HOST-sh-gpg
fi

if [[ -d ~/perl5 ]] ; then
  PERL_MB_OPT="--install_base \"/Users/bcates/perl5\""; export PERL_MB_OPT;
  PERL_MM_OPT="INSTALL_BASE=/Users/bcates/perl5"; export PERL_MM_OPT;
fi

if [[ -f ~/.zshalias ]] ; then
  source ~/.zshalias
fi
