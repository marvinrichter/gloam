import { readFileSync } from "node:fs";
import { join } from "node:path";
import { renameSync } from "node:fs";
import { copy, writeJson, readJson, capitalize } from "./_helpers.js";

export function create({ src, loadMeta, home, repo }) {
  return function installVscode(name) {
    const meta = loadMeta(name);
    const uiTheme = meta.type === "light" ? "vs" : "vs-dark";
    const display = capitalize(name);
    const extDir = join(home, ".vscode", "extensions", `gloam-${name}`);
    const { version } = JSON.parse(readFileSync(join(repo, "package.json"), "utf8"));

    copy(join(src(name), "vscode.json"), join(extDir, "themes", `${name}.json`));

    writeJson(join(extDir, "package.json"), {
      name: `gloam-${name}`,
      publisher: "gloam",
      displayName: `Gloam \u2014 ${display}`,
      version,
      engines: { vscode: "^1.70.0" },
      categories: ["Themes"],
      contributes: {
        themes: [
          {
            label: `Gloam ${display}`,
            uiTheme,
            path: `./themes/${name}.json`,
          },
        ],
      },
    });

    // Register the extension in VS Code's extensions registry so it is
    // discovered on the next reload (VS Code does not scan arbitrary
    // sub-directories — it uses extensions.json as its source of truth).
    // displayName goes through writeJson → JSON.stringify, so special chars are safe.
    const registryPath = join(home, ".vscode", "extensions", "extensions.json");
    const registry = readJson(registryPath) ?? [];
    const extId = `gloam.gloam-${name}`;
    const filtered = registry.filter((e) => e.identifier?.id !== extId);
    filtered.push({
      identifier: { id: extId },
      version,
      location: { $mid: 1, path: extDir, scheme: "file" },
      relativeLocation: `gloam-${name}`,
      metadata: { installedTimestamp: Date.now(), source: "local" },
    });
    const tmpRegistryPath = registryPath + ".tmp";
    writeJson(tmpRegistryPath, filtered);
    renameSync(tmpRegistryPath, registryPath);

    return `installed extension → ${extDir}\n  Reload VS Code, then Cmd+K Cmd+T`;
  };
}
