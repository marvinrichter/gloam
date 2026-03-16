# Cinder — Design System

> A terminal prompt and editor color theme for warm charcoal after the fire goes out.

---

## Concept

Cinder captures charcoal after the fire goes out — warm ash grey with the faint residual heat of ember still in it, the specific grey that is neither cool nor black but holds temperature memory. Not fire itself, not the neutral grey of concrete: the grey that exists for the hour after the last flame.

Every design decision maps to that state:

| Decision | Reasoning |
|---|---|
| Background `#0D0B09` | Near-black, warm charcoal — the core of spent coal still holding heat |
| Foreground `#E4DCD0` | Pale ash-cream — fine grey ash in diffuse light |
| Primary `#C0A070` | Warm ash-gold — where the residual heat still glows in the charcoal |
| Accent `#B08858` | Ember-touched bronze — the deeper ember glow still visible |
| Muted `#988070` | Grey-brown ash — the surrounding cooler material |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against the background `#0D0B09`.

```
primary    #C0A070   hsl(36°, 37%, 59%)   ash-gold           8.0:1  AAA
accent     #B08858   hsl(30°, 32%, 52%)   ember bronze       6.1:1  AA
muted      #988070   hsl(24°, 17%, 51%)   grey-brown ash     5.3:1  AA
error      #D85040   hsl(10°, 64%, 55%)   red-ash            4.8:1  AA
```

### Assignment rules

```
  user  ~/path  branch status  ·····················  ◒ time
❯
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.** The `◒` (half-filled circle) evokes an ash ring — a circle that was once fully filled with fire, now half extinguished.

---

## ANSI Palette

### Full palette

```
Normal                            Bright
────────────────────────────────  ──────────────────────────────────
0  #0D0B09  cinder-black          8  #282218  dim warm ash
1  #A84038  dim ember-red         9  #D85040  red-ash ← error
2  #708060  muted warm olive      10 #90A078  lighter warm olive
3  #A07840  warm ochre            11 #C0A070  ash-gold ← primary
4  #787060  warm grey-brown       12 #988070  grey ash ← muted
5  #907870  dusty rose-brown      13 #B09890  lighter dusty
6  #708880  grey-teal complement  14 #90A898  lighter blue-ash
7  #C0B8A8  warm ash-grey         15 #E4DCD0  pale ash-cream ← foreground
```

### UI color slots

```
Background     #0D0B09  cinder-black
Foreground     #E4DCD0  pale ash-cream
Bold           #E4DCD0  same as foreground
Cursor         #B08858  ember bronze — accent token
Cursor text    #0D0B09  background inside cursor block
Selection      #251E14  dark warm ash highlight
Selected text  #E4DCD0  foreground on selection
Links          #D8C090  warm gold link
```

---

## Prompt Anatomy

### Layout

```
  marvin  ~/gloam   main ~2  ·····················  ◒ 14:32
❯
```

Single line. The `◒` (circle with lower half black) is a half-ring — a circle half-filled with ash. The other half is already cooling.

### Structural elements

```
·   U+00B7  MIDDLE DOT  (fill character)
◒   U+25D2  CIRCLE WITH LOWER HALF BLACK  (time prefix — ash ring, half cooled)
❯   U+276F  HEAVY RIGHT-POINTING ANGLE QUOTATION MARK ORNAMENT
❮   U+276E  HEAVY LEFT-POINTING ANGLE QUOTATION MARK ORNAMENT  (vim normal)
```

---

## Contrast Compliance

All tokens verified against background `#0D0B09` (L = 0.00345).

```
Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #C0A070   0.37518     8.0:1    AAA ✓
accent     #B08858   0.27543     6.1:1    AA  ✓
muted      #988070   0.23284     5.3:1    AA  ✓
error      #D85040   0.20706     4.8:1    AA  ✓
foreground #E4DCD0   0.76200    14.8:1    AAA ✓
```

---

## Install

```bash
npx github:marvinrichter/gloam cinder starship
npx github:marvinrichter/gloam cinder alacritty
npx github:marvinrichter/gloam cinder kitty
npx github:marvinrichter/gloam cinder vscode
npx github:marvinrichter/gloam cinder neovim
```
