# The following lines were added by compinstall

zstyle ':completion:*' completer _list _expand _oldlist _complete _ignored _match _approximate _prefix
zstyle ':completion:*' condition false
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' match-original both
zstyle ':completion:*' menu select=-1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/burke/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
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

ZSH_THEME="agnoster-light"

# zomg zplug is so dope
#source ~/.zsh/antigen/antigen.zsh
source ~/.zsh/zplug/init.zsh



#zplug "robbyrussell/oh-my-zsh"
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "lib/git", from:oh-my-zsh, if:'(( $+commands[git] ))'
zplug "tevren/git-zsh-plugin"
zplug "unixorn/git-extra-commands"
zplug "hcgraf/zsh-sudo"
zplug "b4b4r07/emoji-cli"
zplug "b4b4r07/auto-fu.zsh"
zplug "felixr/docker-zsh-completion"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", nice:19
zplug "plugins/brew", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "plugins/osx", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "plugins/systemd", from:oh-my-zsh, if:"(( $+commands[systemctl] ))"
zplug "plugins/archlinux", from:oh-my-zsh, if:"(( $+commands[pacman] ))"
if [[ $ITERM_PROFILE == "Quakeish" ]] ; then
  zplug "themes/agnoster", from:oh-my-zsh, nice:18
else
  zplug "burk3/agnoster-light", use:agnoster-light.zsh-theme, nice:18
fi

#zplug "thvitt/tvline"

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load


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
