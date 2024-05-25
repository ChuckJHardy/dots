brew install volta

volta install node
volta install npm

. ~/.zshrc

# Globally install with npm
packages=(
    eslint
    tldr
    vtop
)

npm install -g "${packages[@]}"

