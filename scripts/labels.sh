#!/usr/bin/env bash
# Apply the gloam label taxonomy to the GitHub repository.
# Requires: gh CLI authenticated with repo write access.
# Usage: bash scripts/labels.sh

set -euo pipefail

REPO="marvinrichter/gloam"

echo "Applying label taxonomy to ${REPO}..."

# ── Type ──────────────────────────────────────────────────────────────
gh label create "bug"             --repo "$REPO" --color "d73a4a" --description "Something is broken"                          --force
gh label create "enhancement"     --repo "$REPO" --color "a2eeef" --description "New feature or improvement"                   --force
gh label create "new-theme"       --repo "$REPO" --color "7057ff" --description "Proposal or PR for a new theme"               --force
gh label create "new-format"      --repo "$REPO" --color "0075ca" --description "New target application format"                --force
gh label create "docs"            --repo "$REPO" --color "0052cc" --description "Documentation change"                         --force
gh label create "chore"           --repo "$REPO" --color "e4e669" --description "Maintenance, dependency updates, tooling"     --force
gh label create "question"        --repo "$REPO" --color "d876e3" --description "Further information requested"                --force

# ── Status ────────────────────────────────────────────────────────────
gh label create "needs-triage"    --repo "$REPO" --color "fbca04" --description "Not yet reviewed by maintainer"               --force
gh label create "needs-info"      --repo "$REPO" --color "fef3c7" --description "Awaiting more detail from reporter"           --force
gh label create "in-progress"     --repo "$REPO" --color "0e8a16" --description "Actively being worked on"                    --force
gh label create "blocked"         --repo "$REPO" --color "e11d48" --description "Waiting on external dependency"               --force
gh label create "wontfix"         --repo "$REPO" --color "ffffff" --description "Out of scope or by design"                   --force

# ── Priority ──────────────────────────────────────────────────────────
gh label create "p1-high"         --repo "$REPO" --color "dc2626" --description "Broken output, wrong contrast, missing glyph" --force
gh label create "p2-medium"       --repo "$REPO" --color "f59e0b" --description "Minor visual issue or UX gap"                 --force
gh label create "p3-low"          --repo "$REPO" --color "6b7280" --description "Nice to have"                                --force

# ── Contributor ───────────────────────────────────────────────────────
gh label create "good first issue" --repo "$REPO" --color "7057ff" --description "Good for first-time contributors"            --force
gh label create "help wanted"      --repo "$REPO" --color "008672" --description "Contributions especially welcome here"       --force

echo "Done."
