# ~/.bashrc
# Maintainer: Voronov S.V <voronov.semyon@gmail.com>
# Git repo: https://github.com/karmicdude/dotfiles

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Correct minor errors in the spelling of a directory component in a cd command
shopt -s cdspell
shopt -s dirspell
# Lists the status of any stopped and running jobs before exiting an shell
shopt -s checkjobs
# Append commands to the history file, without overwrite it
shopt -s histappend
# Check terminal size and refresh LINES before command
shopt -s checkwinsize
# Lines which begin with a space character are not saved in the history list
# Lines matching the previous history entry to not be saved
export HISTCONTROL=ignoreboth
# Format history entry to print the timestamp in strftime format
export HISTTIMEFORMAT="%d.%m.%y %T> "
# The number of commands to remember in the command history. -1 every command being saved
export HISTSIZE=-1
# The maximum number of lines contained in the history file
export HISTFILESIZE=5000000
# Ignore commands in history
export HISTIGNORE="ls:pwd:clear"

# For X
if [ "$DISPLAY" ]; then
  xset -dpms  # Disable DPMS
  xset s off  # Disable screensaver
  xset b off  # Disable beeper
fi

# ENV settings
export EDITOR="vim"
export VISUAL="vim"
export ALTERNATE_EDITOR="nano"
export PAGER="bat -n"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

BASH_CONF_DIR=~/.config/bashrc.d
BASH_CONF_FILES="
  aliases
  functions
  prompt
  starship
"

# Source included configs
for config in ${BASH_CONF_FILES}
do
  [[ -f "${BASH_CONF_DIR}/${config}" ]] && . "${BASH_CONF_DIR}/${config}"
done

# Set dircolors
[[ -f ~/.dircolors ]] && eval "$(dircolors ~/.dircolors)"

# You can put anything to .bash_env (e.g. private aliases)
[[ -f ~/.bash_env ]] && . ~/.bash_env

# Display beautiful system information
[[ -f /usr/bin/neofetch ]] && neofetch | cat -s

[[ -f /usr/bin/terraform ]] && complete -C /usr/bin/terraform terraform

[[ -f /usr/share/goto/goto.sh ]] && . /usr/share/goto/goto.sh

# Kubectl configs
if [ -f ~/.kube/config_list ]; then
  KUBECONFIG=$(paste -sd ':' ~/.kube/config_list)
  export KUBECONFIG
fi

# vim:ft=sh
