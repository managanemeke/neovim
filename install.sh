#!/data/data/com.termux/files/usr/bin/bash
share="$HOME/.local/share"
nvim="nvim"

rm -rf "$HOME/.config/${nvim}_backup/"
mv "$HOME/.config/${nvim}/" "$HOME/.config/${nvim}_backup/"

pushd "$HOME/.config/"
git clone "https://github.com/managanemeke/neovim" "${nvim}"
cd "${nvim}"
rm -rf ".git"
popd

install_packer() {
  local start="${share}/nvim/site/pack/packer/start"
  local target="${start}/packer.nvim"
  rm -rf "${target}"
  git clone --depth 1 \
    https://github.com/wbthomason/packer.nvim \
    "$target" \
    || return 1
  nvim --headless \
    -c 'autocmd User PackerComplete quitall' \
    -c 'PackerSync'
  echo "Packer installed and synced."
}
install_packer

