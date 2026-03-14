# Security Policy

## Supported versions

| Version | Supported |
|---------|-----------|
| latest  | Yes       |

gloam is a static theme collection with no runtime, no authentication, and no network code.

**Installer scope:** The installer (`scripts/install.js`) reads and writes files only within the user's home directory (`~/.config/`) and the local gloam repository. It does not execute generated files, make network requests, or access credentials. Users who want to audit the files before committing them to a dotfiles repository can inspect the generated output in `themes/<name>/` before running the installer.

**Generated file safety:** Generated config files are pure text (TOML, Lua, JSON, XML). They contain no executable code. The Starship TOML uses color palette names — these are not evaluated as shell expressions. The Neovim Lua file sets highlight groups — it does not call `os.execute` or equivalent. The IntelliJ `.icls` file is an XML color scheme — it is not executed.

**The attack surface is limited to:**

- The installer writing to user config paths (path traversal risk if theme names are malformed — mitigated by the fact that theme names are discovered from the local `themes/` directory, not from user input)
- The Node.js generator process reading theme JSON files

If you find a problem with the generator that could produce malicious output (e.g. shell injection in a generated config file, path traversal in file writes), please report it privately.

## Reporting a vulnerability

**Do not open a public GitHub issue for security concerns.**

If you find a problem with the generator that could produce malicious output (e.g. shell injection in a generated config file, path traversal in file writes), please report it privately:

- Open a [GitHub Security Advisory](https://github.com/marvinrichter/gloam/security/advisories/new) (preferred)
- Or email the maintainer directly — find the address in the git commit history

**Response time:** within 7 days
**Disclosure timeline:** coordinated disclosure after a fix is released

Credit will be given in the CHANGELOG unless you prefer to remain anonymous.
