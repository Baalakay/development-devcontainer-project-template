#!/bin/bash
set -e

echo "Setting up development environment..."

npm install -g npm@11.4.1

# Setup ZSH plugins
echo "Setting up ZSH plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/matthiasha/zsh-uv-env ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-uv-env
# Setup dotfiles
echo "Setting up dotfiles..."
git clone https://github.com/Baalakay/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow --adopt .
git reset --hard
cd $LOCAL_WORKSPACE_FOLDER

# Ensure .zshrc exists
touch ~/.zshrc

# Replace or add alias cat=batcat
if grep -q '^alias cat=' ~/.zshrc; then
  sed -i 's|^alias cat=.*|alias cat=batcat|' ~/.zshrc
else
  echo 'alias cat=batcat' >> ~/.zshrc
fi

# Add alias bat=batcat if not present
if ! grep -q '^alias bat=batcat' ~/.zshrc; then
  echo 'alias bat=batcat' >> ~/.zshrc
fi

# Install React Router 7 "Framwork Mode" (includes React-router, Vite, Typescript, Tailwinds)
# printf "n\ny\n" | npx --yes create-react-router@latest frontend
# Installs only if /frontend is empty so as not to overwrite existing work (except for /frontend/node_modules which is auto created as it's a volumen mount on the image)

if [ -d "frontend" ]; then
    # Find all files/dirs except node_modules
    non_node_modules=$(find frontend -mindepth 1 -maxdepth 1 ! -name node_modules)
    if [ -z "$non_node_modules" ]; then
        echo "frontend is empty (except node_modules), running create-react-router..."
        printf "n\ny\n" | npx --yes create-react-router@latest frontend
    else
        echo "frontend contains files other than node_modules, skipping create-react-router."
    fi
fi

# printf "y\ny\nn\n" | npx --yes create-react-router@latest frontend

# Install frontend dependencies if frontend exists
if [ -d "frontend" ]; then
    echo "frontend folder exists, running npm install..."
    cd frontend
    npm install
    cd ..
fi

# If requirements.txt exists (e.g., by using pip instead of uv) Set up Python virtual environment and install dependencies
uv sync
if [ -f "requirements.txt" ]; then
    uv pip install -r requirements.txt
fi

echo "Development environment setup complete! Launch a new terminal session to begin in your devcontainer."

