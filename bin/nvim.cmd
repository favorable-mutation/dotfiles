@echo off
FOR /F "tokens=* USEBACKQ" %%F IN (`wsl wslpath %1`) DO (
  wt wsl zsh -c "source ~/.zshrc && cd $(dirname %%F) && /usr/bin/nvim %%F"
)