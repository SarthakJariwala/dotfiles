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
# brew update

# Install all our dependencies with bundle (See Brewfile)
# brew tap homebrew/bundle
# brew bundle

# Clone Github repositories
# ./clone.sh

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Install miniconda from conda-forge
if test ! $(which conda); then
  curl -fsSLo Miniforge3.sh https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-$(uname -m).sh
  /bin/bash Miniforge3.sh -b
fi

export PATH=$HOME/anaconda/bin:$PATH
# Install basic data science stack into default environment
conda install --yes pandas scipy numpy matplotlib seaborn

# source zshrc and then install poetry
source $HOME/.zshrc

python -V

# Install Poetry
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
