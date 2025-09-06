# Dotfiles

Modern dotfiles setup for macOS using automated symlinks and package management.

## Quick Setup

For a new Mac, run these two commands and you're done:

```bash
git clone https://github.com/jairojair/dotfiles.git .
make setup
make install
```

That's it! Your development environment is ready. 🎉

## Commands

- `make setup` - Install Homebrew and all packages from Brewfile
- `make install` - Create symlinks for configurations
- `make uninstall` - Remove all symlinks
- `make clean` - Clean up broken symlinks
- `make help` - Show available commands

## What Gets Installed

### Development Tools
- **CLI Tools**: git, neovim, fzf, ripgrep, fd, tree, htop, jq, curl, wget

### Applications
- **Terminal**: Ghostty
- **Browsers**: Google Chrome

### Fonts
- JetBrains Mono Nerd Font
- Fira Code Nerd Font  
- Hack Nerd Font

## Configurations

### Ghostty Terminal
- **Theme**: Dracula
- **Font**: JetBrains Mono Nerd Font (16px)
- **Cursor**: Bar style
- **Padding**: Optimized for coding

### Neovim IDE
- **Package Manager**: Lazy.nvim
- **Theme**: Dracula (matches terminal)
- **LSP**: Mason + multiple language servers
- **Features**:
  - Syntax highlighting (Treesitter)
  - File explorer (Neo-tree)
  - Fuzzy finder (Telescope)
  - Autocompletion (nvim-cmp)
  - Status line (Lualine)
  - Buffer tabs (Bufferline)

## Project Structure

```
dotfiles/
├── Makefile              # Automation commands
├── README.md            # This file
├── .stowrc              # Stow configuration
├── .gitignore           # Git ignore rules
├── ghostty/             # Terminal configuration
│   └── config           # Ghostty settings
├── homebrew/            # Package management
│   └── Brewfile         # Homebrew packages & apps
└── nvim/                # Neovim configuration
    ├── init.lua         # Main config file
    └── lua/
        ├── config/      # Core settings & keymaps
        └── plugins/     # Plugin configurations
```

## How It Works

1. **Homebrew**: Installs all CLI tools and applications
2. **Symlinks**: Configurations are symlinked to `~/.config/`
3. **Organized**: Each app has its own directory structure
4. **Maintainable**: Easy to add new configurations

## Customization

To add new applications:

1. Create a new directory (e.g., `zsh/`)
2. Add your config files inside
3. Run `make install` to create symlinks

The Makefile automatically links any new directories to `~/.config/`.

## License
MIT
