#{{{
source ~/.zsh/git-prompt/zshrc.sh
# The following lines were added by compinstall

zstyle ':completion:*' completer _list _expand _complete _ignored _match _approximate _prefix
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
bindkey -v
# End of lines configured by zsh-newuser-install
#
function precmd {

  local TERMWIDTH
  (( TERMWIDTH = ${COLUMNS} - 1 ))


  ###
  # Truncate the path if it's too long.

  PR_FILLBAR=""
  PR_PWDLEN=""

  local gitstatus="$(git_super_status)"
  local gitsize=0
  PR_GIT=""
  if [[ -n "$gitstatus" ]]; then
    gitsize=${gitstatus%% *}
    PR_GIT=${gitstatus#* }
  fi

  local promptsize=${#${(%):---(%n@%m:%l)(%~)--}}

  if [[ "$promptsize + $gitsize" -gt $TERMWIDTH ]]; then
    ((PR_PWDLEN=$TERMWIDTH - $promptsize))
  else
    PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $gitsize)))..${PR_HBAR}.)}"
  fi
	###
	# Get APM info.

	if which ibam > /dev/null; then
		PR_APM_RESULT=`ibam --percentbattery`
	elif which apm > /dev/null; then
		PR_APM_RESULT=`apm`
	fi

}

setprompt () {
  setopt prompt_subst
  autoload colors zsh/terminfo
  if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
  fi
  for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$reset_color$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$reset_color$fg[${(L)color}]%}'
    (( count = $count + 1 ))
  done
  PR_NO_COLOR="%{$terminfo[sgr0]%}"

  typeset -A altchar
  set -A altchar ${(s..)terminfo[acsc]}
  PR_SET_CHARSET="%{$terminfo[enacs]%}"
  PR_SHIFT_IN="%{$terminfo[smacs]%}"
  PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
  PR_HBAR=${altchar[q]:--}
  PR_ULCORNER=${altchar[l]:--}
  PR_LLCORNER=${altchar[m]:--}
  PR_LRCORNER=${altchar[j]:--}
  PR_URCORNER=${altchar[k]:--}

  case $TERM in
    xterm*|rxvt*)
      PR_TITLEBAR=$'%{\e]0;%(!.-=*[ROOT]*=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\a%}'
      PR_STITLE=''
      ;;
    screen*)
      PR_TITLEBAR=$'%{\e_screen \005 (\005t) | %(!.-=[ROOT]=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\e\\%}'
      PR_STITLE=$'%{\ekzsh\e\\%}'
      ;;
    *)
      PR_TITLEBAR=''
      PR_STITLE=''
      ;;
  esac
  if which ibam > /dev/null; then
    PR_APM='${PR_LIGHT_YELLOW}[${PR_RED}${${PR_APM_RESULT[(f)1]}[(w)-2]}%%(${${PR_APM_RESULT[(f)3]}[(w)-1]})${PR_LIGHT_YELLOW}]'
  elif which apm > /dev/null; then
    PR_APM='${PR_LIGHT_YELLOW}[${PR_RED}${PR_APM_RESULT[(w)5,(w)6]/\% /%%}${PR_LIGHT_YELLOW}]'
  else
    PR_APM=''
  fi
  PROMPT='${PR_SET_CHARSET}${PR_STITLE}${(e)PR_TITLEBAR}\
${PR_LIGHT_BLUE}${PR_SHIFT_IN}${PR_ULCORNER}${PR_HBAR}${PR_SHIFT_OUT}${PR_LIGHT_YELLOW}[\
${PR_LIGHT_GREEN}%n\
${PR_LIGHT_RED}@\
${PR_LIGHT_GREEN}%m\
${PR_LIGHT_BLUE}:\
${PR_LIGHT_CYAN}%l\
${PR_LIGHT_YELLOW}][\
${PR_LIGHT_MAGENTA}%~\
${PR_LIGHT_YELLOW}]\
${PR_LIGHT_BLUE}${PR_SHIFT_IN}${PR_HBAR}${(e)PR_FILLBAR}${PR_SHIFT_OUT}${(e)PR_GIT}${PR_SHIFT_IN}${PR_URCORNER}${PR_SHIFT_OUT} \

${PR_LIGHT_BLUE}${PR_SHIFT_IN}${PR_LLCORNER}${PR_HBAR}\
${PR_LIGHT_YELLOW}>${PR_SHIFT_OUT}${PR_NO_COLOR} '
  
	RPROMPT='${(e)PR_APM}${PR_LIGHT_YELLOW}[${PR_WHITE}%D{%H:%M}${PR_LIGHT_YELLOW}]${PR_LIGHT_BLUE}${PR_SHIFT_IN}${PR_LRCORNER}${PR_SHIFT_OUT}${PR_NO_COLOR}'
  
  PS2=' ${PR_LIGHT_YELLOW}>${PR_NO_COLOR} '
}
setprompt
#}}}

if [[ -d ~/.keychain ]]; then
	keychain ~/.ssh/id_rsa_tactilecactus ~/.ssh/id_rsa
	. ~/.keychain/$HOST-sh
	. ~/.keychain/$HOST-sh-gpg
fi
