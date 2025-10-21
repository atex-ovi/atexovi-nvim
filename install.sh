#!/data/data/com.termux/files/usr/bin/bash
# =====================================================
#  Atexovi-Nvim Installer (Termux Compatible)
# =====================================================
#  by Atex Ovi - 2025
# =====================================================

set -e

# === Colors ===
green="\033[1;32m"
yellow="\033[1;33m"
red="\033[1;31m"
cyan="\033[1;36m"
reset="\033[0m"

# === Progress Bar Function ===
progress_bar() {
    local task="$1"
    local duration="${2:-2}"
    local width=40
    local char="█"

    local YELLOW=$'\033[1;33m'
    local GREEN=$'\033[1;32m'
    local RESET=$'\033[0m'

    local term_width=$(tput cols)

    for i in $(seq 0 100); do
        local step=$((i * width / 100))
        local bar=$(printf "%0.s$char" $(seq 1 $step))
        local space=$(printf "%0.s " $(seq 1 $((width - step))))
        local color="$YELLOW"
        (( i == 100 )) && color="$GREEN"

        local prog_text="[$bar$space] $i%"
        local pad=$((term_width - ${#task} - ${#prog_text} - 5))
        ((pad<0)) && pad=0
        local padding=$(printf "%*s" "$pad" "")

        printf "\r[*] %s%s%s%s" "$task" "$padding" "$color" "$prog_text$RESET"

        sleep "$(awk "BEGIN {print $duration/100}")"
    done
    echo
}

echo -e "${cyan}🚀 Starting Atexovi-Nvim Setup...${reset}"

# === 1. Check & Install Dependencies ===
DEPS=(
  git
  neovim
  nodejs
  npm
  python
  curl
  ripgrep
  fd
  clang
)

echo -e "${yellow}📦 Checking required packages...${reset}"
for pkg in "${DEPS[@]}"; do
  if command -v "$pkg" >/dev/null 2>&1; then
    echo -e "${green}✔ $pkg already installed${reset}"
  else
    echo -e "${red}⚙ Installing $pkg ...${reset}"
    progress_bar "Installing $pkg" 1.5
    pkg install -y "$pkg" >/dev/null 2>&1 && \
      echo -e "${green}✔ $pkg installed successfully${reset}" || \
      echo -e "${red}❌ Failed to install $pkg${reset}"
  fi
done

# === 2. Backup .config & .local if existing ===
CONFIG_DIR="$HOME/.config"
LOCAL_DIR="$HOME/.local"
BACKUP_DIR="$HOME/atexovi_backup_$(date +%Y%m%d_%H%M%S)"

if [ -d "$CONFIG_DIR/nvim" ] || [ -d "$CONFIG_DIR/coc" ]; then
  echo -e "${yellow}📂 Existing configuration detected. Creating backup...${reset}"
  progress_bar "Backing up configuration" 2
  mkdir -p "$BACKUP_DIR"
  [ -d "$CONFIG_DIR/nvim" ] && mv "$CONFIG_DIR/nvim" "$BACKUP_DIR/nvim"
  [ -d "$CONFIG_DIR/coc" ] && mv "$CONFIG_DIR/coc" "$BACKUP_DIR/coc"
fi

if [ -d "$LOCAL_DIR/share/nvim" ]; then
  mkdir -p "$BACKUP_DIR"
  mv "$LOCAL_DIR/share/nvim" "$BACKUP_DIR/share_nvim"
fi

# === 3. Copy new configuration ===
echo -e "${cyan}📁 Deploying new configuration...${reset}"
progress_bar "Copying configuration files" 1.5
mkdir -p "$CONFIG_DIR"
cp -r config/nvim "$CONFIG_DIR/"
cp -r config/coc "$CONFIG_DIR/"

# === 4. Install CoC Extensions ===
EXT_DIR="$CONFIG_DIR/coc/extensions"
cd "$EXT_DIR"

if [ -f package.json ]; then
  echo -e "${cyan}⚙ Installing CoC extensions...${reset}"
  progress_bar "Installing CoC extensions" 2.5
  npm install --no-package-lock --ignore-scripts >/dev/null 2>&1 && \
    echo -e "${green}✔ CoC extensions installed successfully${reset}" || \
    echo -e "${red}⚠️  Failed to install CoC extensions${reset}"
else
  echo -e "${red}⚠️  package.json not found, skipping CoC installation${reset}"
fi

cd -

# === 5. Ensure lua-language-server is executable ===
LUA_BIN="$EXT_DIR/coc-lua-data/lua-language-server/bin/lua-language-server"
if [ -f "$LUA_BIN" ]; then
  chmod +x "$LUA_BIN"
  echo -e "${green}✔ lua-language-server marked as executable${reset}"
else
  echo -e "${yellow}ℹ️  lua-language-server not found (optional)${reset}"
fi

# === 5.5. Auto PlugInstall if plugins are missing ===
PLUG_DIR="$HOME/.local/share/nvim/plugged"

if [ -d "$PLUG_DIR" ] && [ "$(ls -A $PLUG_DIR)" ]; then
  echo -e "${yellow}📦 Plugin directory already exists, skipping PlugInstall...${reset}"
else
  echo -e "${cyan}🌀 Running PlugInstall automatically inside Neovim...${reset}"
  progress_bar "Installing Vim Plugins" 3
  nvim --headless +PlugInstall +qall >/dev/null 2>&1 && \
    echo -e "${green}✔ All plugins installed successfully${reset}" || \
    echo -e "${red}⚠️  PlugInstall failed${reset}"
fi

# === 6. Finishing ===
progress_bar "Finalizing setup" 1.5
echo -e "${green}✅ Installation Complete!${reset}"
echo -e "${yellow}🪄 Launch Neovim with:${reset}  nvim"
echo -e "${cyan}📦 Backup created at:${reset}  $BACKUP_DIR"

exit 0