#!/usr/bin/env nu

let home = $nu.home-dir
let share = $"($home)/.local/share"
let nvim = "nvim"
let config = $"($home)/.config"
let config_nvim = $"($config)/($nvim)"

def create_backup [] {
  let source = $config_nvim
  let destination = $"($config)/($nvim)_backup/"
  rm -rf $"($destination)"
  if ($source | path exists) {
    mv $"($source)" $"($destination)"
  }
}
create_backup

if not ($config | path exists) {
  mkdir $"($config)"
}
cd $"($config)"
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

