// Shared syntax token mapping used by VS Code, Neovim, IntelliJ, and Zed generators.
// Maps semantic role → color from the theme object.
//
// keyword      → accent
// type/class   → primary
// function     → primary
// string       → ansi[10] (bright green)
// number       → ansi[11] (bright yellow)
// comment      → muted (italic)
// variable     → foreground
// constant     → ansi[13] (bright magenta)
// operator     → muted
// punctuation  → muted
// tag/markup   → accent
// attribute    → primary
// error        → error

export function syntaxColors(theme) {
  const { tokens, ansi, foreground } = theme;
  if (!Array.isArray(ansi) || ansi.length < 16) {
    throw new Error(
      `syntaxColors: theme "${theme.name}" ansi array must have at least 16 entries, got ${ansi?.length ?? 0}`,
    );
  }
  return {
    keyword: tokens.accent,
    type: tokens.primary,
    class: tokens.primary,
    function: tokens.primary,
    string: ansi[10],
    number: ansi[11],
    comment: tokens.muted,
    variable: foreground,
    constant: ansi[13],
    operator: tokens.muted,
    punctuation: tokens.muted,
    tag: tokens.accent,
    attribute: tokens.primary,
    error: tokens.error,
    warning: ansi[3],
  };
}
