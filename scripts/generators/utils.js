// Strip leading # from hex color string.
// Throws if the result is not exactly 6 hex digits (rejects 3-digit shorthand and malformed values).
export const hex = (c) => {
  const stripped = c.replace(/^#/, "");
  if (!/^[0-9A-Fa-f]{6}$/.test(stripped)) {
    throw new Error(`Invalid hex color "${c}" — expected a 6-digit hex value like #RRGGBB`);
  }
  return stripped;
};

// Return float component 0.0–1.0 from a hex color string at byte position.
// pos: 0=R, 2=G, 4=B (each 2 hex chars)
export const component = (color, pos) =>
  parseInt(hex(color).slice(pos, pos + 2), 16) / 255;

// r, g, b as floats
export const rgb = (color) => ({
  r: component(color, 0),
  g: component(color, 2),
  b: component(color, 4),
});
