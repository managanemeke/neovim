#!/data/data/com.termux/files/usr/bin/bash
nvim="nvim"

rm -rf "$HOME/.config/${nvim}_backup/"
mv "$HOME/.config/${nvim}/" "$HOME/.config/${nvim}_backup/"

pushd "$HOME/.config/"
git clone "https://github.com/managanemeke/neovim" "${nvim}"
cd "${nvim}"
rm -rf ".git"
popd

