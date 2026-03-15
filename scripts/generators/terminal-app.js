import { component } from "./utils.js";

/**
 * Apple Terminal.app theme generator.
 * Produces a .terminal file (XML plist) that Terminal.app can import.
 *
 * Each color in Terminal.app is stored as a base64-encoded NSKeyedArchiver
 * binary plist containing a single NSColor object with NSColorSpace=1
 * (calibrated RGB) and an NSRGB data blob of the form "r g b\0".
 *
 * Install:
 *   Terminal › Preferences › Profiles › ⚙ › Import…
 *   then select the profile from the Profiles list and click "Default"
 */

// ── Binary plist encoder ─────────────────────────────────────────────────────

/**
 * Encode a value into a binary plist object byte sequence.
 * Returns a Buffer.
 */
function encodeObject(val, type) {
  if (type === "string") {
    const bytes = Buffer.from(val, "ascii");
    return prefixed(0x50, bytes);
  }
  if (type === "int") {
    if (val < 0x100) return Buffer.from([0x10, val]);
    if (val < 0x10000) {
      const b = Buffer.alloc(3);
      b[0] = 0x11; b.writeUInt16BE(val, 1);
      return b;
    }
    const b = Buffer.alloc(5);
    b[0] = 0x12; b.writeUInt32BE(val, 1);
    return b;
  }
  if (type === "data") {
    // val is a Buffer
    return prefixed(0x40, val);
  }
  if (type === "uid") {
    // 1-byte UID
    return Buffer.from([0x80, val]);
  }
  if (type === "array") {
    // val is array of ref indices (1-byte each)
    if (val.length < 15) {
      return Buffer.concat([Buffer.from([0xa0 | val.length]), Buffer.from(val)]);
    }
    const lenBuf = encodeIntLen(val.length);
    return Buffer.concat([Buffer.from([0xaf]), lenBuf, Buffer.from(val)]);
  }
  if (type === "dict") {
    // val is {keys: [], values: []} arrays of ref indices
    const n = val.keys.length;
    const header = n < 15
      ? Buffer.from([0xd0 | n])
      : Buffer.concat([Buffer.from([0xdf]), encodeIntLen(n)]);
    const refs = Buffer.from([...val.keys, ...val.values]);
    return Buffer.concat([header, refs]);
  }
  throw new Error(`Unknown bplist type: ${type}`);
}

function encodeIntLen(n) {
  if (n < 0x100) return Buffer.from([0x10, n]);
  if (n < 0x10000) { const b = Buffer.alloc(3); b[0] = 0x11; b.writeUInt16BE(n, 1); return b; }
  const b = Buffer.alloc(5); b[0] = 0x12; b.writeUInt32BE(n, 1); return b;
}

function prefixed(typeNibble, bytes) {
  if (bytes.length < 15) {
    return Buffer.concat([Buffer.from([typeNibble | bytes.length]), bytes]);
  }
  const lenBuf = encodeIntLen(bytes.length);
  return Buffer.concat([Buffer.from([typeNibble | 0xf]), lenBuf, bytes]);
}

/**
 * Build a binary plist blob encoding a single NSColor (sRGB) from a hex string.
 * Returns a Buffer.
 *
 * The NSKeyedArchiver $objects array:
 *   [0] = "$null"
 *   [1] = {$class→UID(2), NSColorSpace→1, NSRGB→<data>}  (the NSColor)
 *   [2] = {$classname→"NSColor", $classes→["NSColor","NSObject"]}
 *
 * Binary plist object table (25 objects, indices 0–24):
 *   0  ROOT dict        {$archiver→1, $objects→4, $top→20, $version→24val}
 *   1  "$archiver"      string
 *   2  "NSKeyedArchiver" string
 *   3  "$objects"       string
 *   4  array            [$null, NSColorDict, ClassDesc] = refs [5, 6, 13]
 *   5  "$null"          string
 *   6  NSColor dict     {$class→8, NSColorSpace→10, NSRGB→12}
 *   7  "$class"         string
 *   8  UID(2)           references $objects[2] = ClassDesc
 *   9  "NSColorSpace"   string
 *  10  int 1            NSColorSpace=1 = calibrated RGB
 *  11  "NSRGB"          string
 *  12  data             "r g b\x00" component bytes
 *  13  ClassDesc dict   {$classname→15, $classes→17}
 *  14  "$classname"     string
 *  15  "NSColor"        string
 *  16  "$classes"       string
 *  17  array            ["NSColor","NSObject"] = refs [15, 18]
 *  18  "NSObject"       string
 *  19  "$top"           string
 *  20  $top dict        {root→22}
 *  21  "root"           string
 *  22  UID(1)           references $objects[1] = NSColor
 *  23  "$version"       string
 *  24  int 100000
 */
function nsColorBplist(hexColor) {
  // NSRGB data: "r g g\x00" with 5 decimal places
  const f = (v) => v.toFixed(5);
  const r = component(hexColor, 0);
  const g = component(hexColor, 2);
  const b = component(hexColor, 4);
  const rgbStr = `${f(r)} ${f(g)} ${f(b)}\x00`;
  const rgbData = Buffer.from(rgbStr, "ascii");

  // Encode each object in order
  const objs = [
    // 0: ROOT dict {1→2, 3→4, 19→20, 23→24}
    encodeObject({ keys: [1, 3, 19, 23], values: [2, 4, 20, 24] }, "dict"),
    // 1: "$archiver"
    encodeObject("$archiver", "string"),
    // 2: "NSKeyedArchiver"
    encodeObject("NSKeyedArchiver", "string"),
    // 3: "$objects"
    encodeObject("$objects", "string"),
    // 4: array [$null(5), NSColorDict(6), ClassDesc(13)]
    encodeObject([5, 6, 13], "array"),
    // 5: "$null"
    encodeObject("$null", "string"),
    // 6: NSColor dict {$class→8, NSColorSpace→10, NSRGB→12}
    encodeObject({ keys: [7, 9, 11], values: [8, 10, 12] }, "dict"),
    // 7: "$class"
    encodeObject("$class", "string"),
    // 8: UID(2) → $objects[2] = ClassDesc
    encodeObject(2, "uid"),
    // 9: "NSColorSpace"
    encodeObject("NSColorSpace", "string"),
    // 10: int 1
    encodeObject(1, "int"),
    // 11: "NSRGB"
    encodeObject("NSRGB", "string"),
    // 12: data (RGB bytes)
    encodeObject(rgbData, "data"),
    // 13: ClassDesc dict {$classname→15, $classes→17}
    encodeObject({ keys: [14, 16], values: [15, 17] }, "dict"),
    // 14: "$classname"
    encodeObject("$classname", "string"),
    // 15: "NSColor"
    encodeObject("NSColor", "string"),
    // 16: "$classes"
    encodeObject("$classes", "string"),
    // 17: array [NSColor(15), NSObject(18)]
    encodeObject([15, 18], "array"),
    // 18: "NSObject"
    encodeObject("NSObject", "string"),
    // 19: "$top"
    encodeObject("$top", "string"),
    // 20: $top dict {root→22}
    encodeObject({ keys: [21], values: [22] }, "dict"),
    // 21: "root"
    encodeObject("root", "string"),
    // 22: UID(1) → $objects[1] = NSColor
    encodeObject(1, "uid"),
    // 23: "$version"
    encodeObject("$version", "string"),
    // 24: int 100000
    encodeObject(100000, "int"),
  ];

  const header = Buffer.from("bplist00");
  const nObjs = objs.length; // 25

  // Build offset table: track cumulative offset of each object
  const offsets = [];
  let cursor = header.length;
  for (const obj of objs) {
    offsets.push(cursor);
    cursor += obj.length;
  }

  // Choose offsetSize (1 byte if all offsets < 256, else 2)
  const maxOffset = Math.max(...offsets);
  const offsetSize = maxOffset < 256 ? 1 : 2;

  // Build offset table buffer
  const offsetTableBuf = Buffer.alloc(nObjs * offsetSize);
  for (let i = 0; i < nObjs; i++) {
    if (offsetSize === 1) {
      offsetTableBuf.writeUInt8(offsets[i], i);
    } else {
      offsetTableBuf.writeUInt16BE(offsets[i], i * 2);
    }
  }

  const offsetTableOffset = cursor;

  // Trailer: 6 fill bytes, sortVersion(1), offsetSize(1), refSize(1),
  //          nObjects(8), topObject(8), offsetTableOffset(8)
  const trailer = Buffer.alloc(32, 0);
  trailer[6] = 0;                           // sort version
  trailer[7] = offsetSize;
  trailer[8] = 1;                           // refSize = 1 byte
  trailer.writeBigUInt64BE(BigInt(nObjs), 9 - 1);  // nObjects at offset 8
  // Actually trailer layout:
  //   [0..5]  = fill (0x00)
  //   [6]     = sort version
  //   [7]     = offset int size
  //   [8]     = object ref size
  //   [9..16] = number of objects (8 bytes)
  //   [17..24]= offset of top object (8 bytes, always 0)
  //   [25..32]= offset of offset table (8 bytes)
  // Total = 32 bytes (actually it's 32 bytes: [0..5]=6, [6]=1, [7]=1, [8]=1, then 8+8+8=24 → total 6+1+1+1+8+8+8=33? No...)
  //
  // Actual binary plist trailer (from Apple source) — 32 bytes:
  // 6 unused bytes, then:
  //   1 byte:  sort version
  //   1 byte:  offset table offset size
  //   1 byte:  object table ref size
  //   8 bytes: number of objects
  //   8 bytes: top object index
  //   8 bytes: offset table offset
  // Total: 6+1+1+1+8+8+8 = 33? No wait: 6+1+1+1 = 9, not 6.
  // Actually: padding is 6 bytes, so total = 6+26 = 32 bytes.
  // Let me redo with indices:
  // [0..5]   = 0x00 (6 bytes padding)
  // [6]      = sortVersion (1 byte)
  // [7]      = offsetIntSize (1 byte)
  // [8]      = objRefSize (1 byte)
  // [9..16]  = numObjects (8 bytes big-endian) → 9 to 16 = 8 bytes, total through 16
  // [17..24] = topObject (8 bytes) → 0 (root is always object 0)
  // [25..32] = offsetTableOffset (8 bytes) → but that's byte 32 = index 32, which is 33rd byte?
  // Hmm, 6+1+1+1+8+8+8=33 bytes, but Apple says 32.
  //
  // Let me look at it differently. The real layout is:
  // unused[6], sortVersion[1], offsetIntSize[1], objRefSize[1],
  //   numObjects[8], topObjectIndex[8], offsetTableOffset[8]
  // = 6+1+1+1+8+8+8 = 33 bytes... that's not 32.
  //
  // OR maybe it's: unused[5], sortVersion[1], offsetIntSize[1], objRefSize[1],
  //   numObjects[8], topObjectIndex[8], offsetTableOffset[8]
  // = 5+1+1+1+8+8+8 = 32 bytes. Yes, 5 unused bytes!

  // Let me just use the correct layout from the binary plist spec:
  // Trailer is 32 bytes at the end:
  //   bytes 0-5:  unused (6 bytes, written as 0)
  //   byte  6:    sort version (0)
  //   byte  7:    offset table int size in bytes
  //   byte  8:    object ref size in bytes
  //   bytes 9-16: number of objects (int64 big-endian)  — that's 8 bytes: 9,10,11,12,13,14,15,16 = 8 bytes through index 16
  //   bytes 17-24: top object (int64 big-endian) — 8 bytes: 17..24
  //   bytes 25-32: offset table offset (int64) — but wait, byte 25 to 32 is 8 bytes ending at index 32, meaning 33 bytes?
  //
  // Argh. Let me just use the well-known 32-byte trailer layout that works in practice:
  // Based on actual Apple implementation, the 32-byte trailer is:
  //   [0..5]  = 6 fill bytes (0)
  //   [6]     = sort version (0)
  //   [7]     = offsetIntSize
  //   [8]     = objRefSize
  //   [9..16] = count (int64 BE, 8 bytes) -- indices 9,10,11,12,13,14,15,16
  //   [17..24]= topObj (int64 BE, 8 bytes) -- indices 17,18,19,20,21,22,23,24
  //   [25..31]= offsetTableOffset (int64 BE lower 7 bytes? no...)
  //
  // You know what, I'll just look at the actual byte offsets. 32 bytes = indices 0..31.
  // 6+1+1+1+8+8+8 = 33. That's one too many.
  // Perhaps it's: 5 unused + 1 sort + 1 offsetSize + 1 refSize + 8 + 8 + 8 = 32. Yes!
  // 5 unused bytes (not 6).

  // Let me write the correct trailer:
  const correctTrailer = Buffer.alloc(32, 0);
  // bytes [0..4] = 0 (5 unused)
  // byte  [5]  = sort version = 0
  // byte  [6]  = offsetIntSize
  correctTrailer[6] = offsetSize;
  // byte  [7]  = objRefSize = 1
  correctTrailer[7] = 1;
  // bytes [8..15] = numObjects (int64 BE)
  correctTrailer.writeBigUInt64BE(BigInt(nObjs), 8);
  // bytes [16..23] = topObject index (int64 BE) = 0
  correctTrailer.writeBigUInt64BE(BigInt(0), 16);
  // bytes [24..31] = offsetTableOffset (int64 BE)
  correctTrailer.writeBigUInt64BE(BigInt(offsetTableOffset), 24);

  return Buffer.concat([header, ...objs, offsetTableBuf, correctTrailer]);
}

// ── Color entry helper ────────────────────────────────────────────────────────

function colorData(hex) {
  return nsColorBplist(hex).toString("base64");
}

// ── Terminal.app profile generator ───────────────────────────────────────────

export function generateTerminalApp(theme) {
  const { name, displayName, background: bg, foreground: fg, ansi, ui } = theme;
  const title = displayName || name;

  const ansiNames = [
    "ANSIBlackColor",     "ANSIRedColor",     "ANSIGreenColor",    "ANSIYellowColor",
    "ANSIBlueColor",      "ANSIMagentaColor", "ANSICyanColor",     "ANSIWhiteColor",
    "ANSIBrightBlackColor","ANSIBrightRedColor","ANSIBrightGreenColor","ANSIBrightYellowColor",
    "ANSIBrightBlueColor","ANSIBrightMagentaColor","ANSIBrightCyanColor","ANSIBrightWhiteColor",
  ];

  const ansiEntries = ansi.map((c, i) => `\t\t<key>${ansiNames[i]}</key>
\t\t<data>
\t\t${colorData(c)}
\t\t</data>`).join("\n\n");

  return `<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<!--
  ${title} — Apple Terminal.app profile
  Generated from ${name}.json — do not edit by hand

  Install: Terminal › Preferences › Profiles › ⚙ › Import…
  then select "${title}" from the list and click "Default"
-->
<dict>
\t<key>name</key>
\t<string>${title}</string>
\t<key>ProfileCurrentVersion</key>
\t<real>2.07</real>
\t<key>type</key>
\t<string>Window Settings</string>

\t<!-- ── Background & Text ──────────────────────────────────────────────── -->

\t<key>BackgroundColor</key>
\t<data>
\t${colorData(bg)}
\t</data>

\t<key>TextColor</key>
\t<data>
\t${colorData(fg)}
\t</data>

\t<key>BoldTextColor</key>
\t<data>
\t${colorData(ui.bold)}
\t</data>

\t<!-- ── Cursor ────────────────────────────────────────────────────────── -->

\t<key>CursorColor</key>
\t<data>
\t${colorData(ui.cursor)}
\t</data>

\t<key>CursorTextColor</key>
\t<data>
\t${colorData(ui.cursorText)}
\t</data>

\t<!-- ── Selection ─────────────────────────────────────────────────────── -->

\t<key>SelectionColor</key>
\t<data>
\t${colorData(ui.selection)}
\t</data>

\t<!-- ── ANSI ──────────────────────────────────────────────────────────── -->

${ansiEntries}

\t<!-- ── Font & appearance ─────────────────────────────────────────────── -->

\t<key>Font</key>
\t<data>
\tYnBsaXN0MDDQCAAAAAAAAAEBAAAAAAAAAAoAAAAAAAAAAAAAAAAAAAAL
\t</data>
\t<key>FontAntialias</key>
\t<true/>
\t<key>UseBrightBold</key>
\t<false/>

</dict>
</plist>
`;
}
