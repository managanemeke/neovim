set shell := ["nu", "-c"]

default: list

list:
  @just --list

install:
  nu -c "http get https://raw.githubusercontent.com/managanemeke/neovim/main/install.nu | save -f i.nu; nu i.nu; rm i.nu"

