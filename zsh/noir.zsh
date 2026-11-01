# Noir zsh layer: colours, aliases, prompt.
#
# Source it at the END of your own ~/.zshrc, after oh-my-zsh.sh:
#   source /path/to/cosmic-noir-theme/zsh/noir.zsh
#
# Keep machine-specific or private lines (PATH, scaling, nvm, ...) in your
# own ~/.zshrc, not here.
#
#  bg:      #171717   fg:      #CCD0CF
#  orange:  #F25623   ember:   #F56E0F
#  sage:    #88A57D   khaki:   #AEAB94
#  grey:    #959C95   muted:   #7D837D
#  dim:     #686C69
#
# Dark terminal: orange for commands, sage for strings, khaki for links.

# ── File colours (ls, lsd file names, completion menu) ─────────────────────────

export LS_COLORS="di=1;38;2;149;156;149:ln=3;38;2;174;171;148:ex=1;38;2;242;86;35:*.zip=4;38;2;245;110;15:*.tar=4;38;2;245;110;15:*.gz=4;38;2;245;110;15:*.xz=4;38;2;245;110;15:*.7z=4;38;2;245;110;15:*.deb=4;38;2;245;110;15:*.png=38;2;125;131;125:*.jpg=38;2;125;131;125:*.jpeg=38;2;125;131;125:*.webp=38;2;125;131;125:*.gif=38;2;125;131;125:*.mp4=3;38;2;125;131;125:*.mkv=3;38;2;125;131;125:*.rs=38;2;136;165;125:*.py=38;2;136;165;125:*.js=38;2;136;165;125:*.ts=38;2;136;165;125:*.sh=38;2;136;165;125:*.md=38;2;166;173;166:*.txt=38;2;166;173;166:or=9;38;2;242;86;35"

# oh-my-zsh reads LS_COLORS before this file loads, so refresh the menu colours
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# ── zsh-autosuggestions / zsh-syntax-highlighting ──────────────────────────────

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#5E635E'

typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=#F25623'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#F25623'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#F25623'
ZSH_HIGHLIGHT_STYLES[function]='fg=#F25623'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#F25623'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#F25623,underline'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#88A57D,underline'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#959C95,bold'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#F25623,bold,underline'
ZSH_HIGHLIGHT_STYLES[path]='fg=#A6ADA6,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#F56E0F'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#F56E0F'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#7D837D'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#7D837D'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#88A57D'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#88A57D'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#88A57D'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#7D837D'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#7D837D'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#686C69'

# ── Aliases (only when the tool is installed) ──────────────────────────────────

if (( $+commands[lsd] )); then
    alias ls='lsd'
    alias la='lsd -a'
    alias ll='lsd -l'
    alias lla='lsd -la'
fi

# Debian/Ubuntu ship bat as batcat
if (( $+commands[batcat] )); then
    alias cat='batcat'
elif (( $+commands[bat] )); then
    alias cat='bat'
fi

(( $+commands[cosmic-edit] )) && alias edit='cosmic-edit'

# lazygit reads one config file; stack the rice colours (lazygit/noir.yml,
# installed by ./lazygit/install.sh) on top of your own config.yml
if (( $+commands[lazygit] )); then
    _noir_lg="${XDG_CONFIG_HOME:-$HOME/.config}/lazygit"
    if [[ -f $_noir_lg/noir.yml ]]; then
        export LG_CONFIG_FILE="$_noir_lg/noir.yml"
        [[ -f $_noir_lg/config.yml ]] && LG_CONFIG_FILE="$_noir_lg/config.yml,$LG_CONFIG_FILE"
    fi
    unset _noir_lg
fi

if (( $+commands[nvim] )); then
    alias vi='nvim'
    alias vim='nvim'
    alias v='nvim'
fi

# ── Prompt ─────────────────────────────────────────────────────────────────────

# needs ZSH_THEME="" in ~/.zshrc
(( $+commands[starship] )) && eval "$(starship init zsh)"
