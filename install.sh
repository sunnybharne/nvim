#!/bin/bash
where is the main application where there is no need of the main applciaton where are we even going out from here are we even thinking of doing anything like that 

# FIXME: add the split functionality.
# FIXME: learn to use copilot cli with neovim rather than using vscode.
# FIXME: make sure to use some pair plugin which bisually shows the open and close pairs.
# FIXME: Add some sore of error showing mechanism.
# FIXME: Add configuration for bicep and document it in some sort of readme file.
# FIXME: Add configuration for terraform and document it in some sort of readme file.
# FIXME: Add configuration for typescript
# FIXME: Add configuration for python
# FIXME: Add configuration for c#

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for the current session
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    
    echo "✓ Homebrew installed successfully!"
else
    echo "✓ Homebrew is already installed"
fi

# Install Git if not already installed
if ! command -v git &> /dev/null; then
    echo "Installing Git..."
    brew install git
    echo "✓ Git installed successfully!"
    echo "ℹ️  Don't forget to configure Git with:"
    echo "   git config --global user.name 'Your Name'"
    echo "   git config --global user.email 'your.email@example.com'"
else
    echo "✓ Git is already installed"
fi

# Install Neovim (ensure latest version for Sidekick.nvim compatibility)
if ! command -v nvim &> /dev/null; then
    echo "Installing Neovim..."
    brew install neovim
    echo "✓ Neovim installed successfully!"
else
    # Check if Neovim version is >= 0.11.2 (required for Sidekick.nvim)
    NVIM_VERSION=$(nvim --version | head -1 | cut -d' ' -f2 | sed 's/v//')
    REQUIRED_VERSION="0.11.2"
    
    # Simple version comparison
    if [[ "$(printf '%s\n' "$REQUIRED_VERSION" "$NVIM_VERSION" | sort -V | head -n1)" = "$REQUIRED_VERSION" ]]; then
        echo "✓ Neovim $NVIM_VERSION is installed (meets Sidekick.nvim requirements)"
    else
        echo "⚠️  Upgrading Neovim from $NVIM_VERSION to latest (Sidekick.nvim requires >= $REQUIRED_VERSION)..."
        brew upgrade neovim
        UPDATED_VERSION=$(nvim --version | head -1 | cut -d' ' -f2 | sed 's/v//')
        echo "✓ Neovim upgraded to $UPDATED_VERSION!"
    fi
fi

# Install GitHub CLI
if ! command -v gh &> /dev/null; then
    echo "Installing GitHub CLI..."
    brew install gh
    echo "✓ GitHub CLI installed successfully!"
    echo "ℹ️  To authenticate with GitHub, run: gh auth login"
    echo "ℹ️  This will enable GitHub Copilot CLI and other GitHub integrations"
else
    echo "✓ GitHub CLI is already installed"
    # Check if user is authenticated
    if ! gh auth status &> /dev/null; then
        echo "ℹ️  GitHub CLI is not authenticated. Run: gh auth login"
    else
        echo "✓ GitHub CLI is authenticated"
    fi
fi

# Install GitHub Copilot CLI
echo "Setting up GitHub Copilot CLI..."
if ! command -v gh &> /dev/null; then
    echo "⚠️  GitHub CLI is required for Copilot CLI. Installing it first..."
else
    # Check if Copilot extension is installed
    if ! gh extension list | grep -q "github/gh-copilot"; then
        echo "Installing GitHub Copilot CLI extension..."
        if gh extension install github/gh-copilot; then
            echo "✓ GitHub Copilot CLI installed successfully!"
            echo "ℹ️  Use 'gh copilot suggest' and 'gh copilot explain' commands"
            echo "ℹ️  Available in Neovim via Sidekick.nvim with <leader>ag"
        else
            echo "⚠️  Failed to install Copilot CLI. Make sure you're authenticated with 'gh auth login'"
            echo "ℹ️  You can install it manually later with: gh extension install github/gh-copilot"
        fi
    else
        echo "✓ GitHub Copilot CLI extension is already installed"
    fi
fi

# Install Node.js (required for many CLI tools)
if ! command -v node &> /dev/null; then
    echo "Installing Node.js..."
    brew install node
    echo "✓ Node.js installed successfully!"
else
    echo "✓ Node.js is already installed"
fi

# Install additional AI CLI tools (optional)
echo "Installing additional AI CLI tools..."

# Claude CLI (optional)
if ! command -v claude &> /dev/null; then
    echo "Installing Claude CLI..."
    if command -v npm &> /dev/null; then
        if npm install -g @anthropic-ai/claude-code 2>/dev/null; then
            echo "✓ Claude CLI installed successfully!"
        else
            echo "ℹ️  Claude CLI installation failed (this is optional)"
            echo "ℹ️  You can install it manually with: npm install -g @anthropic-ai/claude-code"
        fi
    else
        echo "ℹ️  Skipping Claude CLI (npm not available)"
    fi
else
    echo "✓ Claude CLI is already installed"
fi

# Install/Update Zsh
if ! command -v zsh &> /dev/null; then
    echo "Installing Zsh..."
    brew install zsh
    echo "✓ Zsh installed successfully!"
else
    echo "✓ Zsh is already installed"
fi

# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo "✓ Oh My Zsh installed successfully!"
else
    echo "✓ Oh My Zsh is already installed"
fi

# Setup .zshrc symlink
echo "Setting up .zshrc symlink..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Backup existing .zshrc if it exists and is not a symlink
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    echo "Backing up existing .zshrc to .zshrc.backup"
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

# Remove existing symlink if it exists
if [ -L "$HOME/.zshrc" ]; then
    rm "$HOME/.zshrc"
fi

# Create symlink to your dotfiles .zshrc
ln -s "$SCRIPT_DIR/dotfiles/.zshrc" "$HOME/.zshrc"
echo "✓ .zshrc symlinked to dotfiles!"

# Set zsh as default shell if it isn't already
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Setting zsh as default shell..."
    chsh -s $(which zsh)
    echo "✓ Zsh set as default shell"
else
    echo "✓ Zsh is already the default shell"
fi

# Install Nerd Fonts for proper icon display in Neovim
echo "Installing Nerd Fonts..."
if ! brew list --cask font-meslo-lg-nerd-font &> /dev/null; then
    echo "Installing MesloLGS Nerd Font..."
    brew tap homebrew/cask-fonts
    brew install --cask font-meslo-lg-nerd-font
    echo "✓ MesloLGS Nerd Font installed successfully!"
else
    echo "✓ MesloLGS Nerd Font is already installed"
fi

# Install additional popular Nerd Fonts
NERD_FONTS=(
    "font-fira-code-nerd-font"
    "font-jetbrains-mono-nerd-font" 
    "font-hack-nerd-font"
    "font-sauce-code-pro-nerd-font"
)

for font in "${NERD_FONTS[@]}"; do
    if ! brew list --cask "$font" &> /dev/null; then
        echo "Installing $font..."
        brew install --cask "$font"
        echo "✓ $font installed successfully!"
    else
        echo "✓ $font is already installed"
    fi
done

# Install tmux
if ! command -v tmux &> /dev/null; then
    echo "Installing tmux..."
    brew install tmux
    echo "✓ tmux installed successfully!"
else
    echo "✓ tmux is already installed"
fi

# Setup tmux configuration symlink
echo "Setting up tmux configuration symlink..."

# Backup existing .tmux.conf if it exists and is not a symlink
if [ -f "$HOME/.tmux.conf" ] && [ ! -L "$HOME/.tmux.conf" ]; then
    echo "Backing up existing .tmux.conf to .tmux.conf.backup"
    mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.backup"
fi

# Remove existing symlink if it exists
if [ -L "$HOME/.tmux.conf" ]; then
    rm "$HOME/.tmux.conf"
fi

# Create symlink to your dotfiles .tmux.conf
ln -s "$SCRIPT_DIR/dotfiles/.tmux.conf" "$HOME/.tmux.conf"
echo "✓ .tmux.conf symlinked to dotfiles!"

# Setup Ghostty configuration symlink
echo "Setting up Ghostty configuration symlink..."

# Backup existing .ghostty if it exists and is not a symlink
if [ -f "$HOME/.ghostty" ] && [ ! -L "$HOME/.ghostty" ]; then
    echo "Backing up existing .ghostty to .ghostty.backup"
    mv "$HOME/.ghostty" "$HOME/.ghostty.backup"
fi

# Remove existing symlink if it exists
if [ -L "$HOME/.ghostty" ]; then
    rm "$HOME/.ghostty"
fi

# Create symlink to your dotfiles .ghostty
ln -s "$SCRIPT_DIR/dotfiles/.ghostty" "$HOME/.ghostty"
echo "✓ .ghostty symlinked to dotfiles!"

# Install Ghostty
if ! ls /Applications/Ghostty.app &> /dev/null; then
    echo "Installing Ghostty..."
    brew install --cask ghostty
    echo "✓ Ghostty installed successfully!"
else
    echo "✓ Ghostty is already installed"
fi

# Verify Ghostty installation and setup command line access
if [ -f "/Applications/Ghostty.app/Contents/MacOS/ghostty" ]; then
    echo "Setting up Ghostty command line tool..."
    
    # Create symlink for command line access (using homebrew's bin directory)
    if [ ! -f "/opt/homebrew/bin/ghostty" ]; then
        ln -sf /Applications/Ghostty.app/Contents/MacOS/ghostty /opt/homebrew/bin/ghostty
        echo "✓ Ghostty command line tool linked"
    else
        echo "✓ Ghostty command line tool already available"
    fi
else
    echo "⚠️  Ghostty app not found. Reinstalling..."
    brew uninstall --cask ghostty 2>/dev/null || true
    brew install --cask ghostty
fi

# Setup Ghostty configuration
echo "Setting up Ghostty configuration..."
GHOSTTY_CONFIG_DIR="$HOME/.config/ghostty"

# Create the ghostty config directory if it doesn't exist
mkdir -p "$GHOSTTY_CONFIG_DIR"

# Backup existing config if it exists and is not a symlink
if [ -f "$GHOSTTY_CONFIG_DIR/config" ] && [ ! -L "$GHOSTTY_CONFIG_DIR/config" ]; then
    echo "Backing up existing Ghostty config to config.backup"
    mv "$GHOSTTY_CONFIG_DIR/config" "$GHOSTTY_CONFIG_DIR/config.backup"
fi

# Remove existing symlink if it exists
if [ -L "$GHOSTTY_CONFIG_DIR/config" ]; then
    rm "$GHOSTTY_CONFIG_DIR/config"
fi

# Create symlink to your dotfiles .ghostty (note: links to ~/.ghostty which is already symlinked)
ln -s "$HOME/.ghostty" "$GHOSTTY_CONFIG_DIR/config"
echo "✓ Ghostty config symlinked to dotfiles!"

# Verify installation
if [ -f "/Applications/Ghostty.app/Contents/MacOS/ghostty" ]; then
    echo "✓ Ghostty configured with Tokyo Night theme and Nerd Fonts!"
    echo "ℹ️  Launch Ghostty from Applications or run 'ghostty' in terminal"
else
    echo "⚠️  Warning: Ghostty installation may have issues. Try manual installation."
fi

# Install Visual Studio Code
if ! command -v code &> /dev/null && ! ls /Applications/Visual\ Studio\ Code.app &> /dev/null; then
    echo "Installing Visual Studio Code..."
    brew install --cask visual-studio-code
    echo "✓ Visual Studio Code installed successfully!"
else
    echo "✓ Visual Studio Code is already installed"
fi

# Install Aerospace
if ! command -v aerospace &> /dev/null && ! ls /Applications/AeroSpace.app &> /dev/null; then
    echo "Installing Aerospace..."
    brew install --cask nikitabobko/tap/aerospace
    echo "✓ Aerospace installed successfully!"
else
    echo "✓ Aerospace is already installed"
fi

# Start Aerospace and set it to launch at login
if ls /Applications/AeroSpace.app &> /dev/null; then
    echo "Starting Aerospace..."
    open /Applications/AeroSpace.app
    
    # Add Aerospace to login items
    osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/AeroSpace.app", hidden:false}'
    echo "✓ Aerospace started and added to login items"
fi

echo ""
echo "🎉 Installation complete!"
echo ""
echo "📋 Next steps:"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. Open Neovim and run: :checkhealth"
echo "3. Test Sidekick.nvim AI integration:"
echo "   - Open a file in Neovim"
echo "   - Press <space>aa to toggle AI CLI"
echo "   - Press <space>ag for GitHub Copilot CLI"
echo "   - Press <space>ac for Claude CLI (if installed)"
echo "4. Authenticate with GitHub: gh auth login"
echo "5. Configure Git if needed:"
echo "   git config --global user.name 'Your Name'"
echo "   git config --global user.email 'your.email@example.com'"
echo ""
echo "🤖 AI Tools Available:"
echo "- GitHub Copilot CLI: gh copilot suggest|explain"
echo "- Sidekick.nvim: <space>aa (toggle AI CLI in Neovim)"
echo "- Claude CLI: claude (if installed)"
echo ""
echo "📚 Learn more:"
echo "- Sidekick.nvim: https://github.com/folke/sidekick.nvim" 
echo "- Exercises: Check exercises/ folder for detailed guides"
echo ""
