# Razkaroth's NvChad Config

A config for Neovim based on [NvChad](http://nvchad.com/) tuned for my personal use.


## Main features
- LSP support with Mason-lspconfig in automode handling the language servers.
- Treesitter for syntax highlighting and code folding.
    - Treesitter extra definitions for correctly parsing mdx files.
- Angular lsp correctly working with mono-repo projects.
- Harpoon for quick navigation between files.
- Lazygit for git alchemy.

## Installation

1. Clone this repo to `~/.config/nvim`:

```bash
git clone https://github.com/Razkaroth/nvchad.git ~/.config/nvim
```

Requirements:
- Neovim (I use latest).
- Node.js
- Python3
- Make or CMake (or both)
- Ripgrep
- Fzf
- gcc



