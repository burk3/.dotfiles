# Check for an interactive session
[ -z "$PS1" ] && return

# Put your fun stuff here.
export EDITOR=vim

#holy shit finally found it
# colored prompt
RB="\[\e[0;34m\]"
RG="\[\e[0;32m\]"
RY="\[\e[0;33m\]"
RM="\[\e[0;35m\]"
RC="\[\e[0;36m\]"
RR="\[\e[0;31m\]"
RW="\[\e[0m\]"

PS1="$RB┌─$RY[$RG\u$RR@$RG\H$RB:$RC`temp=$(tty) ; echo ${temp:5}`$RY][$RM\w$RY]\n$RB└─$RY> $RW"
PS2=" \[$RY\]> \[$RW\]"
export PS1
export PS2

if [[ -d ~/.keychain ]]; then
	keychain ~/.ssh/id_rsa_tactilecactus ~/.ssh/id_rsa
	. ~/.keychain/$HOSTNAME-sh
	. ~/.keychain/$HOSTNAME-sh-gpg
fi

