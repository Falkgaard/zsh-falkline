# Author: Falk (falkgaard@gmail.com) 2020
# License: CC0 (AKA "Do Whatever The Fuck You Want")

# Documentation {{
# 
#  1. Install Oh-My-Zsh
#  2. Put this file in ~/.oh-my-zsh/themes/
#  3. add: ZSH_THEME="falk" to your .zshrc
#
#  Alternatively (untested):
#     Add 'source ~/PATH/TO/THIS/FILE' to your .zshrc
#
# Documentation }}}
# Colorizing support functions {{{
function zsh_falkline_bg() {
   if [[ $# = 1 ]]; then
      echo "\e[48;2;$1m"
   elif [[ $# = 3 ]]; then
      echo "\e[48;2;$1;$2;$3m"
   fi
}

function zsh_falkline_fg() {
   if [[ $# = 1 ]]; then
      echo "\e[38;2;$1m"
   elif [[ $# = 3 ]]; then
      echo "\e[38;2;$1;$2;$3m"
   fi
}
# Colorizing support functions }}}
# Symbol definitions {{{
zsh_falkline_symbol_connector="─"
zsh_falkline_symbol_at="@"
zsh_falkline_symbol_time_separator="|"
zsh_falkline_symbol_prompt_mark="->"
zsh_falkline_symbol_blob_transition_left=""
zsh_falkline_symbol_blob_transition_middle="▌"
zsh_falkline_symbol_blob_transition_right=""
# Symbol definitions }}}
# Color definitions {{{
zsh_falkline_color_blob="48;48;48"
zsh_falkline_color_ok_bg="192;255;96"
zsh_falkline_color_ok_fg="96;128;48"
zsh_falkline_color_err_bg="255;96;96"
zsh_falkline_color_err_fg="128;48;48"
zsh_falkline_color_user="255;255;255;1"
zsh_falkline_color_host="128;128;128"
zsh_falkline_color_tty="128;128;128"
zsh_falkline_color_path="255;240;160"
zsh_falkline_color_git="255;255;255"
zsh_falkline_color_date="128;128;128"
zsh_falkline_color_time="128;128;128"
zsh_falkline_color_connector="96;96;96"
zsh_falkline_color_at="192;192;192"
zsh_falkline_color_prompt_mark="128;128;128;1"
zsh_falkline_color_command="255;255;255"
zsh_falkline_color_time_separator="80;80;80"
# Color definitions }}}
# Style definitions {{{
zsh_falkline_style_user="$(zsh_falkline_fg $zsh_falkline_color_user)$(zsh_falkline_bg $zsh_falkline_color_blob)"
zsh_falkline_style_at="$(zsh_falkline_fg $zsh_falkline_color_at)$(zsh_falkline_bg $zsh_falkline_color_blob)"
zsh_falkline_style_host="$(zsh_falkline_fg $zsh_falkline_color_host)$(zsh_falkline_bg $zsh_falkline_color_blob)"
zsh_falkline_style_tty="$(zsh_falkline_fg $zsh_falkline_color_tty)$(zsh_falkline_bg $zsh_falkline_color_blob)"
zsh_falkline_style_path="$(zsh_falkline_fg $zsh_falkline_color_path)$(zsh_falkline_bg $zsh_falkline_color_blob)"
zsh_falkline_style_git="$(zsh_falkline_fg $zsh_falkline_color_git)$(zsh_falkline_bg $zsh_falkline_color_blob)"
zsh_falkline_style_connector="$reset_color$(zsh_falkline_fg $zsh_falkline_color_connector)"
zsh_falkline_style_prompt_mark="$reset_color$(zsh_falkline_fg $zsh_falkline_color_prompt_mark)"
zsh_falkline_style_command="$(zsh_falkline_fg $zsh_falkline_color_command)"
zsh_falkline_style_blob_transition_left="$reset_color$(zsh_falkline_fg $zsh_falkline_color_blob)$zsh_falkline_symbol_blob_transition_left"
zsh_falkline_style_blob_transition_right="$reset_color$(zsh_falkline_fg $zsh_falkline_color_blob)$zsh_falkline_symbol_blob_transition_right"
zsh_falkline_style_status_indicator_ok_transition_left=" $(zsh_falkline_fg $zsh_falkline_color_ok_bg)$zsh_falkline_symbol_blob_transition_left"
zsh_falkline_style_status_indicator_ok_symbol="$(zsh_falkline_fg $zsh_falkline_color_ok_fg)$(zsh_falkline_bg $zsh_falkline_color_ok_bg)"
zsh_falkline_style_status_indicator_ok_transition_right="$(zsh_falkline_fg $zsh_falkline_color_ok_bg)$(zsh_falkline_bg $zsh_falkline_color_blob)$zsh_falkline_symbol_blob_transition_middle"
zsh_falkline_style_status_indicator_err_transition_left=" $(zsh_falkline_fg $zsh_falkline_color_err_bg)$zsh_falkline_symbol_blob_transition_left"
zsh_falkline_style_status_indicator_err_symbol="$(zsh_falkline_fg $zsh_falkline_color_err_fg)$(zsh_falkline_bg $zsh_falkline_color_err_bg)x"
zsh_falkline_style_status_indicator_err_transition_right="$(zsh_falkline_fg $zsh_falkline_color_err_bg)$(zsh_falkline_bg $zsh_falkline_color_blob)$zsh_falkline_symbol_blob_transition_middle"
zsh_falkline_style_date="$(zsh_falkline_fg $zsh_falkline_color_date)$(zsh_falkline_bg $zsh_falkline_color_blob)"
zsh_falkline_style_time_separator="$(zsh_falkline_fg $zsh_falkline_color_time_separator)$(zsh_falkline_bg $zsh_falkline_color_blob)"
zsh_falkline_style_time="$(zsh_falkline_fg $zsh_falkline_color_time)$(zsh_falkline_bg $zsh_falkline_color_blob)"
# Style definitions }}}
# Statusline pieces {{{
zsh_falkline_prompt_mark=" $zsh_falkline_style_prompt_mark$zsh_falkline_symbol_prompt_mark$reset_color $zsh_falkline_style_command"
zsh_falkline_time_separator="$zsh_falkline_style_time_separator$zsh_falkline_symbol_time_separator"

function get_job_icon() {
   if [[ $1 == "1" ]]; then
      echo "1 "
   elif [[ $1 == "2" ]]; then
      echo "2 "
   fi
}

# Git status piece, WIP {{{
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]$(zsh_falkline_bg $zsh_falkline_color_blob)●"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]$(zsh_falkline_bg $zsh_falkline_color_blob)●"
function get_git_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$zsh_falkline_style_blob_transition_left$(parse_git_dirty)$zsh_falkline_style_git$(current_branch)$zsh_falkline_style_blob_transition_right$reset_color"
}
# Git status piece, WIP }}}
# Statusline left side {{{
function zsh_falkline_update_left() {
   zsh_falkline_left_side="%(?.$zsh_falkline_style_status_indicator_ok_transition_left$zsh_falkline_style_status_indicator_ok_symbol$zsh_falkline_style_status_indicator_ok_transition_right.$zsh_falkline_style_status_indicator_err_transition_left$zsh_falkline_style_status_indicator_err_symbol$zsh_falkline_style_status_indicator_err_transition_right)"
   zsh_falkline_left_side+="$(get_job_icon %j)"
   zsh_falkline_left_side+="$fg[black]%#"
   zsh_falkline_left_side+="$zsh_falkline_style_user%B%n%b"
   zsh_falkline_left_side+="$zsh_falkline_style_at$zsh_falkline_symbol_at"
   zsh_falkline_left_side+="$zsh_falkline_style_host%m"
   zsh_falkline_left_side+="$zsh_falkline_style_blob_transition_right"
   zsh_falkline_left_side+="$zsh_falkline_style_connector$zsh_falkline_symbol_connector"
   zsh_falkline_left_side+="$zsh_falkline_style_blob_transition_left"
   zsh_falkline_left_side+="$zsh_falkline_style_path%~"
   zsh_falkline_left_side+="$zsh_falkline_style_blob_transition_right"
}
# Statusline left side }}}
# Statusline right side {{{
function zsh_falkline_update_right() {
   zsh_falkline_right_side="$(get_git_info)"
   zsh_falkline_right_side+="$zsh_falkline_style_connector$zsh_falkline_symbol_connector"
   zsh_falkline_right_side+="$zsh_falkline_style_blob_transition_left"
   zsh_falkline_right_side+="$zsh_falkline_style_tty%l"
   zsh_falkline_right_side+="$zsh_falkline_style_blob_transition_right"
   zsh_falkline_right_side+="$zsh_falkline_style_connector$zsh_falkline_symbol_connector"
   zsh_falkline_right_side+="$zsh_falkline_style_blob_transition_left"
   zsh_falkline_right_side+="$zsh_falkline_style_date%D"
   zsh_falkline_right_side+="$zsh_falkline_time_separator"
   zsh_falkline_right_side+="$zsh_falkline_style_time%*"
   zsh_falkline_right_side+="$zsh_falkline_style_blob_transition_right "
}
# Statusline right side }}}
# Unused length getter {{{
# computes the number of unused characters unused by the prompt sides in the terminal
function zsh_falkline_get_unused_length() {
   local tmp=$(print -P "$zsh_falkline_left_side")$(print -P "$zsh_falkline_right_side")
   tmp=$(echo "$tmp" | sed 's/\x1b\[[0-9;]*m//g')
   echo $#tmp
}
# Unused length getter }}}
# Unusued space filler {{{
function zsh_falkline_update_middle() {
   local len=${COLUMNS}
   (( len=len - $(zsh_falkline_get_unused_length) ))
   zsh_falkline_middle="$zsh_falkline_style_connector$(printf '%*s\n' $len "" | sed "s/\ /$zsh_falkline_symbol_connector/g")"
}
# Unused space filler }}}
# Statusline pieces }}}
# Prompt hooks {{{
# updates prompt left/right sides pre-draw
function precmd {
   zsh_falkline_update_left
   zsh_falkline_update_right
   zsh_falkline_update_middle
}

# allows the command input to have a different color than the command output
function preexec {
   echo -n "$reset_color"
}

# the prompt itself; the first line is blank to space things out
PROMPT='
$zsh_falkline_left_side$zsh_falkline_middle$zsh_falkline_right_side
$zsh_falkline_prompt_mark'
# Prompt hooks }}}
# EOF
