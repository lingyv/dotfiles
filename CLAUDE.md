# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a comprehensive dotfiles repository for macOS and Linux system configuration. It uses a **multi-branch strategy** where:
- `master` branch: Contains shared configuration files for all platforms
- `mac` branch: macOS-specific configurations (current branch)
- `linux` branch: Linux-specific configurations with i3wm, pacman/apt scripts
- Additional branches: `vps`, `ipad`, `server` for specialized environments

## Installation & Setup Commands

### Initial Setup (macOS)
```bash
# Clone and setup
git clone https://github.com/lingyv/dotfiles.git ~/dotfiles
cd ~/dotfiles
git checkout mac

# Install packages (installs Homebrew, oh-my-zsh, 50+ CLI tools)
./brew.sh

# Create symlinks to home directory
./bootstrap.sh          # Interactive mode with confirmation
./bootstrap.sh --force  # Skip confirmation
```

### Initial Setup (Linux)
```bash
git checkout linux
./apt.sh        # For Ubuntu/Debian
./pacman.sh     # For Arch Linux
./bootstrap.sh
```

### Post-Installation
After running `bootstrap.sh`, you must:
1. Update Git configuration:
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email you@example.com
   ```
2. Install Vim plugins: Open Vim and run `:BundleInstall`
3. Install Tmux plugins: Press `prefix + I` (default: `Ctrl+g` then `I`)

### Apply macOS System Defaults
```bash
./.osx
```
This configures 800+ system settings (Finder, Dock, Safari, keyboard, trackpad, etc.)

## Architecture & Key Systems

### Shell Environment
- **Primary Shell**: Zsh with oh-my-zsh framework
- **Custom Theme**: `lingyv` (located in `conf/zsh/`)
- **Active Plugins**: git, autojump, macos, zsh-syntax-highlighting, fzf
- **Directory Jumping**: z.lua (initialized in `.zshrc`, expects `~/coding/z.lua/`)
- **Configuration Loading Order**: `.zshrc` → `.bash_profile` → `.exports` + `.aliases` + `.functions`

### Development Stack
**Language Toolchains** (configured in `.exports`):
- Java 17: `JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home`
- Maven: `M2_HOME` with settings in `conf/maven/settings.xml`
- Python 3: Conda configuration via `.condarc`
- Node.js: nvm support
- Go: `GOPATH` configured

**Big Data Stack**:
- Hadoop 3.3.6: `HADOOP_HOME`
- Spark 3.5.0: `SPARK_HOME`
- Hive 3.1.3: `HIVE_HOME`

### Editor Configuration

**Neovim** (Primary):
- Plugin Manager: **lazy.nvim** (not vim-plug)
- Entry Point: `init.lua` (loads `plugins.lua`)
- Key Features:
  - LLM integration via `llm.nvim` plugin (uses local Ollama with deepseek-r1:14b model)
  - Codeium for AI completion
  - Streaming support for LLM responses with custom handlers
- Configuration: `init.lua` + `plugins.lua` (390 lines of plugin definitions)
- Symlinked to: `~/.config/nvim/init.lua`

**Vim**:
- Plugin Manager: vim-plug (requires `:BundleInstall` after setup)
- Configuration: `.vimrc` (386 lines)

**JetBrains IDEs**:
- IdeaVim: `.ideavimrc` for Vim emulation
- IDE Settings: Pre-configured jars in `conf/jetbrains/` for GoLand, IntelliJ, PyCharm

### Terminal & UI Stack

**Terminal Emulator**: WezTerm
- Configuration: `conf/wezterm.lua` (Lua-based)
- Font: FiraCode Nerd Font Mono (15.0pt) with fallbacks (JetBrains Mono, Hack Nerd Font, CJK support)
- Window: 96% opacity with 20px macOS blur
- Key Features: Integrated buttons, custom key mappings (Shift+Esc sends `~`)
- Must be symlinked manually to `~/.config/wezterm/wezterm.lua`

**Window Manager**: AeroSpace (macOS native tiling)
- Configuration likely in `conf/aerospace/` or root-level
- Accordion padding: 30px, supports tiles/accordion layouts
- Integration: SketchyBar plugins monitor workspace state

**Status Bar**: SketchyBar (macOS-native replacement for menu bar)
- Configuration: `conf/sketchybar/`
- Plugins: `cpu.sh`, `memswap.sh`, `memory.sh`, `battery.sh`, `clock.sh`, `aerospace.sh`, `dingtalk.sh`, `wechat.sh`, `app_status.sh`, `wifi.sh`
- Custom binary: `sketchybar_helper` for system monitoring
- Color scheme: `colors.sh`

### Key Tools & Utilities

**File Management**:
- Yazi: Terminal file manager with `yazi.toml` config, rich-preview plugins
- Custom function `yy`: Changes directory to yazi's last location on exit

**Fuzzy Finding** (fzf integration in `.functions`):
- `vf`: Fuzzy find file and open in vim
- `vg`: Interactive ripgrep search, open result in vim
- `fd`: Fuzzy find directory and cd
- `fda`: Fuzzy find directory including hidden ones
- `fdr`: Find and remove directories

**Network & Download**:
- Aria2: BitTorrent/HTTP downloader with RPC (`aria2.conf`)
- Clash: Proxy manager config in `conf/clash/`

**Git Configuration**:
- Delta pager: Colored diffs with line numbers, side-by-side mode
- Custom aliases in `.gitconfig`: merge tools, rebase helpers, log formats, PR management
- GitHub CLI integration for PR workflows

### Custom Functions Library

The `.functions` file (300+ lines) includes:
- **gitignore generation**: `gi <templates>`, `gilist`, `pgi` (uses toptal.com API)
- **Archive utilities**: `targz` with automatic algorithm selection
- **Network tools**: `getcertnames`, `json` syntax highlighting
- **System utilities**: `calc`, `mkd` (mkdir + cd), SSH key copying
- **Yazi integration**: `yy` function for directory jumping
- 30+ additional productivity functions

The `.aliases` file (170+ lines) includes extensive macOS-specific shortcuts.

## File Symlink Strategy

The `bootstrap.sh` script creates these symlinks from `~/dotfiles/` to `~/`:
- Shell: `.zshrc`, `.bash_profile`, `.bashrc`, `.aliases`, `.functions`, `.exports`
- Editors: `.vimrc`, `.ideavimrc`, `~/.config/nvim/init.lua`
- Tools: `.gitconfig`, `.curlrc`, `.tmux.conf`, `.condarc`, `.tern-project`

**Manual Symlinks Required**:
- WezTerm: `ln -s ~/dotfiles/conf/wezterm.lua ~/.config/wezterm/wezterm.lua`
- SketchyBar: `ln -s ~/dotfiles/conf/sketchybar ~/.config/sketchybar`
- AeroSpace: Check for config location and symlink if needed
- Yazi: `ln -s ~/dotfiles/yazi.toml ~/.config/yazi/yazi.toml`

## Common Customization Points

### Updating Plugin Lists
- **Neovim**: Edit `plugins.lua`, restart and run `:Lazy sync`
- **Vim**: Edit `.vimrc`, run `:BundleInstall` in Vim
- **Zsh**: Edit `.zshrc` plugins array, run `source ~/.zshrc`

### Modifying Aliases & Functions
- Edit `.aliases` or `.functions`, then `source ~/.bash_profile`
- Changes persist across new shell sessions after source

### Environment Variables
- Edit `.exports` for `PATH`, language homes, tool paths
- Re-source with `source ~/.exports` or restart shell

### Git Workflow Customization
- Edit `.gitconfig` for aliases, delta settings, merge tools
- User name/email must be configured manually (not tracked)

## Branch Management

When switching between platforms:
```bash
# Switch to Linux setup
git checkout linux
./apt.sh && ./bootstrap.sh

# Switch back to macOS
git checkout mac
./brew.sh && ./bootstrap.sh
```

**Important**: Platform-specific files (`.osx`, `brew.sh`, `.i3`, etc.) only exist on their respective branches.

## Dependencies & External Requirements

### External Repositories
- oh-my-zsh: Installed by `brew.sh`
- z.lua: Expected at `~/coding/z.lua/` (must clone manually)
- tmux plugin manager: Auto-cloned to `~/.tmux/plugins/tpm` by `bootstrap.sh`

### System Requirements
- macOS: Homebrew, Xcode Command Line Tools
- Linux: apt/pacman package manager
- Fonts: Nerd Fonts (FiraCode, Hack, JetBrains Mono) installed via `brew.sh`

## LLM Integration (Neovim)

The Neovim setup includes local LLM integration:
- **Provider**: Ollama running locally (HTTP endpoint)
- **Model**: deepseek-r1:14b (configured in `plugins.lua`)
- **Plugin**: `llm.nvim` with streaming support
- **Features**: Custom prompt handlers, streaming parsers, multi-provider support

To use: Ensure Ollama is installed and model is pulled (`ollama pull deepseek-r1:14b`)

## Language Configuration

- Primary: English (`en_US.UTF-8`)
- CJK Support: Font fallbacks for Chinese, Japanese, Korean
- Emoji Support: Apple Color Emoji in font stack
