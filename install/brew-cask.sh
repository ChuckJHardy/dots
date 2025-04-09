# Install cask packages

apps=(
    dropbox
    proton-drive
    raycast
    docker
    zotero
    claude
    cursor
    vlc
    wezterm
)

brew install "${apps[@]}" --cask

