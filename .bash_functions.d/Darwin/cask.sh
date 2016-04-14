function caskupdate() {
echo "Clearing cache"
rm -rf "$(brew --cache)"
echo "Updating brew"
brew update

for app in $(brew cask list); do
    echo "Installing ${app}"
    brew cask install --appdir="/Applications" --force "${app}"
done
}
