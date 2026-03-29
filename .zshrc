################################################################################
# macOS-dotfiles ⭐️⭐️⭐️⭐️⭐️
################################################################################

export HOMEBREW="$(brew --prefix)"
export PATH="$HOMEBREW/bin:$HOMEBREW/sbin:$PATH"

################################################################################
# ZSH Plug-ins
################################################################################

if [[ -o interactive && "${TERM:-}" != dumb ]]; then
  [[ -f "$HOMEBREW/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$HOMEBREW/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  [[ -f "$HOMEBREW/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh" ]] && source "$HOMEBREW/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
  [[ -f "$HOMEBREW/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]] && source "$HOMEBREW/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
  [[ -f "$HOMEBREW/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "$HOMEBREW/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  [[ -f "$HOMEBREW/share/zsh-you-should-use/you-should-use.plugin.zsh" ]] && source "$HOMEBREW/share/zsh-you-should-use/you-should-use.plugin.zsh"
fi

################################################################################
# GNU Shell Overrides
################################################################################

export PATH="$HOMEBREW/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW/opt/findutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW/opt/gawk/libexec/gnubin:$PATH"
export PATH="$HOMEBREW/opt/grep/libexec/gnubin:$PATH"
export PATH="$HOMEBREW/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$HOMEBREW/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="$HOMEBREW/opt/gnu-indent/libexec/gnubin:$PATH"
export PATH="$HOMEBREW/opt/gnu-which/libexec/gnubin:$PATH"

###############################################################################
# Aliases
###############################################################################

alias brew-check='brew update && brew outdated'
alias brew-clean-doctor='brew cleanup && brew doctor'
alias brew-update='brew-check && brew upgrade && brew-clean-doctor'
alias brew-update-casks='brew-check && brew upgrade --cask && brew-clean-doctor'
alias brew-update-formula='brew-check && brew upgrade --formula && brew-clean-doctor'

alias nvm-update-lts='nvm install "lts/*" --reinstall-packages-from="$(nvm current)"'

alias my-ip="curl ifconfig.io"
alias my-weather="curl wttr.in/Las+Vegas,+NV+89138"

alias ..='cd ..'
alias ...='cd ../..'
alias ll='gls --l --color -halFG'

alias df='df -lh'
alias du='du -h'
alias space='df'

alias edit='code '
alias now='date'
alias x='clear'
alias h='history'
alias ping='ping -c 3'
alias bye='logout'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"

alias restart-macos="sudo shutdown -r now"
alias clean-python="rm -rf .pytest_cache dist htmlcov venv; \
                    find . -type f -name '.coverage' -delete; \
                    find . -type d -name '__pycache__' -exec rm -rf {} +; \
                    find . -type d -name '*.egg-info' -exec rm -rf {} +"

################################################################################
# Environments
################################################################################

export PATH="$HOME/.jenv/bin:$PATH"
command -v jenv >/dev/null && eval "$(jenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW/opt/nvm/nvm.sh" ] && \. "$HOMEBREW/opt/nvm/nvm.sh"  # This loads nvm
[ -s "$HOMEBREW/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null && eval "$(pyenv init -)"

################################################################################
# Functions
################################################################################

# Get the weather for the current location
my-weather-here() {
  local coords

  coords=$(curl -s ipinfo.io/loc)
  curl "wttr.in/${coords}"
}

# Show the active git identity for the current repository.
whoami-git() {
  local name email

  name=$(git config --get user.name 2>/dev/null) || return 1
  email=$(git config --get user.email 2>/dev/null) || return 1
  printf '%s <%s>\n' "$name" "$email"
}

################################################################################
# Misc
################################################################################

if [[ -o interactive && "${TERM:-}" != dumb ]]; then
  # Start-up Information
  command -v fastfetch >/dev/null && fastfetch
  # Initialize Starship and fzf
  export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
  command -v starship >/dev/null && eval "$(starship init zsh)"
  command -v fzf >/dev/null && [[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
fi
