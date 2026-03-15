// Minimal but complete theme used across all generator tests.
// Matches the source-of-truth JSON schema exactly.
export const theme = {
  name: "testtheme",
  type: "dark",
  background: "#0D0F1A",
  foreground: "#F0EAD6",
  tokens: {
    primary: "#E8B86D",
    accent: "#FF7F57",
    muted: "#8B84C4",
    error: "#E85D5D",
  },
  ansi: [
    "#0D0F1A", // 0  black
    "#C85A5A", // 1  red
    "#6BB08A", // 2  green
    "#C4983A", // 3  yellow
    "#6B64A8", // 4  blue
    "#A870BC", // 5  magenta
    "#4A9CA8", // 6  cyan
    "#B8B0CC", // 7  white
    "#2A2D3E", // 8  bright black
    "#E87070", // 9  bright red
    "#7EC99A", // 10 bright green
    "#E8B86D", // 11 bright yellow
    "#8B84C4", // 12 bright blue
    "#C490D1", // 13 bright magenta
    "#5FB8C0", // 14 bright cyan
    "#F0EAD6", // 15 bright white
  ],
  ui: {
    cursor: "#FF7F57",
    cursorText: "#0D0F1A",
    selection: "#1E2040",
    selectionText: "#F0EAD6",
    bold: "#F0EAD6",
    link: "#B8B4E8",
  },
};

// A minimal light theme for testing light-theme branches.
export const lightTheme = {
  ...theme,
  name: "lighttest",
  displayName: "Light Test",
  type: "light",
  background: "#EDE0C8",
  foreground: "#2A1E12",
};
