#!/bin/zsh

echo Brewing...
brew bundle

echo OhMyZsh...
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sed -i .zshrc 's/THEME=.*/THEME=gnzh/g' ~/.zshrc 
sed -i .zshrc 's/plugins=.*/plugins=(git docker helm kubectl node npm python pylint)/g' ~/.zshrc

cat ./.zprofile >> ~/.zprofile
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


echo NPM Stuff...
npm install -g redis-commander yarn

echo Sudo Lecture...
# Replace if existing
sudo sed -i sudoers 's/Defaults[ \\t]+lecture=.*/Defaults        lecture=always/g' sudoers
sudo sed -i sudoers 's/Defaults[ \\t]+lecture_file=.*/Defaults        lecture_file=\/etc\/sudoers_lecture/g' sudoers
# Add if not replaced
sudo grep 'Defaults        lecture=always' sudoers || echo 'Defaults        lecture=always' >> sudoers
sudo grep 'Defaults        lecture_file=\/etc\/sudoers_lecture' sudoers || echo 'Defaults        lecture_file=\/etc\/sudoers_lecture' >> sudoers

if [ -f "/etc/sudo_lecture" ]; then
    sudo mv /etc/sudo_lecture /etc/sudo_lecture.old
fi

sudo cat ./sudo_lecture > /etc/sudo_lecture

