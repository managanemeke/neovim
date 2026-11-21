set shell := ["nu", "-c"]

default: list

list:
  @just --list

install:
  nu -c "http get https://raw.githubusercontent.com/managanemeke/neovim/main/install.nu | save -f i.nu; nu i.nu; rm i.nu"

update:
  #!/usr/bin/env nu

  def update_neovim_configuration [] {
    let home = $env.HOME
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

    cp -r "." $"($config_nvim)"
    rm -rf $"($config_nvim)/.git"
  }
  update_neovim_configuration

