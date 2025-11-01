# Alias
alias nvim="CC=/opt/homebrew/bin/gcc-13 nvim"
alias g="gitui"
alias ls="eza"
alias awssso="aws sso login --sso-session=habium"
alias book="cd /Users/chuckjhardy/Library/CloudStorage/ProtonDrive-me@chuckjhardy.com-folder/Obsidian/SlipBox/SlipBox"

export EDITOR=nvim
export VISUAL="$EDITOR"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# PNPM
export PNPM_HOME="/Users/chuckjhardy/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Github Helper Functions
delete_remote_branches_except_main() {
  git fetch --all

  # Loop through each remote branch and delete it if it's not main
  for branch in $(git branch -r | grep -v '\->' | grep -v 'main$' | sed 's/origin\///'); do
    git push origin --delete $branch
  done
}

delete_local_branches_except_main() {
  # Loop through each local branch and delete it if it's not main
  for branch in $(git branch | grep -v 'main$' | grep -v '\*'); do
    git branch -d $branch
  done
}

# Starship
eval "$(starship init zsh)"

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

export PATH=$PATH:$GEM_HOME/bin
eval "$(rbenv init - --no-rehash zsh)"
export PATH="$HOME/.local/bin:$PATH"
