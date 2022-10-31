# Fun Language support

This repository provides syntax support for the Fun programming language (for the Oxford course)

## Installation

### VSCode

To install this as a VSCode extension:

1. Get the Fun-Language-VSCode extension from [github](https://github.com/Mr-Helpful/Fun-Language)
2. Add the folder to your .vscode folder (in your home directory)

### Sublime Text

To install this as a Sublime Text extension:

1. Get the Fun-Language-Sublime-Text extension from [github](https://github.com/Mr-Helpful/Fun-Language)
2. In the menu bar click: Sublime Text > Preferences > Browse Packages
3. Add the folder within Fun-Language-Sublime-Text to this folder

### NeoVim

To install this as a NeoVim extension:

1. Install the NeoVim textmate library, via:

  ```sh
    git clone http://github.com/icedman/nvim-textmate
    cd nvim-textmate
    make
  ```

2. Follow the steps for VSCode

### Others

For other editors, the Fun-Language-Other folder contains the textmate language file used for syntax highlighting. The best search to go for at this point is:

> [Your-Editor] add textmate language grammar
