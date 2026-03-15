/**
 * tmux color snippet generator.
 * Produces a .conf snippet that can be sourced or appended to ~/.tmux.conf.
 */

export function generateTmux(theme) {
  const { name, displayName, background: bg, foreground: fg, ansi, tokens } = theme;
  const title = displayName || name;

  // ansi[8] = bright-black, used for the dim pane border and popup backgrounds
  const dimBorder = ansi[8];

  return `# ${title} — tmux color snippet
# Generated from ${name}.json — do not edit by hand
#
# Install (append):  cat ${name}.conf >> ~/.tmux.conf
#         (source):  tmux source-file ${name}.conf
# Reload:            tmux source-file ~/.tmux.conf

# ── Status bar ──────────────────────────────────────────────────────────────

set -g status-style                   "bg=${bg},fg=${fg}"
set -g status-left-style              "bg=${bg},fg=${tokens.muted}"
set -g status-right-style             "bg=${bg},fg=${tokens.muted}"
set -g status-left                    "#[fg=${tokens.primary},bold] #S #[fg=${tokens.muted},nobold]"
set -g status-right                   "#[fg=${tokens.muted}] %H:%M #[fg=${tokens.primary}]#H "

# ── Pane borders ─────────────────────────────────────────────────────────────

set -g pane-border-style              "fg=${dimBorder}"
set -g pane-active-border-style       "fg=${tokens.primary}"

# ── Messages ─────────────────────────────────────────────────────────────────

set -g message-style                  "bg=${dimBorder},fg=${tokens.primary}"
set -g message-command-style          "bg=${dimBorder},fg=${tokens.accent}"

# ── Selection / copy mode ────────────────────────────────────────────────────

set -g mode-style                     "bg=${tokens.primary},fg=${bg}"

# ── Window list ──────────────────────────────────────────────────────────────

set -g window-status-style            "fg=${tokens.muted}"
set -g window-status-current-style    "fg=${tokens.primary},bold"
set -g window-status-bell-style       "fg=${tokens.error},bold"
set -g window-status-format          " #I:#W "
set -g window-status-current-format  " #I:#W "

# ── Popup windows ────────────────────────────────────────────────────────────

set -g popup-border-style             "fg=${tokens.accent}"
set -g popup-border-lines             "rounded"
`;
}
