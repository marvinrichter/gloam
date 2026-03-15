/**
 * Oh My Posh theme generator.
 * Produces a .omp.json file for ~/.config/oh-my-posh/themes/<name>.omp.json
 *
 * Oh My Posh theme docs: https://ohmyposh.dev/docs/configuration/overview
 */
export function generateOhMyPosh(theme) {
  const { name, displayName, background: bg, foreground: fg, tokens, prompt } = theme;
  const title = displayName || name;

  // Segment text colors follow the same semantic rule as Starship:
  //   muted  → chrome (left/right decorators, time)
  //   primary → navigation (path)
  //   accent  → git, prompt character
  //   error   → error state

  const t = tokens;

  const omp = {
    $schema: "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
    version: 2,
    final_space: true,
    console_title_template: "{{ .Shell }} in {{ .Folder }}",
    blocks: [
      // ── Line 1 ──────────────────────────────────────────────────────────
      {
        type: "prompt",
        alignment: "left",
        newline: true,
        segments: [
          // Opening bracket
          ...(prompt.layout === "two-line-box"
            ? [
                {
                  type: "text",
                  style: "plain",
                  foreground: t.muted,
                  template: "╭",
                },
              ]
            : []),
          // Session (user) — only when showUsername is true
          ...(prompt.showUsername
            ? [
                {
                  type: "session",
                  style: "plain",
                  foreground: t.muted,
                  template: " {{ .UserName }} ",
                },
              ]
            : []),
          // Path
          {
            type: "path",
            style: "plain",
            foreground: t.primary,
            properties: {
              style: "folder",
              max_depth: 3,
              folder_separator_icon: "/",
            },
            template: " <b>{{ .Path }}</b> ",
          },
          // Git branch + status
          {
            type: "git",
            style: "plain",
            foreground: t.accent,
            properties: {
              branch_icon: " ",
              fetch_status: true,
            },
            template:
              " {{ .HEAD }}{{ if .Working.Changed }}  {{ .Working.String }}{{ end }}{{ if .Staging.Changed }}  {{ .Staging.String }}{{ end }} ",
          },
          // Command duration
          {
            type: "executiontime",
            style: "plain",
            foreground: t.muted,
            properties: {
              threshold: 2000,
              style: "round",
            },
            template: " ◆ {{ .FormattedMs }} ",
          },
        ],
      },
      // ── Line 1 right (time) ──────────────────────────────────────────────
      {
        type: "prompt",
        alignment: "right",
        segments: [
          {
            type: "time",
            style: "plain",
            foreground: t.muted,
            properties: {
              time_format: "15:04",
            },
            template: " ${prompt.timePrefix} {{ .CurrentDate | date .Format }} ",
          },
        ],
      },
      // ── Line 2 (cursor line) ─────────────────────────────────────────────
      {
        type: "prompt",
        alignment: "left",
        newline: true,
        segments: [
          ...(prompt.layout === "two-line-box"
            ? [
                {
                  type: "text",
                  style: "plain",
                  foreground: t.muted,
                  template: "╰─",
                },
              ]
            : []),
          {
            type: "status",
            style: "plain",
            foreground: t.accent,
            foreground_templates: ["{{ if gt .Code 0 }}${t.error}{{ end }}"],
            properties: {
              always_enabled: true,
            },
            template: `${prompt.successSymbol} `,
          },
        ],
      },
    ],
    palette: {
      background: bg,
      foreground: fg,
      primary: t.primary,
      accent: t.accent,
      muted: t.muted,
      error: t.error,
    },
  };

  return `// ${title} — Oh My Posh theme
// Generated from ${name}.json — do not edit by hand
//
// Install: copy to ~/.config/oh-my-posh/themes/${name}.omp.json
//          then set: oh-my-posh init <shell> --config ~/.config/oh-my-posh/themes/${name}.omp.json

${JSON.stringify(omp, null, 2)}
`;
}
