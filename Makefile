.PHONY: setup install uninstall clean help

# Default target
help:
	@echo "Available commands:"
	@echo "  make setup    - Install dependencies (Homebrew + packages)"
	@echo "  make install  - Create symlinks using Stow"
	@echo "  make uninstall- Remove symlinks"
	@echo "  make clean    - Clean up broken symlinks"
	@echo "  make help     - Show this help message"

# Install dependencies and setup environment
setup:
	@echo "Setting up dotfiles environment..."
	@# Install Homebrew if not already installed
	@if ! command -v brew >/dev/null 2>&1; then \
		echo "Installing Homebrew..."; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	else \
		echo "Homebrew already installed"; \
	fi
	@# Install packages from Brewfile (includes Stow)
	@if [ -f "homebrew/Brewfile" ]; then \
		echo "Installing Homebrew packages (including Stow)..."; \
		brew bundle --file=homebrew/Brewfile; \
	fi
	@echo "Setup complete!"

# Create symlinks using Stow
install:
	@echo "🔗 Creating symlinks..."
	@# Ensure target directory exists
	@mkdir -p ~/.config
	@# Create symlinks for ghostty and nvim directories
	@echo "  Linking ghostty/"
	@ln -sf "$(PWD)/ghostty" ~/.config/ghostty
	@echo "  Linking nvim/"
	@ln -sf "$(PWD)/nvim" ~/.config/nvim
	@echo "Dotfiles installed successfully!"
	@echo "Your development environment is ready!"

# Remove symlinks
uninstall:
	@echo "🗑️  Removing symlinks..."
	@echo "  Unlinking ghostty/"
	@rm -f ~/.config/ghostty
	@echo "  Unlinking nvim/"
	@rm -f ~/.config/nvim
	@echo "Dotfiles uninstalled!"

# Clean up broken symlinks
clean:
	@echo "🧹 Cleaning up broken symlinks..."
	@find ~/.config -type l ! -exec test -e {} \; -exec rm {} \;
	@echo "Cleanup complete!"
