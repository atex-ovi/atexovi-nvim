#!/data/data/com.termux/files/usr/bin/bash
# =====================================================
#  Atexovi-Nvim Full Installer (Termux & Linux)
# =====================================================
#  by Atex Ovi - 2025
# =====================================================

clear
set -e

# === Colors ===
green=$'\033[1;32m'
yellow=$'\033[1;33m'
blue=$'\033[1;34m'
cyan=$'\033[1;36m'
red=$'\033[1;31m'
reset=$'\033[0m'

# === Log file ===
LOG_FILE="$HOME/atexovi_install.log"
echo "" > "$LOG_FILE"

# === Progress Bar Function ===
progress_bar() {
    local task="$1"
    local duration="${2:-2}"
    local width=40
    local char="█"
    local term_width=$(tput cols)

    for i in $(seq 0 100); do
        local step=$((i * width / 100))
        local bar=$(printf "%0.s$char" $(seq 1 $step))
        local space=$(printf "%0.s " $(seq 1 $((width - step))))
        local color="$yellow"
        (( i == 100 )) && color="$green"

        local prog_text="[$bar$space] $i%"
        local pad=$((term_width - ${#task} - ${#prog_text} - 5))
        ((pad<0)) && pad=0
        local padding=$(printf "%*s" "$pad" "")
        printf "\r[*] %s%s%s%s" "$task" "$padding" "$color" "$prog_text$reset"
        sleep "$(awk "BEGIN {print $duration/100}")"
    done
    echo
}

echo -e "${cyan}🚀 Starting Atexovi-Nvim Setup...${reset}"

# === 1. Install Dependencies ===
DEPS=(git neovim nodejs npm python curl ripgrep fd clang)
echo -e "${yellow}📦 Checking required packages...${reset}"
for pkg in "${DEPS[@]}"; do
  if command -v "$pkg" >/dev/null 2>&1; then
    echo -e "${green}✔ $pkg already installed${reset}"
  else
    echo -e "${blue}⚙ Installing $pkg ...${reset}"
    progress_bar "Installing $pkg" 1.5
    pkg install -y "$pkg" &>>"$LOG_FILE" && \
      echo -e "${green}✔ $pkg installed successfully${reset}" || \
      echo -e "${red}❌ Failed to install $pkg${reset}" &>>"$LOG_FILE"
  fi
done

# === 2. Backup old configs ===
CONFIG_DIR="$HOME/.config"
LOCAL_DIR="$HOME/.local"
BACKUP_DIR="$HOME/atexovi_backup_$(date +%Y%m%d_%H%M%S)"
if [ -d "$CONFIG_DIR/nvim" ] || [ -d "$CONFIG_DIR/coc" ]; then
  echo -e "${yellow}📂 Old config existing. (Backing up old config)...${reset}"
  progress_bar "Backing up configuration" 2
  mkdir -p "$BACKUP_DIR"
  [ -d "$CONFIG_DIR/nvim" ] && mv "$CONFIG_DIR/nvim" "$BACKUP_DIR/nvim"
  [ -d "$CONFIG_DIR/coc" ] && mv "$CONFIG_DIR/coc" "$BACKUP_DIR/coc"
fi
[ -d "$LOCAL_DIR/share/nvim" ] && mv "$LOCAL_DIR/share/nvim" "$BACKUP_DIR/share_nvim"

# === 3. Copy new configs ===
echo -e "${cyan}📁 Deploying new configuration...${reset}"
progress_bar "Copying configuration files" 1.5
mkdir -p "$CONFIG_DIR"
cp -r config/nvim "$CONFIG_DIR/"
cp -r config/coc "$CONFIG_DIR/"

# === 4. Install vim-plug if missing ===
PLUG_FILE="$HOME/.local/share/nvim/site/autoload/plug.vim"
if [ ! -f "$PLUG_FILE" ]; then
    echo -e "${cyan}⚙ Installing vim-plug...${reset}"
    mkdir -p "$(dirname "$PLUG_FILE")"
    curl -sSfLo "$PLUG_FILE" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# === 5. Install Vim Plugins (PlugInstall) ===
echo -e "${cyan}🌀 Installing Vim Plugins...${reset}"
progress_bar "Installing Vim Plugins" 3
# Jalankan PlugInstall tapi jangan hentikan script walau ada error
nvim --headless +PlugInstall +qall &>>"$LOG_FILE" || true
sleep 1

# === 6. Coc Extensions Setup (except pyright) ===
EXT_DIR="$CONFIG_DIR/coc/extensions"
mkdir -p "$EXT_DIR"
cd "$EXT_DIR"
if [ ! -f package.json ]; then
cat > package.json <<'EOF'
{
  "dependencies": {
    "coc-css": ">=2.1.0",
    "coc-go": ">=1.3.35",
    "coc-html": ">=1.8.0",
    "coc-json": ">=1.9.3",
    "coc-lua": "^2.0.6",
    "coc-rust-analyzer": ">=0.85.0",
    "coc-sh": ">=1.2.4",
    "coc-snippets": ">=3.4.7",
    "coc-tsserver": ">=2.3.1",
    "coc-yaml": ">=1.9.1",
    "coc-ccls": ">=0.0.5",
    "coc-clangd": ">=0.32.0",
    "coc-git": ">=2.7.7",
    "coc-eslint": ">=3.0.15",
    "coc-diagnostic": ">=0.24.1",
    "coc-prettier": ">=11.0.1"
  }
}
EOF
fi
npm install --silent --no-package-lock --ignore-scripts &>>"$LOG_FILE"

# Coc-settings.json lengkap
COC_SETTINGS="$CONFIG_DIR/nvim/coc-settings.json"
mkdir -p "$(dirname "$COC_SETTINGS")"
cat > "$COC_SETTINGS" <<EOF
{
  "languageserver": {
    "lua": {
      "command": "lua-language-server",
      "filetypes": ["lua"],
      "rootPatterns": ["init.lua", ".git/"],
      "settings": {
        "Lua": {
          "diagnostics": { "globals": ["vim"] },
          "workspace": { "library": ["runtimepath"] },
          "telemetry": { "enable": false }
        }
      }
    }
  },
  "snippets.ultisnips.pythonPrompt": false
}
EOF

# === 7. Install Coc Extensions silently ===
nvim --headless +"CocInstall -sync coc-css coc-go coc-html coc-json coc-lua coc-rust-analyzer coc-sh coc-snippets coc-tsserver coc-yaml coc-ccls coc-clangd coc-git coc-eslint coc-diagnostic coc-prettier" +qall &>>"$LOG_FILE" || true
sleep 1

# === 8. Install coc-pyright separately (Python LSP) ===
echo -e "${cyan}🐍 Installing Coc extension...${reset}"
npm install -g pyright &>>"$LOG_FILE" || true
nvim --headless +"CocInstall -sync coc-pyright" +qall &>>"$LOG_FILE" || true

# === 9. Install Treesitter parsers ===
echo -e "${cyan}🌳 Installing Treesitter parsers...${reset}"
nvim --headless +'TSInstallSync! lua python javascript' +qall &>>"$LOG_FILE" || true

# === 10. Restart Coc supaya semua LSP aktif ===
nvim --headless +"CocRestart" +qall &>>"$LOG_FILE" || true

# === 11. Final Message ===
progress_bar "Finalizing setup" 1.5
echo -e "${green}✅ Installation Complete!${reset}"
echo -e "${yellow}🪄 Launch Neovim:${reset} nvim"
echo -e "${cyan}📦 Backup created at:${reset} $BACKUP_DIR"
echo -e "${blue}📜 Full log: $LOG_FILE${reset}"
