# The following lines were added by compinstall

zstyle ':completion:*' completer _list _expand _complete _ignored _match _approximate _prefix
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
setopt appendhistory autocd extendedglob list_ambiguous histignorespace
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

# zomg antigen is so dope
source ~/.zsh/antigen/antigen.zsh

antigen use oh-my-zsh
if [[ $(uname) -eq "Darwin" ]] ; then
	antigen bundle osx
	antigen bundle brew
fi
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle gitfast
antigen bundle git
antigen bundle jira
antigen bundle jsontools
antigen bundle wd
antigen bundle sudo
antigen bundle python
antigen bundle virtualenv
antigen bundle virtualenvwrapper
#antigen bundle rbenv

if which systemctl &>/dev/null ; then
	antigen bundle systemd
fi

if which pacman &>/dev/null ; then
	antigen bundle archlinux
fi

antigen theme burk3/custom-zsh-stuff themes/agnoster-light
antigen apply


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
