# Security Policy

## Supported versions

| Version | Supported |
|---------|-----------|
| latest  | Yes       |

gloam is a static theme collection with no runtime, no authentication, and no network code. The attack surface is limited to the generated config files and the Node.js generator.

## Reporting a vulnerability

**Do not open a public GitHub issue for security concerns.**

If you find a problem with the generator that could produce malicious output (e.g. shell injection in a generated config file, path traversal in file writes), please report it privately:

- Open a [GitHub Security Advisory](https://github.com/marvinrichter/gloam/security/advisories/new) (preferred)
- Or email the maintainer directly — find the address in the git commit history

**Response time:** within 7 days
**Disclosure timeline:** coordinated disclosure after a fix is released

Credit will be given in the CHANGELOG unless you prefer to remain anonymous.
