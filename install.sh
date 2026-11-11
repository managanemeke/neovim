#!/data/data/com.termux/files/usr/bin/bash
nvim="nvim"

rm -rf "~/.config/${nvim}_backup/"
mv "~/.config/${nvim}/" "~/.config/${nvim}_backup/"

pushd "~/.config/"
git clone "https://github.com/managanemeke/neovim" "${nvim}"
cd "${nvim}"
rm -rf ".git"
popd

