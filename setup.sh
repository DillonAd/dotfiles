#!/bin/zsh

if [ $(id -u) -eq 0 ]
  then echo Please do not run this script as root or using sudo!
  exit
fi

echo Getting ready to Brew...
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add brew to the path in .zshrc
echo "export PATH=/opt/homebrew/bin:$PATH" >> ~/.zshrc && source ~/.zshrc

echo Brewing...
brew bundle

echo OhMyZsh...
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Oh My Zsh Theme
sed -i .zshrc 's/ZSH_THEME=.*/ZSH_THEME=gnzh/g' ~/.zshrc || echo "ZSH_THEME=gnzh" >> ~/.zshrc

# Zsh Plugins
sed -i .zshrc 's/plugins=.*/plugins=(git docker kubectl node npm)/g' ~/.zshrc

# Append to .zshrc
cat ./.zshrc >> ~/.zshrc

for f in ./functions/*.sh
do
    echo "\n" >> ~/.zshrc
    cat $f >> ~/.zshrc
done

source ~/.zshrc

echo Docker...
wget https://desktop.docker.com/mac/main/arm64/Docker.dmg
open .
read -s -k '?Press enter to continue...'

rm Docker.dmg*

echo NPM Stuff...
npm install -g redis-commander yarn pnpm

echo Sudo Lecture...
# Replace if existing
sudo sed -i /etc/sudoers 's/Defaults[ \\t]+lecture=.*/Defaults        lecture=always/g' /etc/sudoers
sudo sed -i /etc/sudoers 's/Defaults[ \\t]+lecture_file=.*/Defaults        lecture_file=\/etc\/sudoers_lecture/g' /etc/sudoers
# Add if not replaced
sudo grep 'Defaults        lecture=always' /etc/sudoers || sudo echo 'Defaults        lecture=always' >> /etc/sudoers
sudo grep 'Defaults        lecture_file=\/etc\/sudoers_lecture' /etc/sudoers || sudo echo 'Defaults        lecture_file=\/etc\/sudoers_lecture' >> /etc/sudoers

if [ -f "/etc/sudo_lecture" ]; then
    sudo cp /etc/sudo_lecture /etc/sudo_lecture.old
fi

# Permissions are important
sudo chmod 777 /etc/sudo_lecture
sudo cat ./sudo_lecture > /etc/sudo_lecture
# Removing permissions is more important
sudo chmod 440 /etc/sudo_lecture

