# Alex's Neovim Setup

This is my repository, for my custom `Neovim` setup. You can find all interesting files in the
lua folder. It also includes a divider plugin, which inserts dividers for multiple languages.

# Installation

Install `Homebrew`

Install `fzf`, `ripgrep` and `batcat`

    brew install fzf ripgrep bat

**When running under WSL2 install win32yank for clipboard support**

    winget install win32yank

# Interesting Keybindings

## Generic

| Shortcut          | Description                                                                  |
|-------------------|------------------------------------------------------------------------------|
| <leader>A         | Align with complete regex string                                             |
| <C-u>/<C-d>       | Scroll in autocomplete docs window                                           |

## Navigation

| Shortcut          | Description                                                                  |
|-------------------|------------------------------------------------------------------------------|
| <C-i>             | Go to last cursor position                                                   |
| <C-o>             | Go to previous cursor position                                               |

## Git

| Shortcut          | Description                                                                  |
|-------------------|------------------------------------------------------------------------------|
| <leader>gp        | Preview hunk                                                                 |
| <leader>gs        | Git stage hunk                                                               |
| <leader>gb        | Git blame line                                                               |
| <leader>gB        | Toggle Git blame line                                                        |
| <leader>gd        | Diff this                                                                    |
| <leader>ghf       | Git show file history                                                        |
| <leader>ght       | Git show total history                                                       |
| <leader>ghc       | Git show difference to commit under cursor                                   |
| <leader>ghs       | Checkout to commit under cursor                                              |

## Telescope & LSP

| Shortcut          | Description                                                                  |
|-------------------|------------------------------------------------------------------------------|
| <C-f>             | Find files                                                                   |
| <C-l>             | Find all language server references with telescope                           |
| <leader>ra        | Find all language server references                                          |
| <leader><C-g>     | Get all commits with telescope                                               |
| <leader><C-s>     | Get git status with telescope                                                |
| <leader><C-b>     | Get git branches with telescope                                              |
| <leader><C-s>     | Get git status with telescope                                                |
| <leader><C-S>     | Get git stash with telescope                                                 |
| <leader><C-t>     | Get tree sitter symbols with telescope                                       |
| <C-u>             | Scroll up in telescope                                                       |
| <C-d>             | Scroll down in telescope                                                     |
