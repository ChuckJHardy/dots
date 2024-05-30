# Alias
alias nvim="CC=/opt/homebrew/bin/gcc-13 nvim"
alias g="gitui"
alias ls="eza"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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

