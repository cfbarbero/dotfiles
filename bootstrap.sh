#!/usr/bin/env bash

function runDots() {
    # Ask for the administrator password upfront
    sudo -v

    # Keep-alive: update existing `sudo` time stamp until the script has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    
    echo ""
    echo "------------------------------"
    echo "Installing Homebrew along with some common formulae and apps."
    echo "This might awhile to complete, as some formulae need to be installed from source."
    echo "------------------------------"
    echo ""
    ./brew.sh
    
    echo ""
    echo "------------------------------"
    echo "Set mac defaults"
    echo "------------------------------"
    echo ""
    source ./macos-settings.sh

    echo ""
    echo "------------------------------"
    echo "Set profile"
    echo "------------------------------"
    echo ""
    source ./dotfiles.sh

    echo "------------------------------"
    echo "Completed running bootstrap, restart your computer to ensure all updates take effect"
    echo "------------------------------"
}

read -p "This script may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    runDots $@
fi;

unset runDots;