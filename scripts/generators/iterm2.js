import { component } from "./utils.js";

// Format a float to 5 decimal places (matches iTerm2 plist precision)
const f = (n) => n.toFixed(5);

// Generate a plist <dict> block for one color
function colorDict(hex) {
  return [
    `\t<dict>`,
    `\t\t<key>Blue Component</key>`,
    `\t\t<real>${f(component(hex, 4))}</real>`,
    `\t\t<key>Color Space</key>`,
    `\t\t<string>Calibrated</string>`,
    `\t\t<key>Green Component</key>`,
    `\t\t<real>${f(component(hex, 2))}</real>`,
    `\t\t<key>Red Component</key>`,
    `\t\t<real>${f(component(hex, 0))}</real>`,
    `\t</dict>`,
  ].join("\n");
}

function colorEntry(label, hex, comment) {
  const commentLine = comment ? `\n\t<!-- ${comment} -->` : "";
  return `\t<key>${label}</key>${commentLine}\n${colorDict(hex)}`;
}

export function generateIterm2(theme) {
  const { name, displayName, background: bg, foreground: fg, ansi, ui } = theme;
  const title = displayName || name;

  const ansiNormalEntries = ansi.slice(0, 8).map((c, i) =>
    colorEntry(`Ansi ${i} Color`, c)
  ).join("\n\n");

  const ansiBrightEntries = ansi.slice(8, 16).map((c, i) =>
    colorEntry(`Ansi ${i + 8} Color`, c)
  ).join("\n\n");

  return `<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">

<!--
  ${title} — iTerm2 color theme
  Generated from ${name}.json — do not edit by hand

  Install: Preferences › Profiles › Colors › Color Presets ▾ › Import…
  then select "${title}" from the preset list
-->

<dict>

\t<!-- ── ANSI Normal ──────────────────────────────────────────────────────── -->

${ansiNormalEntries}

\t<!-- ── ANSI Bright ──────────────────────────────────────────────────────── -->

${ansiBrightEntries}

\t<!-- ── UI Colors ────────────────────────────────────────────────────────── -->

${colorEntry("Background Color",    bg,           `${bg}`)}

${colorEntry("Foreground Color",    fg,           `${fg}`)}

${colorEntry("Bold Color",          ui.bold,      `same as foreground — weight carries bold, not hue`)}

${colorEntry("Cursor Color",        ui.cursor,    `${ui.cursor} — accent color, stands out immediately`)}

${colorEntry("Cursor Text Color",   ui.cursorText,`dark bg inside cursor block for contrast`)}

${colorEntry("Link Color",          ui.link,      `${ui.link}`)}

${colorEntry("Selected Text Color", ui.selectionText, `keep foreground color on selection`)}

${colorEntry("Selection Color",     ui.selection, `${ui.selection} — visible but not jarring`)}

</dict>
</plist>
`;
}
