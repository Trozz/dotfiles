function setupmacwifi() {
  echo "Setup Wifi"
  /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport scan | awk '{print $1}'

  read wifi_name -p "Wifi to connect to: "
  read wifi_pass -p "Wifi Password: "

  networksetup -setairportnetwork en0 $wifi_name $wifi_pass
}

function npminstall() {
  # Node
  node=(
   bower
   david
   generator-angular
   generator-dashing-go
   generator-footguard
   generator-frontend
   generator-hubot
   generator-karma
   generator-meanjs
   generator-server-configs
   grunt
   grunt-cli
   is-online
   is-up
   license-checker
   nodemon
   public-ip
   react-ui-builder
   sparkly
   vtop
   wifi-password
   yo
  )
  echo "installing node apps..."
  sudo npm install -g ${node[@]}
}

function brewinstall() {
  # Brew Apps
  brew=(
   asciinema
   byobu
   caskroom/cask/brew-cask
   coreutils
   dnsmap
   dnstop
   dnstracer
   findutils
   git
   go
   graphicsmagick
   htop-osx
   httpie
   keybase
   lastpass-cli
   mackup
   mytop
   namebench
   npm
   packer
   python
   python3
   ssh-copy-id
   sshpass
   stoken
   vault
   vault-cli
   wget
   yubico-piv-tool
  )

  echo "installing brew binaries..."
  brew install ${brew[@]}
}

function caskinstall() {
  # Cask Apps
  cask=(
   alfred
   atom
   bartender
   caffeine
   dropbox
   evernote
   flash
   google-chrome
   growl-fork
   istat-menus
   iterm2
   java
   lastpass
   macdown
   osxfuse
   quassel-client
   shuttle
   skype
   slack
   sourcetree
   the-unarchiver
   vagrant
   vagrant-manager
   virtualbox
   vlc
   whatsapp
   yasu
  )

  echo "installing cask binaries..."
  brew cask install --appdir="/Applications" ${cask[@]}
}

function fontinstall() {
  # Fonts
  fonts=(
    font-clear-sans
    font-m-plus
    font-roboto
  )

  # install fonts
  echo "installing fonts..."
  brew cask install ${fonts[@]}
}

function pipinstall() {
  # Install python apps
  pip=(
   requests==2.6.0
   ansible
   python-novaclient
   supernova
   rackspace-novaclient
   pep8
   -i https://hammercloud.rackspace.com/simple hammercloud
   -i https://hammercloud.rackspace.com/simple overtime
   http://hammertime.me/hammertime.tgz
  )
  echo "installing pip apps..."
  sudo pip install ${pip[@]}
}

function macinstall(){
  echo "Hide the Time Machine"
  for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
    defaults write "${domain}" dontAutoLoad -array \
      "/System/Library/CoreServices/Menu Extras/TimeMachine.menu"
  done

  echo "Disabling OS X Gate Keeper"
  echo "(You'll be able to install any app you want from here on, not just Mac App Store apps)"
  sudo spctl --master-disable
  sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
  defaults write com.apple.LaunchServices LSQuarantine -bool false

  echo "Expanding the save panel by default"
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

  echo "Automatically quit printer app once the print jobs complete"
  defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

  echo "Saving to disk (not to iCloud) by default"
  defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

  echo "Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window"
  sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

  echo "Check for software updates daily, not just once per week"
  defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

  echo "Disable smart quotes and smart dashes as they're annoying when typing code"
  defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

  echo "Increasing sound quality for Bluetooth headphones/headsets"
  defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

  echo "Turn off keyboard illumination when computer is not used for 5 minutes"
  defaults write com.apple.BezelServices kDimTime -int 300

  echo "Requiring password immediately after sleep or screen saver begins"
  defaults write com.apple.screensaver askForPassword -int 1
  defaults write com.apple.screensaver askForPasswordDelay -int 0

  echo "Enabling subpixel font rendering on non-Apple LCDs"
  defaults write NSGlobalDomain AppleFontSmoothing -int 2

  echo "Enable HiDPI display modes (requires restart)"
  sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

  echo "Showing icons for hard drives, servers, and removable media on the desktop"
  defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

  echo "Showing all filename extensions in Finder by default"
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  echo "Showing status bar in Finder by default"
  defaults write com.apple.finder ShowStatusBar -bool true

  echo "Allowing text selection in Quick Look/Preview in Finder by default"
  defaults write com.apple.finder QLEnableTextSelection -bool true

  echo "Displaying full POSIX path as Finder window title"
  defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

  echo "Disabling the warning when changing a file extension"
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

  echo "Use column view in all Finder windows by default"
  defaults write com.apple.finder FXPreferredViewStyle Clmv

  echo "Avoiding the creation of .DS_Store files on network volumes"
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

  echo "Disabling disk image verification"
  defaults write com.apple.frameworks.diskimages skip-verify -bool true
  defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
  defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

  echo "Enabling snap-to-grid for icons on the desktop and in other icon views"
  /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

  echo "Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
  defaults write com.apple.dock tilesize -int 36

  echo "Speeding up Mission Control animations and grouping windows by application"
  defaults write com.apple.dock expose-animation-duration -float 0.1
  defaults write com.apple.dock "expose-group-by-app" -bool true

  echo "Setting Dock to auto-hide and removing the auto-hiding delay"
  defaults write com.apple.dock autohide -bool true
  defaults write com.apple.dock autohide-delay -float 0
  defaults write com.apple.dock autohide-time-modifier -float 0

  echo "Setting email addresses to copy as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app"
  defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

  echo "Preventing Time Machine from prompting to use new hard drives as backup volume"
  defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

  echo "Disabling local Time Machine backups"
  hash tmutil &> /dev/null && sudo tmutil disablelocal

  echo "Removing duplicates in the 'Open With' menu"
  /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

  echo "Privacy: Don't send search queries to Apple"
  defaults write com.apple.Safari UniversalSearchEnabled -bool false
  defaults write com.apple.Safari SuppressSearchSuggestions -bool true

  echo "Disable the sound effects on boot"
  sudo nvram SystemAudioVolume=" "

  echo "Disable shadow in screenshots"
  defaults write com.apple.screencapture disable-shadow -bool true

  echo "Allow installing user scripts via GitHub Gist or Userscripts.org"
  defaults write com.google.Chrome ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"

  echo "Symlink java directory"
  ln -s ~/Library/Application Support/Oracle/Java/ ~/.java
}

function atomsource() {
  echo "Build ATOM from source"
  git clone https://github.com/atom/atom
  cd atom

  git fetch -p
  git checkout $(git describe --tags `git rev-list --tags --max-count=1`)

  echo "Running ATOM build scripts"
  script/build

  echo "Installing ATOM"
  sudo script/grunt install

  cd ~
  echo "Removing ATOM source"
  rm -rf ~/atom
}

function debianinstall() {
  user=`whoami`
  if [[ "$user" != 'root' ]]; then
    if test ! $(which sudo); then
      echo "Installing sudo and adding passwordless user, you will be prompted for the root password."
      su - root -c "apt-get install -y sudo; echo '$user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers"
      exit
    fi
  fi
  echo "Running update"
  sudo apt-get update -qqq

  echo "Upgrading software"
  sudo apt-get upgrade -y -qqq

  aptinstall=(
    wget
    python
    python-devel
    python-setuptools
    curl
    build-essential
    git
    terminator
  )
  echo "Installing common applications"
  sudo apt-get install -y -qqq ${aptinstall[@]}

  echo "Installing NodeJS + Repo"
  curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash -
  sudo apt-get install -y -qqq nodejs

  echo "Installing PIP (easy_install)"
  sudo easy_install pip


}

function rhelinstall() {
  echo "rhel setup"
}

function serversetup() {
  echo "server setup..."
}

function machinesetup() {

  if [[ "$1" == "server" ]]; then
    serversetup
    exit
  fi

  platform=`uname`

  read -p "Press [Enter] key to start setup..."

  if [[ "$platform" == 'Darwin' ]]; then
    setupmacwifi

    # Check for Homebrew,
    # Install if we don't have it
    if test ! $(which brew); then
      echo "Installing homebrew..."
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    # Update homebrew recipes
    brew update

    # Install more recent versions of some OS X tools
    brew tap homebrew/dupes
     homebrew/dupes/grep

    brewinstall
    caskinstall

    brew cleanup
    brew cask cleanup

    brew tap caskroom/fonts

    fontinstall

    macinstall

  elif [[ "$platform" == 'Linux' ]]; then
    if test ! $(which apt); then
      debianinstall
    elif test ! $(which yum); then
      rhelinstall
    fi
    atomsource

  else
    echo "I haven't been written for this OS..."
    read -p "Press [Enter] to exit"
    exit
  fi

  npminstall

  pipinstall

  read -p "Press [Enter] key once Dropbox has been configured..."

  mackup restore

  read -p "Press [Enter] key to restart"
  sudo shutdown -r now
}
