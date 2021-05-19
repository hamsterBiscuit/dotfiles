# Enviroment variables

# You may need to manually set your language environment
export LANG=en_US.UTF-8

#Homebrew's sbin
export PATH="/usr/local/sbin:$PATH"

if [ -d "$HOME/.dotfiles" ]; then
  export DOTFILES_DIR="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return
fi

export PATH="$DOTFILES_DIR/bin:$PATH"

# Go
export GOPATH="$HOME/workspace"
export GO111MODULE="on"
export PATH=$PATH:$HOME/workspace/bin
export PATH=$PATH:$HOME/workstation/vim/magit-nvim/bin
export PATH=$PATH:/usr/local/go/bin
export GOPROXY=https://goproxy.cn

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Editor
export EDITOR="nvim"
export GIT_EDITOR="nvim"
export REACT_EDITOR="nvim"

# Yabai
export YABAI_CERT=yabai-cert

export PATH="/usr/local/opt/llvm/bin:$PATH"

# Bat
export BAT_THEME="TwoDark"

# Fzf
export FZF_COMPLETION_TRIGGER='**'
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_DEFAULT_OPTS='--height 90% --layout reverse --border --color "border:#b877db" --preview="bat --color=always {}"'

# node
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
