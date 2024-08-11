#! bash oh-my-bash.module

OMB_PROMPT_SHOW_PYTHON_VENV=${OMB_PROMPT_SHOW_PYTHON_VENV:=false}
OMB_PROMPT_VIRTUALENV_FORMAT="${_omb_prompt_bold_purple}vitualenv:(${_omb_prompt_reset_color}%s${_omb_prompt_bold_purple}) ${_omb_prompt_reset_color}"
OMB_PROMPT_CONDAENV_FORMAT="${_omb_prompt_bold_purple}condaenv:(${_omb_prompt_reset_color}%s${_omb_prompt_bold_purple}) ${_omb_prompt_reset_color}"

#===ICONS===================================================

icon_start=""

icon_command="❯"

icon_user=""

icon_folder=""

icon_box_l="["
icon_box_r="]"

#==GIT
icon_pref="-"
icon_git="󰊢 "
icon_clean=" 󰄬 "
icon_dirty="  "
icon_ahead="  "
icon_behind="  "
icon_untraked=" ? "
icon_staged="● "
icon_conflicts="  "


#==STYLES================================================

# start icon
_omb_prompt_icon_start="\[\e[38;5;214m\]"

# command icon
_omb_prompt_icon_command="\[\e[36;1m\]"

# user icon
_omb_prompt_icon_user="\[\e[38;5;214m\]"

# user name
_omb_prompt_user_name="\[\e[37;1;3m\]"

# folder icon
_omb_prompt_icon_folder="\[\e[35;1m\]"

# box icon
_omb_prompt_icon_box="\[\e[37;1m\]"

# directory
_omb_prompt_directory="\[\e[34;1m\]"

# pref icon
_omb_prompt_icon_pref="\[\e[38;5;214m\]"

# git icon
_omb_prompt_icon_git="\[\e[38;5;214m\]"

# clean icon
_omb_prompt_icon_clean="\[\x1b[32m\]"

# dirty icon
_omb_prompt_icon_dirty="\[\e[31m\]"

# ahead 
_omb_prompt_icon_ahead="\[\e[34;1m\]"

# behind icon
_omb_prompt_icon_behind="\[\e[34;1m\]"

# untraked icon
_omb_prompt_icon_untraked="\[\e[33;1m\]"

# staged icon
_omb_prompt_icon_stanged="\[\e[37;1m\]"

# conflicts icon
_omb_prompt_icon_conflict="\[\e[37;1m\]"


#===GIT STYLE==================================================

GIT_THEME_PROMPT_PREFIX="-${_omb_prompt_icon_box}${icon_box_l}${_omb_prompt_icon_git}${icon_git}${_omb_prompt_reset_color}"

SCM_THEME_PROMPT_SUFFIX="${_omb_prompt_icon_box}${icon_box_r}${_omb_prompt_reset_color}"
SCM_THEME_PROMPT_CLEAN="${_omb_prompt_icon_clean}${icon_clean}${_omb_prompt_reset_color}"
SCM_THEME_PROMPT_DIRTY="${_omb_prompt_icon_dirty}${icon_dirty}${_omb_prompt_reset_color}"
SCM_THEME_PROMPT_AHEAD="${_omb_prompt_icon_ahead}${icon_ahead}${_omb_prompt_reset_color} "
SCM_THEME_PROMPT_BEHIND="${_omb_prompt_icon_behind}${icon_behind}${_omb_prompt_reset_color}"
SCM_THEME_PROMPT_UNTRACKED="${_omb_prompt_icon_untraked}${icon_untracked}${_omb_prompt_reset_color}"
SCM_THEME_PROMPT_STAGED="${_omb_prompt_icon_staged}${icon_staged}${_omb_prompt_reset_color}"
SCM_THEME_PROMPT_CONFLICTS="${_omb_prompt_icon_conflicts}${icon_conflicts}${_omb_prompt_reset_color}"

#===


#===PROMPTS STYLE==============================================

start_prompt="${_omb_prompt_icon_start}${icon_start}${_omb_prompt_reset_color}"

user_symbol="${_omb_prompt_icon_user}${icon_user}${_omb_prompt_reset_color}"
user_name="${_omb_prompt_user_name}\u${_omb_prompt_reset_color}"

folder="${_omb_prompt_icon_folder}${icon_folder}${_omb_prompt_reset_color}"
directory="${_omb_prompt_directory}\W${_omb_prompt_reset_color}"

box_r="${_omb_prompt_icon_box}${icon_box_r}${_omb_prompt_reset_color}"
box_l="${_omb_prompt_icon_box}${icon_box_l}${_omb_prompt_reset_color}"

start_command="${_omb_prompt_icon_command}${icon_command}${_omb_prompt_reset_color}"

SVN_THEME_PROMPT_PREFIX="${_omb_prompt_bold_purple}svn:[${_omb_prompt_reset_color}"
HG_THEME_PROMPT_PREFIX="${_omb_prompt_bold_purple}hg:[${_omb_prompt_reset_color}"


#===FUNCTIONS================================================

#Prompt function PS1
function _omb_theme_PROMPT_COMMAND() {
 
  PS1="\n"
  PS1+="${start_prompt}[${user_symbol}  ${user_name}]-[${folder}  ${directory}]"

  local python_venv
  _omb_prompt_get_python_venv
  PS1+="${python_venv}"

  local scm_info=$(scm_prompt_info)
  PS1+="${scm_info:+$scm_info}"

  PS1+="\n ${start_command} ${_omb_prompt_normal}"
}

#===RUNS PROMT==============================================
_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND


