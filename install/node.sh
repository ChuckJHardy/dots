brew install volta

volta install node
volta install npm

. ~/.zshrc

# Globally install with npm
packages=(
    eslint
    markdownlint-cli
    tldr
    vtop
    sst
)

npm install -g "${packages[@]}"

