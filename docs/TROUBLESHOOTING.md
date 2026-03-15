# Troubleshooting

## Pre-install checklist

Before running the installer, verify:

- [ ] Node.js 22 or later installed: `node --version`
- [ ] JetBrains Mono Nerd Font installed and set as your terminal font
- [ ] Target application is installed and has been launched at least once (creates default config files)

## Post-install verification per terminal

### Starship

1. Run `starship --version` — must succeed
2. Check that `~/.config/starship.toml` exists and contains `palette = "<theme>"`
3. Open a new terminal window (not tab) — Starship initialises from the shell rc file
4. If the prompt looks plain, verify the init line: `grep starship ~/.zshrc` or `grep starship ~/.bashrc`

### Alacritty

1. Check that `~/.config/alacritty/themes/<name>.toml` exists
2. Check that `~/.config/alacritty/alacritty.toml` contains `import = ["~/.config/alacritty/themes/<name>.toml"]`
3. Restart Alacritty

### Kitty

1. Check that `~/.config/kitty/<name>.conf` exists
2. Check that `~/.config/kitty/kitty.conf` contains `include <name>.conf  # gloam`
3. Reload Kitty config: `ctrl+shift+F5` or restart

### WezTerm

1. Check that `~/.config/wezterm/colors/<name>.lua` exists
2. Check that `~/.config/wezterm/wezterm.lua` contains `config.color_scheme = "<Capitalized Name>"`
3. Reload WezTerm config or restart

### Ghostty

1. Check that `~/.config/ghostty/themes/<name>` exists
2. Check that `~/.config/ghostty/config` contains `theme = <name>`
3. Restart Ghostty

### VS Code

1. After running the installer, run `Cmd+Shift+P` → **Reload Window**
2. Open the theme picker: `Cmd+K Cmd+T`
3. Select `Gloam <Name>` from the list
4. If it does not appear, check that `~/.vscode/extensions/gloam-<name>/` exists with a `package.json`

### Neovim

1. Check that `~/.config/nvim/colors/<name>.lua` exists
2. Add `vim.cmd("colorscheme <name>")` to your `init.lua`
3. Reload with `:source $MYVIMRC` or restart Neovim

### Zed

1. Check that `~/.config/zed/themes/<name>.json` exists
2. Check that `~/.config/zed/settings.json` contains `"theme": "<Capitalized Name>"`
3. Reload Zed or select the theme from the command palette

### Windows Terminal

1. Check that the color scheme block `"Gloam <Name>"` exists in `settings.json` under `"schemes"`
2. Check that the relevant profile's `"colorScheme"` key is set to `"Gloam <Name>"`
3. Close and reopen Windows Terminal to pick up the change

### Helix

1. Check that `~/.config/helix/themes/<name>.toml` exists
2. Check that `~/.config/helix/config.toml` contains `theme = "<name>"`
3. Restart Helix — theme changes are not hot-reloaded

### tmux

1. Check that `~/.tmux.conf` contains a `source-file` line pointing to `themes/<name>/tmux.conf`
2. Run `tmux source ~/.tmux.conf` to reload without restarting
3. If colors still look wrong, check that your terminal supports 256 colors: `echo $TERM` should return `xterm-256color` or `tmux-256color`
4. Add `set -g default-terminal "tmux-256color"` to `~/.tmux.conf` if colors are degraded

## Display calibration

gloam themes are calibrated for sRGB displays at 200–300 nits. Wide-gamut (P3) displays may render colors more saturated. High-brightness modes (>400 nits) may reduce perceived contrast. The WCAG 4.5:1 guarantee is measured in sRGB.

If colors look significantly different from the card previews on the website:

1. Check your display color profile (System Settings › Displays on macOS)
2. Verify your terminal is using sRGB (not P3) color rendering if the setting is available

## Font version requirements

Use the latest release of JetBrains Mono Nerd Font. Older Nerd Font versions (pre-3.0) use different codepoints for some glyphs. If language badges show as boxes, update the font.

To install the current version:

```bash
brew uninstall --cask font-jetbrains-mono-nerd-font  # remove old version
brew install --cask font-jetbrains-mono-nerd-font
```

After installation, restart your terminal and verify the font is selected in terminal preferences.

## Support

- **Bugs and incorrect output:** [GitHub Issues](https://github.com/marvinrichter/gloam/issues)
- **Questions and general discussion:** [GitHub Discussions](https://github.com/marvinrichter/gloam/discussions)
- **Security issues:** See [SECURITY.md](../SECURITY.md) — do not open a public issue
