# Install cask packages

apps=(
    dropbox
    proton-drive
    raycast
    github
    docker
    zotero
    claude
    cursor
    vlc
    wezterm
)

brew install "${apps[@]}" --cask

