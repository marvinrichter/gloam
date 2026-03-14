import { hex } from "./utils.js";
import { syntaxColors } from "./syntax-map.js";

// IntelliJ stores colors as 6-digit uppercase hex without #
const h6 = (c) => hex(c).toUpperCase().padStart(6, "0");

// An <option name="..." value="..." /> element
const opt = (name, value, indent = "    ") =>
  `${indent}<option name="${name}" value="${value}" />`;

// A color option (value is 6-digit hex)
const colorOpt = (name, color, indent = "    ") =>
  opt(name, h6(color), indent);

export function generateIntellij(theme) {
  const { name, displayName, type, background: bg, foreground: fg, ansi, ui, tokens } = theme;
  const syn = syntaxColors(theme);
  const schemeParent = type === "light" ? "Default" : "Darcula";
  const fullName = displayName || name;

  const ansiColorOpts = ansi
    .map((c, i) => colorOpt(`ANSI_COLOR_${i}`, c))
    .join("\n");

  return `<?xml version="1.0" encoding="UTF-8"?>
<scheme name="${fullName}" version="142" parent_scheme="${schemeParent}">
  <!-- Generated from ${name}.json — do not edit by hand -->
  <!-- Install: copy to ~/.config/JetBrains/<IDE>/colors/${name}.icls -->

  <metaInfo>
    <property name="created">generated</property>
    <property name="ideVersion">2024.1.0.0</property>
    <property name="originalScheme">${fullName}</property>
  </metaInfo>

  <colors>
${colorOpt("CONSOLE_BACKGROUND_KEY",  bg)}
${colorOpt("GUTTER_BACKGROUND",       ansi[8])}
${colorOpt("SELECTION_BACKGROUND",    ui.selection)}
${colorOpt("SELECTION_FOREGROUND",    ui.selectionText)}
${colorOpt("CARET_COLOR",             ui.cursor)}
${colorOpt("LINE_NUMBERS_COLOR",      tokens.muted)}
${colorOpt("LINE_NUMBER_ON_CARET_ROW_COLOR", fg)}
${ansiColorOpts}
  </colors>

  <attributes>
    <option name="TEXT">
      <value>
${colorOpt("FOREGROUND", fg, "        ")}
${colorOpt("BACKGROUND", bg, "        ")}
      </value>
    </option>

    <option name="KEYWORD">
      <value>
${colorOpt("FOREGROUND", syn.keyword, "        ")}
${opt("FONT_TYPE", "1", "        ")}
      </value>
    </option>

    <option name="STRING">
      <value>
${colorOpt("FOREGROUND", syn.string, "        ")}
      </value>
    </option>

    <option name="NUMBER">
      <value>
${colorOpt("FOREGROUND", syn.number, "        ")}
      </value>
    </option>

    <option name="COMMENT">
      <value>
${colorOpt("FOREGROUND", syn.comment, "        ")}
${opt("FONT_TYPE", "2", "        ")}
      </value>
    </option>

    <option name="LINE_COMMENT">
      <value>
${colorOpt("FOREGROUND", syn.comment, "        ")}
${opt("FONT_TYPE", "2", "        ")}
      </value>
    </option>

    <option name="BLOCK_COMMENT">
      <value>
${colorOpt("FOREGROUND", syn.comment, "        ")}
${opt("FONT_TYPE", "2", "        ")}
      </value>
    </option>

    <option name="CLASS_NAME_ATTRIBUTES">
      <value>
${colorOpt("FOREGROUND", syn.class, "        ")}
      </value>
    </option>

    <option name="INTERFACE_NAME_ATTRIBUTES">
      <value>
${colorOpt("FOREGROUND", syn.type, "        ")}
      </value>
    </option>

    <option name="METHOD_DECLARATION_ATTRIBUTES">
      <value>
${colorOpt("FOREGROUND", syn.function, "        ")}
      </value>
    </option>

    <option name="FUNCTION_CALL_ATTRIBUTES">
      <value>
${colorOpt("FOREGROUND", syn.function, "        ")}
      </value>
    </option>

    <option name="VARIABLE">
      <value>
${colorOpt("FOREGROUND", syn.variable, "        ")}
      </value>
    </option>

    <option name="LOCAL_VARIABLE_ATTRIBUTES">
      <value>
${colorOpt("FOREGROUND", syn.variable, "        ")}
      </value>
    </option>

    <option name="PARAMETER_ATTRIBUTES">
      <value>
${colorOpt("FOREGROUND", fg, "        ")}
      </value>
    </option>

    <option name="CONSTANT_ATTRIBUTES">
      <value>
${colorOpt("FOREGROUND", syn.constant, "        ")}
      </value>
    </option>

    <option name="INSTANCE_FIELD_ATTRIBUTES">
      <value>
${colorOpt("FOREGROUND", tokens.primary, "        ")}
      </value>
    </option>

    <option name="STATIC_FIELD_ATTRIBUTES">
      <value>
${colorOpt("FOREGROUND", syn.constant, "        ")}
      </value>
    </option>

    <option name="OPERATION_SIGN_ATTRIBUTES">
      <value>
${colorOpt("FOREGROUND", syn.operator, "        ")}
      </value>
    </option>

    <option name="BRACKETS_ATTRIBUTES">
      <value>
${colorOpt("FOREGROUND", syn.punctuation, "        ")}
      </value>
    </option>

    <option name="ERROR_ATTRIBUTES">
      <value>
${colorOpt("FOREGROUND", syn.error, "        ")}
        <option name="EFFECT_TYPE" value="1" />
      </value>
    </option>

    <option name="WARNING_ATTRIBUTES">
      <value>
${colorOpt("FOREGROUND", syn.warning, "        ")}
        <option name="EFFECT_TYPE" value="1" />
      </value>
    </option>

    <option name="TERMINAL_COMMAND_TO_RUN_USING_IDE_ATTRIBUTES">
      <value>
${colorOpt("FOREGROUND", tokens.primary, "        ")}
      </value>
    </option>
  </attributes>
</scheme>
`;
}
