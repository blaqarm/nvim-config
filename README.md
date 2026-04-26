![nvim-pic](nvim.jpeg)

# Neovim 0.12 config (Arch Linux)

Updated config with groundwork for migrating away from Doom Emacs.

---

## Installation

```bash
# Backup the old config
mv ~/.config/nvim        ~/.config/nvim.bak
mv ~/.local/share/nvim   ~/.local/share/nvim.bak
mv ~/.local/state/nvim   ~/.local/state/nvim.bak
mv ~/.cache/nvim         ~/.cache/nvim.bak

# Drop in the new one
unzip nvim.zip -d ~/.config/
# The folder ~/.config/nvim/ should appear

# Launch — lazy.nvim will install everything itself
nvim
```

On the first launch:

1. Lazy installs the plugins.
2. Mason downloads LSPs/formatters.
3. Treesitter compiles parsers.
4. `:checkhealth`.

---

## System dependencies (pacman)

```bash
# Required
sudo pacman -S neovim git curl unzip ripgrep fd make gcc nodejs npm

# For Ollama (local models)
sudo pacman -S ollama
# For AMD (ROCm):
sudo pacman -S ollama-rocm
systemctl --user enable --now ollama
# Or, if there is one instance per machine:
# sudo systemctl enable --now ollama

# Models for 24 GB VRAM rx 7900 xtx:
ollama pull qwen2.5-coder:7b
ollama pull qwen2.5-coder:32b
ollama pull deepseek-coder-v2:16b
ollama pull llama3.1:8b
ollama pull qwen3:14b  # currently using this one.
```

The default model is set in `plugins/codecompanion.lua` => `schema.model.default`

### Nerd Font

A nerd-font is required for icons in lualine/bufferline/neo-tree:

```bash
sudo pacman -S ttf-hack-nerd-mono  # something like this
```

---

## Structure

```
nvim/
├── init.lua                 entry point
├── lazy-lock.json           (created automatically)
└── lua/
    ├── core/
    │   ├── configs.lua      editor options, diagnostic
    │   ├── mappings.lua     global keymaps
    │   └── lazy.lua         bootstrap lazy.nvim
    └── plugins/
        ├── autopairs.lua
        ├── blink-cmp.lua    autocomplete (new, fast)
        ├── bufferline.lua
        ├── codecompanion.lua  AI via local Ollama
        ├── comment.lua      <leader>- toggle
        ├── conform.lua      formatters (prettier/black/stylua)
        ├── dashboard.lua
        ├── gitsigns.lua
        ├── leap.lua
        ├── lsp.lua          vim.lsp.config / vim.lsp.enable (0.11+ API)
        ├── lualine.lua
        ├── mason.lua        LSP/formatter installer
        ├── neo-tree.lua
        ├── neoscroll.lua    smooth scroll (240 Hz-friendly timings)
        ├── onedark.lua
        ├── telescope.lua
        ├── toggleterm.lua
        ├── treesitter.lua
        └── which-key.lua
```

---

## Hotkeys (Leader = Space)

### Files / buffers

| Keys                | Action                  |
| ------------------- | ----------------------- |
| `<leader>w`         | Save                    |
| `<leader>q`         | Close window            |
| `<leader>Q`         | Quit with `!`           |
| `<leader>t`         | NeoTree toggle          |
| `<Tab>` / `<S-Tab>` | Next / previous buffer  |
| `<leader>x`         | Pick-close buffer       |
| `<C-x>`             | Close all other buffers |

### Telescope (search)

| Keys         | Action           |
| ------------ | ---------------- |
| `<leader>ff` | Find files       |
| `<leader>fw` | Live grep        |
| `<leader>fb` | Buffers          |
| `<leader>fh` | Help tags        |
| `<leader>fr` | Recent files     |
| `<leader>fd` | Diagnostics      |
| `<leader>fs` | Document symbols |

### LSP

| Keys         | Action                     |
| ------------ | -------------------------- |
| `gd` / `gD`  | Definition / Declaration   |
| `gi`         | Implementation             |
| `gr`         | References                 |
| `K`          | Hover                      |
| `<C-k>`      | Signature help             |
| `<leader>D`  | Type definition            |
| `<leader>lr` | Rename                     |
| `<leader>la` | Code action                |
| `<leader>lf` | Format (LSP)               |
| `<leader>lF` | Format (conform, forced)   |
| `<leader>le` | Show line diagnostics      |
| `]d` / `[d`  | Next / previous diagnostic |

### Commenting

| Keys         | Action                         |
| ------------ | ------------------------------ |
| `<leader>-`  | Toggle line / selection        |
| `gcc`        | Toggle line                    |
| `gc{motion}` | By motion (`gcap` — paragraph) |
| `gbc` / `gb` | Block comment                  |

### AI (CodeCompanion / Ollama)

| Keys          | Action                                   |
| ------------- | ---------------------------------------- |
| `<leader>aa`  | Actions menu (explain, refactor, tests…) |
| `<leader>ac`  | Chat toggle (analogous to gptel-menu)    |
| `<leader>ai`  | Inline prompt on selection               |
| `<leader>ap`  | Prompt Library                           |
| `ga` (visual) | Add selection to active chat             |

### Git (gitsigns)

| Keys         | Action               |
| ------------ | -------------------- |
| `]c` / `[c`  | Next / previous hunk |
| `<leader>gs` | Stage hunk           |
| `<leader>gr` | Reset hunk           |
| `<leader>gS` | Stage buffer         |
| `<leader>gR` | Reset buffer         |
| `<leader>gp` | Preview hunk         |
| `<leader>gb` | Blame line           |
| `<leader>gd` | Diff this            |

### Navigation / windows

| Keys          | Action                  |
| ------------- | ----------------------- |
| `<C-h/j/k/l>` | Between windows         |
| `<A-arrow>`   | Resize window           |
| `\|`          | Vsplit                  |
| `\`           | Split                   |
| `s` / `S`     | Leap forward / backward |

### Misc

| Keys                      | Action                                                |
| ------------------------- | ----------------------------------------------------- |
| `<C-\>`                   | Toggle terminal                                       |
| `<leader>?`               | Which-key: all available buffer keys                  |
| `<C-Space>`               | Start syntax-aware selection (treesitter incremental) |
| `<C-u>/<C-d>/<C-b>/<C-f>` | Smooth scroll                                         |

---

## LSP — what gets installed automatically via Mason

| Server                  | Language              |
| ----------------------- | --------------------- |
| `lua_ls`                | Lua                   |
| `ts_ls`                 | JS / TS               |
| `html`                  | HTML                  |
| `cssls`                 | CSS                   |
| `tailwindcss`           | Tailwind              |
| `intelephense`          | PHP                   |
| `pyright`               | Python                |
| `emmet_language_server` | Emmet in HTML/JSX/PHP |

Formatters (also via Mason):
`stylua`, `prettierd`, `black`, `isort`, `php-cs-fixer`, `eslint_d`.

Format on save is enabled. To disable:

- temporarily in buffer: `:FormatDisable!`
- globally: `:FormatDisable`
- back on: `:FormatEnable`

---

## nvim orgmode

| Action        | Keys        |
| ------------- | ----------- |
|               |             |
| Change status | cit         |
| Deadline      | <leader>odd |
| Schedule      | <leader>ods |
| Agenda        | <leader>oa  |
|               |             |
|               |             |
|               |             |

---

## What changed compared to the old config

1. **nvim-cmp → blink.cmp** — faster, built-in snippets (`vim.snippet`),
   rust-fuzzy-matcher.
2. **phpactor → intelephense** — high-quality PHP LSP.
3. Added **pyright**, **tailwindcss**, **emmet**.
4. **Comment.nvim** on `<leader>-`.
5. **CodeCompanion** for local Ollama (chat, inline, actions like gptel in emacs)
6. **neoscroll** with timings tuned for 240 Hz.
7. **conform.nvim** for formatting.
8. **nvim-autopairs**, **which-key**.
9. `core/configs.lua`: added `undofile`, `signcolumn`, `smartcase`,
   `vim.diagnostic.config()` with signs via the new API (0.11+).
10. `core/mappings.lua`: `leader Q` — force quit all, visual J/K — move
    lines, visual `<`/`>` — indent while keeping the selection.
11. Lazy loading set up everywhere (`event`, `keys`, `cmd`) — nvim startup
    is noticeably faster.
12. Added nvim orgmode.

---

## Troubleshooting

- **Treesitter complains about a parser** → `:TSUpdate`
- **LSP won't start** → `:LspInfo`, `:Mason`
- **CodeCompanion doesn't respond** → `systemctl --user status ollama`,
  `curl http://127.0.0.1:11434/api/tags` (should return a list of models).
- **Blink.cmp: no autocomplete** → `:checkhealth blink`;
  if it complains about the rust binary — `version = "1.*"` in
  `plugins/blink-cmp.lua` should pull it from the release.
- **Icons show as `??`** → install a nerd-font and select it in your terminal.
-
