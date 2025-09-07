.PHONY: setup install uninstall clean help

# Default target
help:
	@echo "Available commands:"
	@echo "make setup    - Install dependencies (Homebrew + packages)"
	@echo "make install  - Create symlinks using Stow"

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
	@echo "Creating symlinks..."
	@stow .
