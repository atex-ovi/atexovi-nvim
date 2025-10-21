<p align="center">
  <!-- 🔹 Project Info -->
  <a href="https://neovim.io/" target="_blank">
    <img src="https://img.shields.io/badge/Neovim-0.10+-57A143?style=for-the-badge&logo=neovim&logoColor=white" alt="Neovim 0.10+" />
  </a>
  <a href="https://termux.dev/en/" target="_blank">
    <img src="https://img.shields.io/badge/Termux-Compatible-222?style=for-the-badge&logo=android&logoColor=white" alt="Termux Compatible" />
  </a>
  <a href="https://github.com/atex-ovi/atexovi-nvim/stargazers" target="_blank">
    <img src="https://img.shields.io/github/stars/atex-ovi/atexovi-nvim?style=for-the-badge&logo=github&labelColor=181717&color=EDEDED&logoColor=white" alt="GitHub Stars" />
  </a>
  <a href="https://github.com/atex-ovi/atexovi-nvim/network/members" target="_blank">
    <img src="https://img.shields.io/github/forks/atex-ovi/atexovi-nvim?style=for-the-badge&logo=github&labelColor=181717&color=EDEDED&logoColor=white" alt="GitHub Forks" />
  </a>
  <a href="https://github.com/atex-ovi/atexovi-nvim/blob/main/LICENSE" target="_blank">
    <img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge" alt="License MIT" />
  </a>
</p>

<p align="center">
  <!-- 🔹 Supported Tech & Languages -->
  <a href="https://www.lua.org/" target="_blank">
    <img src="https://img.shields.io/badge/Lua-5.4-2C2D72?style=for-the-badge&logo=lua&logoColor=white" alt="Lua 5.4" />
  </a>
  <a href="https://www.python.org/" target="_blank">
    <img src="https://img.shields.io/badge/Python-3.x-3776AB?style=for-the-badge&logo=python&logoColor=white" alt="Python" />
  </a>
  <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript" target="_blank">
    <img src="https://img.shields.io/badge/JavaScript-ES6+-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black" alt="JavaScript" />
  </a>
  <a href="https://json.org/" target="_blank">
    <img src="https://img.shields.io/badge/JSON-Support-000000?style=for-the-badge&logo=json&logoColor=white" alt="JSON" />
  </a>
  <a href="https://github.com/nvim-treesitter/nvim-treesitter" target="_blank">
    <img src="https://img.shields.io/badge/Highlight-TreeSitter-FF6C37?style=for-the-badge&logo=tree-sitter&logoColor=white" alt="TreeSitter" />
  </a>
  <a href="https://github.com/nvim-lua/plenary.nvim" target="_blank">
    <img src="https://img.shields.io/badge/Lua%20Library-Plenary-6E5494?style=for-the-badge&logo=lua&logoColor=white" alt="Plenary.nvim" />
  </a>
</p>

<p align="center">
  <!-- 🔹 Plugins & LSP -->
  <a href="https://github.com/neoclide/coc.nvim" target="_blank">
    <img src="https://img.shields.io/badge/LSP-CoC.nvim-181717?style=for-the-badge&logo=neovim&logoColor=white" alt="coc.nvim" />
  </a>
  <a href="https://github.com/nvim-lualine/lualine.nvim" target="_blank">
    <img src="https://img.shields.io/badge/UI-Lualine-8E44AD?style=for-the-badge&logo=lines&logoColor=white" alt="Lualine" />
  </a>
  <a href="https://github.com/kyazdani42/nvim-web-devicons" target="_blank">
    <img src="https://img.shields.io/badge/Icons-Devicons-FF1493?style=for-the-badge&logo=material-design-icons&logoColor=white" alt="Devicons" />
  </a>
  <a href="https://github.com/junegunn/vim-plug" target="_blank">
    <img src="https://img.shields.io/badge/Plugin-VimPlug-009999?style=for-the-badge&logo=vim&logoColor=white" alt="VimPlug" />
  </a>
  <a href="https://github.com/nvim-telescope/telescope.nvim" target="_blank">
    <img src="https://img.shields.io/badge/Finder-Telescope-4682B4?style=for-the-badge&logo=telescope&logoColor=white" alt="Telescope" />
  </a>
  <a href="https://github.com/nvim-tree/nvim-tree.lua" target="_blank">
    <img src="https://img.shields.io/badge/File%20Explorer-NvimTree-228B22?style=for-the-badge&logo=tree&logoColor=white" alt="NvimTree" />
  </a>
</p>

<p align="center">
  <!-- 🔹 Contact & Support -->
  <a href="https://saweria.co/atexovi" target="_blank">
    <img src="https://img.shields.io/badge/Donate-Saweria-FFA726?style=for-the-badge&logo=ko-fi&logoColor=white" alt="Donate via Saweria" />
  </a>
  <a href="https://t.me/atexovi" target="_blank">
    <img src="https://img.shields.io/badge/Contact-Telegram-29A9EB?style=for-the-badge&logo=telegram&logoColor=white" alt="Telegram Contact" />
  </a>
  <a href="https://facebook.com/atex.ovi" target="_blank">
    <img src="https://img.shields.io/badge/Follow-Facebook-1877F2?style=for-the-badge&logo=facebook&logoColor=white" alt="Facebook Follow" />
  </a>
  <a href="https://github.com/atex-ovi" target="_blank">
    <img src="https://img.shields.io/badge/Profile-GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub Profile" />
  </a>
</p>

<br>
<hr style="border: 0.5px solid #444;">
<br>

<h1 align="center">🌌 Atexovi-Nvim – Universal Neovim Setup for Termux</h1>

> 💡 Modern, lightweight, and fully automated **Neovim IDE setup** for Termux.  
> Built for real-world coding — featuring CoC, LSP, Autocomplete, Syntax Highlight, Git, and custom Atexovi theme.

---

## ⚙️ Installation

```bash
git clone https://github.com/atexovi/atexovi-nvim.git
cd atexovi-nvim
bash install.sh
```

> 🪄 This script will:
> - Auto-install missing Termux packages
> - Backup existing `.config` & `.local`
> - Deploy your Neovim + CoC configuration
> - Auto-install all CoC extensions and LSP backends

---

## 🧠 Features Overview

| Category | Description |
|-----------|-------------|
| 🧩 **UI/UX** | Custom Atexovi theme, Bubbly statusline, icons & better layout |
| ⚙️ **Automation** | `install.sh` handles dependencies, setup & backup |
| 📦 **CoC Integration** | Complete CoC ecosystem pre-installed |
| 💬 **Autocomplete & IntelliSense** | Context-aware suggestions for all major languages |
| 🎨 **Syntax Highlight** | Treesitter-based highlight for multi-language code |
| 🔍 **LSP Ready** | Works with Lua, JS/TS, Go, Rust, C/C++, Python, YAML, HTML, CSS, JSON |
| 🧾 **Lint & Format** | ESLint, Prettier, Diagnostic, and auto-format support |
| 🧰 **Snippets Engine** | Built-in CoC-snippets support |
| 🧭 **File Navigation** | Telescope-like fuzzy finder and project search (via `ripgrep` & `fd`) |
| 🧩 **Extensible** | Easy to add new plugins or tweak configuration |
| 🔄 **Auto Compile** | Automatically compiles syntax and treesitter highlight definitions |
| 💾 **Safe Setup** | Backs up `.config` & `.local` if already present |

---

## 🔧 CoC Extension Stack

All extensions are pre-defined in `config/coc/extensions/package.json` and automatically installed:

| Language / Tool | Extension | Features |
|------------------|------------|-----------|
| 🧠 **Lua** | `coc-lua` | Smart LSP via `lua-language-server` |
| 🐍 **Python** | `coc-pyright` | Type checking, autocompletion |
| 🦀 **Rust** | `coc-rust-analyzer` | Full LSP support, inline hints |
| 🐹 **Go** | `coc-go` | Autoimports, linting, formatting |
| ⚙️ **C / C++** | `coc-clangd` / `coc-ccls` | Language server & symbol indexing |
| 🧾 **YAML** | `coc-yaml` | Schema validation, autocomplete |
| 🌐 **HTML / CSS / JSON / JS / TS** | `coc-html`, `coc-css`, `coc-json`, `coc-tsserver` | Complete frontend stack |
| 🔧 **Linting** | `coc-eslint`, `coc-diagnostic` | Code diagnostics and fix |
| 🪄 **Formatting** | `coc-prettier` | Auto code formatter |
| 🧩 **Git Integration** | `coc-git` | Git status, blame, diff in editor |
| ✂️ **Snippets** | `coc-snippets` | Snippet manager & templates |

---

## 📘 Syntax Highlight & Autocompile

Atexovi-Nvim uses a hybrid approach combining:
- **Treesitter** (for semantic highlighting & folding)
- **CoC** (for LSP-powered syntax validation)
- Auto compile on first open — caches highlight definitions in `.local/share/nvim/`
- Supports:
  - Lua / Vimscript  
  - Python  
  - C / C++  
  - Rust  
  - Go  
  - JavaScript / TypeScript  
  - HTML / CSS / JSON / YAML / Markdown

---

## 🖥️ System Support

Atexovi-Nvim is fully tested on **Termux (Android, arm64 / aarch64)**.  
However, it also works seamlessly on:

| Platform | Architecture | Status |
|-----------|---------------|--------|
| Android (Termux) | `arm64` / `aarch64` | ✅ Full support |
| Linux (Ubuntu, Arch, Fedora) | `x86_64` | ✅ Full support |
| macOS | `arm64` (M1/M2) | ⚙️ Partial (needs path adjustment) |
| Windows (WSL) | `x86_64` | ⚙️ Supported with small tweaks |

> 🧠 On **Termux**, `install.sh` automatically detects architecture (`uname -m`) and optimizes paths for `lua-language-server` and CoC.

---

## 🧩 Dependencies

The installer automatically ensures all essential Termux packages are installed.

**Required (auto-checked & installed if missing):**
```bash
git neovim nodejs npm python clang ripgrep fd
```

---

## 📦 Directory Structure

```
atexovi-nvim/
├── install.sh
├── README.md
├── config/
│   ├── nvim/
│   │   ├── init.vim
│   │   └── lua/atexovi/theme_picker.lua
│   └── coc/
│       ├── extensions/
│       │   ├── coc-lua-data/
│       │   │   ├── db.json
│       │   │   └── lua-language-server
│       │   └── package.json
│       └── memos.json
└── .gitignore
```

---

## 💾 Backup System

Before overwriting:
```
~/.config  → ~/.config.bak_<timestamp>
~/.local   → ~/.local.bak_<timestamp>
```
so your old Neovim config is **never lost**.

---

## 🚀 After Installation

Run Neovim:
```bash
nvim
```

Inside Neovim, CoC will initialize automatically and activate all language servers.  
To verify:
```vim
:CocInfo
```

---

## 🧰 Optional: Manual Lua Server Build

If you prefer to rebuild `lua-language-server` manually:
```bash
git clone https://github.com/sumneko/lua-language-server.git
cd lua-language-server
bash make.sh
cp ./bin/lua-language-server ~/.config/coc/extensions/coc-lua-data/
chmod +x ~/.config/coc/extensions/coc-lua-data/lua-language-server
```

---

## 📜 License

[MIT](LICENSE)