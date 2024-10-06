# Install cask packages

apps=(
    alfred
    visual-studio-code
    vlc
    wezterm
    nikitabobko/tap/aerospace
)

brew install "${apps[@]}" --cask

