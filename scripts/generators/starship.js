/**
 * Starship TOML generator.
 * All prompt personality lives in theme.prompt — colors come from theme.tokens.
 */

export function generateStarship(theme) {
  const { name, tokens, prompt } = theme;
  const {
    layout = "two-line-box",
    showUsername = false,
    fill = "·",
    timePrefix = "◆",
    successSymbol = "❯",
    vimSymbol = "❮",
  } = prompt;

  const isTwoLine = layout === "two-line-box";

  // ── format string ────────────────────────────────────────────────────────

  const usernameModule = showUsername ? `$username\\\n` : ``;

  const formatBlock = isTwoLine ? buildTwoLineBox(usernameModule) : buildSingleLine(usernameModule);

  // ── username block ───────────────────────────────────────────────────────

  const usernameBlock = showUsername
    ? `\n[username]
show_always = true
style_user  = "fg:muted"
style_root  = "bold fg:error"
format      = "[ $user ](fg:muted)"
`
    : ``;

  return `"$schema" = 'https://starship.rs/config-schema.json'

# ┌─────────────────────────────────────────────────────────────────────────────
# │ ${name} — starship prompt
# │
# │ Generated from ${name}.json — do not edit by hand
# │
# │ Install:  cp ${name}.toml ~/.config/starship.toml
# └─────────────────────────────────────────────────────────────────────────────

add_newline = true

${formatBlock}

palette = "${name}"

[palettes.${name}]
primary = "${tokens.primary}"
accent  = "${tokens.accent}"
muted   = "${tokens.muted}"
error   = "${tokens.error}"

# ─── Layout ──────────────────────────────────────────────────────────────────

[fill]
symbol = "${fill}"
style  = "fg:muted dim"
${usernameBlock}
# ─── Navigation ──────────────────────────────────────────────────────────────

[directory]
style             = "bold fg:primary"
format            = "[ $path ]($style)"
truncation_length = 3
truncation_symbol = "…/"

[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = " "
"Pictures" = " "

# ─── Git ─────────────────────────────────────────────────────────────────────

[git_branch]
symbol = ""
style  = "fg:accent"
format = "[ $symbol $branch ]($style)"

[git_status]
ahead      = "⇡\${count}"
behind     = "⇣\${count}"
diverged   = "⇕"
conflicted = "!"
untracked  = "?"
stashed    = "≡"
modified   = "~"
staged     = "+"
renamed    = "»"
deleted    = "✕"
style      = "fg:accent"
format     = "([$all_status$ahead_behind ]($style))"

# ─── Performance ─────────────────────────────────────────────────────────────

[cmd_duration]
min_time = 2000
style    = "fg:muted dim"
format   = "[${timePrefix} $duration ]($style)"

# ─── Languages & environments ────────────────────────────────────────────────

[c]
symbol = " "
style  = "fg:primary"
format = "[ $symbol($version) ]($style)"

[cpp]
symbol = " "
style  = "fg:primary"
format = '[ $symbol($version) ]($style)'

[elixir]
symbol = " "
style  = "fg:primary"
format = "[ $symbol($version) ]($style)"

[elm]
symbol = " "
style  = "fg:primary"
format = "[ $symbol($version) ]($style)"

[golang]
symbol = " "
style  = "fg:primary"
format = "[ $symbol($version) ]($style)"

[gradle]
style  = "fg:primary"
format = "[ $symbol($version) ]($style)"

[haskell]
symbol = " "
style  = "fg:primary"
format = "[ $symbol($version) ]($style)"

[java]
symbol = " "
style  = "fg:primary"
format = "[ $symbol($version) ]($style)"

[julia]
symbol = " "
style  = "fg:primary"
format = "[ $symbol($version) ]($style)"

[nodejs]
symbol = " "
style  = "fg:primary"
format = "[ $symbol($version) ]($style)"

[nim]
symbol = "󰆥 "
style  = "fg:primary"
format = "[ $symbol($version) ]($style)"

[python]
symbol = " "
style  = "fg:primary"
format = "[ $symbol($version) ]($style)"

[rust]
symbol = " "
style  = "fg:primary"
format = "[ $symbol($version) ]($style)"

[scala]
symbol = " "
style  = "fg:primary"
format = "[ $symbol($version) ]($style)"

[docker_context]
symbol = " "
style  = "fg:primary"
format = "[ $symbol$context ]($style)"

# ─── Time ────────────────────────────────────────────────────────────────────

[time]
disabled    = false
time_format = "%R"
style       = "fg:muted"
format      = "[ ${timePrefix} $time ]($style)"

# ─── Prompt character ────────────────────────────────────────────────────────

[character]
success_symbol = "[${successSymbol}](fg:accent)"
error_symbol   = "[${successSymbol}](fg:error)"
vimcmd_symbol  = "[${vimSymbol}](fg:primary)"
`;
}

// ── Layout builders ───────────────────────────────────────────────────────────

function buildTwoLineBox(usernameModule) {
  return `format = """
[╭](fg:muted)\\
${usernameModule}$directory\\
$git_branch\\
$git_status\\
$c\\
$cpp\\
$elixir\\
$elm\\
$golang\\
$gradle\\
$haskell\\
$java\\
$julia\\
$nodejs\\
$nim\\
$python\\
$rust\\
$scala\\
$docker_context\\
$cmd_duration\\
$fill\\
$time
[╰─](fg:muted)\\
$character"""`;
}

function buildSingleLine(usernameModule) {
  return `format = """
${usernameModule}$directory\\
$git_branch\\
$git_status\\
$c\\
$cpp\\
$elixir\\
$elm\\
$golang\\
$gradle\\
$haskell\\
$java\\
$julia\\
$nodejs\\
$nim\\
$python\\
$rust\\
$scala\\
$docker_context\\
$cmd_duration\\
$fill\\
$time
$character"""`;
}
