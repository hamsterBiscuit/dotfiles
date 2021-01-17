#
# zsh prompt
#

# theme color
export THEME_COLOR='green'
export THEME_COLOR_BG_JOBS='14'

# newline character, if needed
NEWLINE=$'\n'

# transient right-prompt
setopt TRANSIENT_RPROMPT

# prompt substitution
setopt PROMPT_SUBST

RIGHT_BG='8'
RIGHT_FG='7'

# parts of the left prompt
LEFT_SECTION='${IN_GIT}'
RIGHT_SECTION='%2~'

# {exit code}
export RPROMPT='%1(j.%F{$THEME_COLOR_BG_JOBS}.%F{$THEME_COLOR}){%f%?%1(j.%F{$THEME_COLOR_BG_JOBS}.%F{$THEME_COLOR})}%f'

precmd() {
	IN_GIT=$(git rev-parse --is-inside-work-tree >/dev/null 2>&1 && echo "" || echo "")
	export PROMPT='%k%1(j.%F{$THEME_COLOR_BG_JOBS}.%F{$THEME_COLOR})%F{0}%1(j.%K{$THEME_COLOR_BG_JOBS}.%K{$THEME_COLOR})${IN_GIT}%K{$RIGHT_BG}%1(j.%F{$THEME_COLOR_BG_JOBS}.%F{$THEME_COLOR})%F{$RIGHT_FG} ${RIGHT_SECTION}%F{$RIGHT_BG}%k%f '
}
