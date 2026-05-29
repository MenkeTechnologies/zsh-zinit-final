```
 ____ ____  _   _    _____ ___ _   _ ___ _____      _____ ___ _   _    _    _
|_  /| __|| | | |  |__  /|_ _| \ | |_ _|_   _|    |  ___|_ _| \ | |  / \  | |
 / / |__ \ |_| |    / /  | ||  \| || |  | |  _____| |_   | ||  \| | / _ \ | |
/ /__  __) |  _  |  / /_  | || |\  || |  | | |_____|  _|  | || |\  |/ ___ \| |___
\____|____/|_| |_| /____|___|_| \_|___| |_|       |_|   |___|_| \_/_/   \_\_____|
```

<p align="center">
<code>// EMPTY-BY-DESIGN STUB FOR `zinit ice atinit/atload` HOOKS. SOURCE-NEUTRAL TRIGGER.</code>
</p>

---

[![Tag](https://img.shields.io/badge/tag-v0.1.0-39ff14.svg)](https://github.com/MenkeTechnologies/zsh-zinit-final/tags)
[![Shell](https://img.shields.io/badge/shell-zsh-05d9e8.svg)](#install)
[![Loader](https://img.shields.io/badge/loader-zinit-d300c5.svg)](https://github.com/zdharma-continuum/zinit)
[![Bytes](https://img.shields.io/badge/payload-0%20fns-ff2a6d.svg)](zsh-zinit-final.plugin.zsh)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

### `[SIGNAL // INTENTIONAL EMPTY PLUGIN — A LATCH FOR zinit's atinit/atload HOOKS]`

> *// jacking your zinit chain into a trailing hook without polluting another plugin's load order //*

---

## `> SYSTEM OVERVIEW`

`zsh-zinit-final` is an intentionally empty plugin whose only purpose is to be the **last** thing zinit loads in your boot chain. Use it as the carrier for `atinit` or `atload` ices when you need a hook that fires after every other plugin has finished — without bolting that hook onto an unrelated plugin that may be deferred, lazy-loaded, or reordered.

Zero functions. Zero aliases. Zero state. Just a `.plugin.zsh` stub zinit will load + run your ice against.

---

## `> WHY THIS EXISTS`

zinit's `ice atinit` and `ice atload` run code at well-defined points in the load lifecycle of the **next** plugin. If you want code to run AFTER your whole boot chain finishes — but the last "real" plugin in your chain has unpredictable ordering (turbo, wait-N, lucid) — you need a deterministic trailing carrier. That's this.

```
zinit ice wait'0' lucid atload'source $HOME/.zshrc.local'
zinit load MenkeTechnologies/zsh-zinit-final
```

Now `$HOME/.zshrc.local` runs once after every other turbo'd plugin in the chain, with no side-effects on any of them.

---

## `> INSTALL`

### Zinit (the only sensible loader)

```sh
zinit ice lucid nocompile
zinit load MenkeTechnologies/zsh-zinit-final
```

Or combine with the ice you actually want to fire:

```sh
zinit ice wait'1' lucid atload'<your final hook here>'
zinit load MenkeTechnologies/zsh-zinit-final
```

---

## `> LICENSE`

[MIT](https://opensource.org/licenses/MIT)

---

<p align="center">
<code>// END OF FILE // LATCH LOCKED //</code>
</p>
