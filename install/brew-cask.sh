# Install cask packages

apps=(
    dropbox
    proton-drive
    raycast
    steam
    github
    docker
    zotero
    claude
    visual-studio-code
    vlc
    wezterm
)

brew install "${apps[@]}" --cask

