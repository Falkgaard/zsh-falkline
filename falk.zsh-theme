# Author: Falk (falkgaard@gmail.com) 2020
# License: CC0 (AKA "Do Whatever The Fuck You Want")
# TODO {{{
#     Adaptive width? E.g. skip tty blob or git blob if width is insufficient
# TODO }}}
# Documentation {{{
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
      echo "%0{\e[48;2;$1m%}"
   elif [[ $# = 3 ]]; then
      echo "%0{\e[48;2;$1;$2;$3m%}"
   fi
}

function zsh_falkline_fg() {
   if [[ $# = 1 ]]; then
      echo "%0{\e[38;2;$1m%}"
   elif [[ $# = 3 ]]; then
      echo "%0{\e[38;2;$1;$2;$3m%}"
   fi
}
# Colorizing support functions }}}
# Symbol definitions {{{
zsh_falkline_symbol_privileged='%1{%}'
zsh_falkline_symbol_unprivileged=''
zsh_falkline_symbol_connector="%1{─%}"
zsh_falkline_symbol_at="%1{@%}"
zsh_falkline_symbol_time_separator="|"
zsh_falkline_symbol_prompt_mark="->"
zsh_falkline_symbol_command_success="%1{%}"
zsh_falkline_symbol_command_error="%1{x%}"
zsh_falkline_symbol_blob_transition_left="%1{%}"
zsh_falkline_symbol_blob_transition_middle="%1{█%} "
zsh_falkline_symbol_blob_transition_right="%1{%}"
zsh_falkline_symbol_git_branch_icon=" %1{%}"
zsh_falkline_symbol_git_dirty='%1{●%} '
zsh_falkline_symbol_git_clean='%1{●%} '
# Nnumber style {{{
# Pick one!
    zsh_falkline_symbol_array_numbers=("❶ " "❷ " "❸ " "❹ " "❺ " "❻ " "❼ " "❽ " "❾ " "❿ " "⓫ " "⓬ " "⓭ " "⓮ " "⓯ " "⓰ " "⓱ " "⓲ " "⓳ " "⓴ ")
#   zsh_falkline_symbol_array_numbers=("⚀ " "⚁ " "⚂ " "⚃ " "⚄ " "⚅ ")
#   zsh_falkline_symbol_array_numbers=("⒈ " "⒉ " "⒊ " "⒋ " "⒌ " "⒍ " "⒎ " "⒏ " "⒐ " "⒑ " "⒒ " "⒓ " "⒔ " "⒕ " "⒖ " "⒗ " "⒘ " "⒙ " "⒚ " "⒛ ")
#   zsh_falkline_symbol_array_numbers=("⑴ " "⑵ " "⑶ " "⑷ " "⑸ " "⑹ " "⑺ " "⑻ " "⑼ " "⑽ " "⑾ " "⑿ " "⒀ " "⒁ " "⒂ " "⒃ " "⒄ " "⒅ " "⒆ " "⒇ ")
#   zsh_falkline_symbol_array_numbers=("Ⅰ " "Ⅱ " "Ⅲ " "Ⅳ " "Ⅴ " "Ⅵ " "Ⅶ " "Ⅷ " "Ⅸ " "Ⅹ " "Ⅺ " "Ⅻ ")
#   zsh_falkline_symbol_array_numbers=("𝄖 " "𝄗 " "𝄘 " "𝄙 " "𝄚 " "𝄛 ")
# Optional job number styles }}}
# Symbol definitions }}}
# Color definitions {{{
zsh_falkline_color_privileged='255;220;128'
zsh_falkline_color_unprivileged='96;128;128'
zsh_falkline_color_blob_unprivileged='48;48;48'
zsh_falkline_color_blob_privileged='64;24;64'
function zsh_falkline_color_blob() {
   if  [[ $(print -P %#) == "#" ]]; then
      echo $zsh_falkline_color_blob_privileged
   else
      echo $zsh_falkline_color_blob_unprivileged
   fi
}
zsh_falkline_color_ok_bg='192;255;96'
zsh_falkline_color_ok_fg='96;128;48'
zsh_falkline_color_err_bg='255;96;96'
zsh_falkline_color_err_fg='128;48;48'
zsh_falkline_color_user='255;255;255;1'
zsh_falkline_color_host='128;128;128'
zsh_falkline_color_jobs='255;255;255'
zsh_falkline_color_tty='128;128;128'
zsh_falkline_color_path='255;240;160'
zsh_falkline_color_date='128;128;128'
zsh_falkline_color_time='128;128;128'
zsh_falkline_color_connector='96;96;96'
zsh_falkline_color_at='192;192;192'
zsh_falkline_color_prompt_mark='128;128;128;1'
zsh_falkline_color_command='255;255;255'
zsh_falkline_color_time_separator='80;80;80'
zsh_falkline_color_git='160;160;160'
zsh_falkline_color_git_branch_icon='255;255;255'
zsh_falkline_color_git_dirty='255;128;160'
zsh_falkline_color_git_clean='160;240;192'
# Color definitions }}}
# Style definitions {{{
zsh_falkline_style_privileged=$(zsh_falkline_fg $zsh_falkline_color_privileged)$(zsh_falkline_bg $(zsh_falkline_color_blob))
zsh_falkline_style_unprivileged=$(zsh_falkline_fg $zsh_falkline_color_unprivileged)$(zsh_falkline_bg $(zsh_falkline_color_blob))
zsh_falkline_style_user=$(zsh_falkline_fg $zsh_falkline_color_user)$(zsh_falkline_bg $(zsh_falkline_color_blob))
zsh_falkline_style_at=$(zsh_falkline_fg $zsh_falkline_color_at)$(zsh_falkline_bg $(zsh_falkline_color_blob))
zsh_falkline_style_host=$(zsh_falkline_fg $zsh_falkline_color_host)$(zsh_falkline_bg $(zsh_falkline_color_blob))
zsh_falkline_style_jobs=$(zsh_falkline_fg $zsh_falkline_color_jobs)$(zsh_falkline_bg $(zsh_falkline_color_blob))
zsh_falkline_style_tty=$(zsh_falkline_fg $zsh_falkline_color_tty)$(zsh_falkline_bg $(zsh_falkline_color_blob))
zsh_falkline_style_path=$(zsh_falkline_fg $zsh_falkline_color_path)$(zsh_falkline_bg $(zsh_falkline_color_blob))
zsh_falkline_style_git=$(zsh_falkline_fg $zsh_falkline_color_git)$(zsh_falkline_bg $(zsh_falkline_color_blob))
zsh_falkline_style_git_branch_icon=$(zsh_falkline_fg $zsh_falkline_color_git_branch_icon)$(zsh_falkline_bg $(zsh_falkline_color_blob))
zsh_falkline_style_git_dirty=$(zsh_falkline_fg $zsh_falkline_color_git_dirty)$(zsh_falkline_bg $(zsh_falkline_color_blob))
zsh_falkline_style_git_clean=$(zsh_falkline_fg $zsh_falkline_color_git_clean)$(zsh_falkline_bg $(zsh_falkline_color_blob))
zsh_falkline_style_connector=$reset_color$(zsh_falkline_fg $zsh_falkline_color_connector)
zsh_falkline_style_prompt_mark=$reset_color$(zsh_falkline_fg $zsh_falkline_color_prompt_mark)
zsh_falkline_style_command=$(zsh_falkline_fg $zsh_falkline_color_command)
zsh_falkline_style_blob_transition_left=$reset_color$(zsh_falkline_fg $(zsh_falkline_color_blob))$zsh_falkline_symbol_blob_transition_left
zsh_falkline_style_blob_transition_right=$reset_color$(zsh_falkline_fg $(zsh_falkline_color_blob))$zsh_falkline_symbol_blob_transition_right
zsh_falkline_style_status_indicator_ok_transition_left=\ $(zsh_falkline_fg $zsh_falkline_color_ok_bg)$zsh_falkline_symbol_blob_transition_left
zsh_falkline_style_status_indicator_ok_symbol=$(zsh_falkline_fg $zsh_falkline_color_ok_fg)$(zsh_falkline_bg $zsh_falkline_color_ok_bg)$zsh_falkline_symbol_command_success
zsh_falkline_style_status_indicator_ok_transition_right=$(zsh_falkline_fg $zsh_falkline_color_ok_bg)$(zsh_falkline_bg $(zsh_falkline_color_blob))$zsh_falkline_symbol_blob_transition_middle
zsh_falkline_style_status_indicator_err_transition_left=\ $(zsh_falkline_fg $zsh_falkline_color_err_bg)$zsh_falkline_symbol_blob_transition_left
zsh_falkline_style_status_indicator_err_symbol=$(zsh_falkline_fg $zsh_falkline_color_err_fg)$(zsh_falkline_bg $zsh_falkline_color_err_bg)$zsh_falkline_symbol_command_error
zsh_falkline_style_status_indicator_err_transition_right=$(zsh_falkline_fg $zsh_falkline_color_err_bg)$(zsh_falkline_bg $(zsh_falkline_color_blob))$zsh_falkline_symbol_blob_transition_middle
zsh_falkline_style_date=$(zsh_falkline_fg $zsh_falkline_color_date)$(zsh_falkline_bg $(zsh_falkline_color_blob))
zsh_falkline_style_time_separator=$(zsh_falkline_fg $zsh_falkline_color_time_separator)$(zsh_falkline_bg $(zsh_falkline_color_blob))
zsh_falkline_style_time=$(zsh_falkline_fg $zsh_falkline_color_time)$(zsh_falkline_bg $(zsh_falkline_color_blob))
# Style definitions }}}
# Statusline pieces {{{
# NOTE: the number in "%n{...%}" must be the length of the mark! Otherwise tab completion will glitch the prompt{{{}}}
zsh_falkline_prompt_mark="%4{ $zsh_falkline_style_prompt_mark$zsh_falkline_symbol_prompt_mark$reset_color %}$zsh_falkline_style_command"
zsh_falkline_time_separator=$zsh_falkline_style_time_separator$zsh_falkline_symbol_time_separator
# Privilege symbol getter {{{
function zsh_falkline_get_privilege_marker() {
   if [[ "$1" == "#" ]]; then
      echo $zsh_falkline_style_privileged$zsh_falkline_symbol_privileged
   else
      echo $zsh_falkline_style_unprivileged$zsh_falkline_symbol_unprivileged
   fi
}
# Privilege symbol getter }}}
# Job number symbol getter {{{
# TODO: Handle case where there are insufficient symbols
function zsh_falkline_get_job_icon {
   echo "$zsh_falkline_style_jobs${zsh_falkline_symbol_array_numbers[$(jobs | wc -l)]}"
}
# Job number symbol getter }}}
# Git status piece, WIP {{{
ZSH_THEME_GIT_PROMPT_DIRTY="$zsh_falkline_style_git_dirty$zsh_falkline_symbol_git_dirty"
ZSH_THEME_GIT_PROMPT_CLEAN="$zsh_falkline_style_git_clean$zsh_falkline_symbol_git_clean"
function zsh_falkline_get_git_info {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$zsh_falkline_style_blob_transition_left$(parse_git_dirty)$zsh_falkline_style_git$(current_branch)$zsh_falkline_style_git_branch_icon$zsh_falkline_symbol_git_branch_icon$zsh_falkline_style_blob_transition_right$reset_color$zsh_falkline_style_connector$zsh_falkline_symbol_connector"
}

function zsh_falkline_get_status_indicator {
   if [ $zsh_falkline_last_retval -eq "0" ]; then
      echo $zsh_falkline_style_status_indicator_ok_transition_left$zsh_falkline_style_status_indicator_ok_symbol$zsh_falkline_style_status_indicator_ok_transition_right
   else
      echo $zsh_falkline_style_status_indicator_err_transition_left$zsh_falkline_style_status_indicator_err_symbol$zsh_falkline_style_status_indicator_err_transition_right
   fi
}
# Git status piece, WIP }}}
# Statusline left side {{{
function zsh_falkline_update_left {
   zsh_falkline_left_side=''
   zsh_falkline_left_side+=$(zsh_falkline_get_status_indicator)
   zsh_falkline_left_side+=$(zsh_falkline_get_privilege_marker $(print -P %#))
   zsh_falkline_left_side+=$zsh_falkline_style_user%B%n%b
   zsh_falkline_left_side+=$zsh_falkline_style_at$zsh_falkline_symbol_at
   zsh_falkline_left_side+=$zsh_falkline_style_host%m
   zsh_falkline_left_side+=$zsh_falkline_style_blob_transition_right
   zsh_falkline_left_side+=$zsh_falkline_style_connector$zsh_falkline_symbol_connector
   zsh_falkline_left_side+=$zsh_falkline_style_blob_transition_left
   zsh_falkline_left_side+=$zsh_falkline_style_path%~
   zsh_falkline_left_side+=$zsh_falkline_style_blob_transition_right
}
# Statusline left side }}}
# Statusline right side {{{
function zsh_falkline_update_right {
   zsh_falkline_right_side=''
   zsh_falkline_right_side+=$(zsh_falkline_get_git_info)
   zsh_falkline_right_side+=$zsh_falkline_style_blob_transition_left
   zsh_falkline_right_side+=$(zsh_falkline_get_job_icon)
   zsh_falkline_right_side+=$zsh_falkline_style_tty%l
   zsh_falkline_right_side+=$zsh_falkline_style_blob_transition_right
   zsh_falkline_right_side+=$zsh_falkline_style_connector$zsh_falkline_symbol_connector
   zsh_falkline_right_side+=$zsh_falkline_style_blob_transition_left
   zsh_falkline_right_side+=$zsh_falkline_style_date%D
   zsh_falkline_right_side+=$zsh_falkline_time_separator
   zsh_falkline_right_side+=$zsh_falkline_style_time%*
   zsh_falkline_right_side+=$zsh_falkline_style_blob_transition_right\ 
}
# Statusline right side }}}
# Unused length getter {{{
# computes the number of unused characters unused by the prompt sides in the terminal
function zsh_falkline_get_mid_length {
   local len=$COLUMNS
   local used=$(print -P "$zsh_falkline_left_side")$(print -P "$zsh_falkline_right_side")
   used=$(echo "$used" | sed 's/\x1b\[[0-9;]*m//g')
   (( len=len - $#used ))
   if (( $len < 0 )); then
      echo "0"
   else
      echo "$len"
   fi
}
# Unused length getter }}}
# Unusued space filler {{{
function zsh_falkline_update_middle {
   local len=$(zsh_falkline_get_mid_length)
   zsh_falkline_middle="$zsh_falkline_style_connector$(printf '%*s\n' $len "" | sed "s/\ /$zsh_falkline_symbol_connector/g")"
}
# Unused space filler }}}
# Statusline pieces }}}
# Prompt hooks {{{
# updates prompt left/right sides pre-draw
function precmd {
   zsh_falkline_last_retval=$(print -P %?) # hack due to using precmd
   zsh_falkline_update_left
   zsh_falkline_update_right
#	zsh_falkline_update_middle
	zsh_falkline_middle="$zsh_falkline_style_connector$zsh_falkline_symbol_connector"
   echo
   print -P $zsh_falkline_left_side$zsh_falkline_middle$zsh_falkline_right_side
	}

# allows the command input to have a different color than the command output
# function preexec {
#    echo -n "$reset_color"
# }

# the prompt itself is is just the prompt symbol,
# since precmd() is used instead to side-step a zle bug
PROMPT=$zsh_falkline_prompt_mark
# Prompt hooks }}}
# EOF
