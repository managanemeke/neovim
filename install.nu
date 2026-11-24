#!/usr/bin/env nu

let home = ~
let share = $"($home)/.local/share"
let nvim = "nvim"

rm -rf $"($home)/.config/($nvim)_backup/"
mv $"($home)/.config/($nvim)/" $"($home)/.config/($nvim)_backup/"

cd $"($home)/.config/"
git clone "https://github.com/managanemeke/neovim" $nvim
cd $nvim
rm -rf ".git"
cd -

def install_packer [] {
  let start = $"($share)/nvim/site/pack/packer/start"
  let target = $"($start)/packer.nvim"
  rm -rf $target
  git clone --depth 1 https://github.com/wbthomason/packer.nvim $target
  if $env.LAST_EXIT_CODE != 0 { return 1 }
  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
  echo "Packer installed and synced."
}
install_packer

