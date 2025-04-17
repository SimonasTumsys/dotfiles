
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

# Set up platform-dependent paths
if [[ "$(uname)" == "Darwin" ]]; then
  # macOS paths (only Homebrew by default)
  export PATH="/opt/homebrew/bin:$PATH"
elif [[ "$(uname)" == "Linux" ]]; then
  # Linux paths (only user-local binaries by default)
  export PATH="$HOME/.local/bin:$PATH"
fi

# Initialize the Starship prompt
eval "$(starship init zsh)"

# Check and install zsh-autosuggestions if not already installed
if [ ! -d "$HOME/.zsh/plugins/zsh-autosuggestions" ]; then
  echo "Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.zsh/plugins/zsh-autosuggestions"
fi

# Check and install zsh-syntax-highlighting if not already installed
if [ ! -d "$HOME/.zsh/plugins/zsh-syntax-highlighting" ]; then
  echo "Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/plugins/zsh-syntax-highlighting"
fi

# Source the plugins if they're installed
source "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# History settings
HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000
setopt inc_append_history

# Enable Zsh completions
autoload -Uz compinit && compinit

