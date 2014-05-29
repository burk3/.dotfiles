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
setopt appendhistory autocd extendedglob list_ambiguous
unsetopt beep nomatch notify bash_auto_list
bindkey -e
# End of lines configured by zsh-newuser-install
#

# zomg antigen is so dope
source ~/.zsh/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle gitfast
antigen bundle git
antigen bundle jira
antigen bundle jsontools
antigen bundle archlinux
antigen bundle wd
antigen bundle systemd
antigen bundle sudo
antigen bundle python
antigen theme burk3/custom-zsh-stuff themes/agnoster-light
antigen apply


# fix delete key
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

# color my ls plox
alias ls="ls --color=auto"
alias sssh="TERM=xterm-color ssh"

if [[ -d ~/.keychain ]]; then
	keychain ~/.ssh/id_rsa_tactilecactus ~/.ssh/id_rsa
	. ~/.keychain/$HOST-sh
	. ~/.keychain/$HOST-sh-gpg
fi
