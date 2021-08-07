#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg


# Check for conda and install if we don't have it
if test ! $(which conda); then
  curl -fsSLo Miniforge3.sh https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-$(uname -m).sh
  /bin/bash Miniforge3.sh -b
  rm -rf Miniforge3.sh
  export PATH=$HOME/anaconda/bin:$PATH
  
  conda init "$(basename "${SHELL}")"

  # Install basic data science stack into default environment
  conda install --yes pandas scipy numpy matplotlib seaborn
  
  # Removes .condarc from $HOME (if it exists) and symlinks the .condarc file from the .dotfiles
  # .condarc file currently not supported by mackup
  rm -rf $HOME/.condarc
  ln -s $HOME/.dotfiles/.condarc $HOME/.condarc
fi

# Check for Poetry and install if we don't have it
if test ! $(which poetry); then
  curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -
  source $HOME/.poetry/env
fi
