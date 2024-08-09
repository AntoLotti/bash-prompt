#! bash oh-my-bash.module

OMB_PROMPT_SHOW_PYTHON_VENV=${OMB_PROMPT_SHOW_PYTHON_VENV:=false}
OMB_PROMPT_VIRTUALENV_FORMAT="${_omb_prompt_bold_purple}vitualenv:(${_omb_prompt_reset_color}%s${_omb_prompt_bold_purple}) ${_omb_prompt_reset_color}"
OMB_PROMPT_CONDAENV_FORMAT="${_omb_prompt_bold_purple}condaenv:(${_omb_prompt_reset_color}%s${_omb_prompt_bold_purple}) ${_omb_prompt_reset_color}"

#===ICONS===================================================

icon_start=""
#icon_start="❯❯"
#icon_start="╭─"

#icon_command=""
#icon_command="➜"
icon_command="❯"
#icon_command="" 
#icon_command="󱞩"

icon_user=""

icon_folder=""

icon_git="[󰊢 "

icon_ok=" 󰄬 "

icon_bad="  "

#===COLORS================================================

start_prompt="${_omb_prompt_bold_purple}${icon_start}${_omb_prompt_reset_color}"

start_command="${_omb_prompt_bold_purple}${icon_command}${_omb_prompt_reset_color}"

user="${_omb_prompt_bold_purple}${icon_user}${_omb_prompt_reset_color}"
user_name="${_omb_prompt_white}\u${_omb_prompt_reset_color}"

folder="${_omb_prompt_white}${icon_folder}${_omb_prompt_reset_color}"
directory="${_omb_prompt_bold_blue}\W${_omb_prompt_reset_color}"
#directory="${_omb_prompt_bold_blue}\w${_omb_prompt_reset_color}"

#GIT_THEME_PROMPT_PREFIX="${_omb_prompt_bold_purple} git: (${_omb_prompt_reset_color}"
GIT_THEME_PROMPT_PREFIX="${_omb_prompt_bold_purple}${icon_git}${_omb_prompt_reset_color}"

SVN_THEME_PROMPT_PREFIX="${_omb_prompt_bold_purple}svn:(${_omb_prompt_reset_color}"
HG_THEME_PROMPT_PREFIX="${_omb_prompt_bold_purple}hg:(${_omb_prompt_reset_color}"

SCM_THEME_PROMPT_SUFFIX="${_omb_prompt_bold_purple}]${_omb_prompt_reset_color}"
SCM_THEME_PROMPT_CLEAN="${_omb_prompt_bold_green}${icon_ok}${_omb_prompt_reset_color}"
SCM_THEME_PROMPT_DIRTY="${_omb_prompt_bold_red}${icon_bad}${_omb_prompt_reset_color}"


#===FUNCTIONS===========================================

#Prompt function PS1
function _omb_theme_PROMPT_COMMAND() {
 
  PS1="\n"
  PS1+="${start_prompt}[${user}  ${user_name}]-[${folder}  ${directory}] "

  local python_venv
  _omb_prompt_get_python_venv
  PS1+="${python_venv}"

  local scm_info=$(scm_prompt_info)
  PS1+="${scm_info:+$scm_info}"

  PS1+="\n ${start_command} ${_omb_prompt_normal}"
}

#===RUNS PROMT========================================
_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND


