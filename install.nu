#!/usr/bin/env nu

def nvim-path [kind: string] {
  let command = ('lua io.write(vim.fn.stdpath("' + $kind + '"))')
  ^nvim --headless -u NONE -i NONE -c $command -c qa
}

def clone-config [checkout: path] {
  ^git clone https://github.com/managanemeke/neovim $checkout
  rm -r ($checkout | path join .git)
}

def ensure-packer [packer: path] {
  if ($packer | path exists) { return }
  mkdir ($packer | path dirname)
  ^git clone --depth 1 https://github.com/wbthomason/packer.nvim $packer
}

def backup-config [config: path] {
  let backup = $'($config)_backup-(date now | format date "%Y%m%d-%H%M%S-%f")'
  mv $config $backup
  print $'Previous configuration moved to ($backup)'
}

# Load the plugin list without running settings that require uninstalled plugins.
def sync-plugins [] {
  (^nvim --headless -u NONE -i NONE -c 'autocmd User PackerComplete quitall'
    -c 'lua vim.opt.runtimepath:prepend(vim.fn.stdpath("config")); require("plugins")'
    -c 'PackerSync')
}

let config = (nvim-path config | str trim)
let data = (nvim-path data | str trim)
let config_parent = ($config | path dirname)
let packer = ($data | path join site pack packer start packer.nvim)

mkdir $config_parent
let staging = (mktemp -d -p $config_parent 'nvim-install.XXXXXXXX')
let checkout = ($staging | path join config)
clone-config $checkout
ensure-packer $packer

if ($config | path exists) { backup-config $config }
mv $checkout $config
rm $staging

sync-plugins
print 'Packer installed and synced.'
