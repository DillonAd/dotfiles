#!/bin/bash

echo Brewing...
brew bundle

echo OhMyZsh...
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo Docker...
wget https://desktop.docker.com/mac/main/arm64/Docker.dmg
open .

