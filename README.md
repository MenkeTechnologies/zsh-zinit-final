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

[![Tag](https://img.shields.io/github/v/tag/MenkeTechnologies/zsh-zinit-final?sort=semver&label=tag&color=39ff14)](https://github.com/MenkeTechnologies/zsh-zinit-final/tags)
[![Shell](https://img.shields.io/badge/shell-zsh-05d9e8.svg)](#install)
[![Loader](https://img.shields.io/badge/loader-zinit-d300c5.svg)](https://github.com/zdharma-continuum/zinit)
[![Bytes](https://img.shields.io/badge/payload-0%20fns-ff2a6d.svg)](zsh-zinit-final.plugin.zsh)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

### `[SIGNAL // INTENTIONAL EMPTY PLUGIN — A LATCH FOR zinit's atinit/atload HOOKS]`

> *// jacking your zinit chain into a trailing hook without polluting another plugin's load order //*

---

## `> SYSTEM OVERVIEW`

`zsh-zinit-final` is an intentionally empty plugin whose only purpose is to be a carrier for `atinit` or `atload` ices. Declare it **last** in your zinit chain so its hook is queued after the plugins declared before it — without bolting that hook onto an unrelated plugin that may be deferred, lazy-loaded, or reordered.

Zero functions. Zero aliases. Zero state. Just a `.plugin.zsh` stub zinit will load + run your ice against.

---

## `> WHY THIS EXISTS`

zinit's `ice atinit` and `ice atload` run code at well-defined points in the load lifecycle of the **next** plugin. If you want code to run after the plugins declared before it — but the last "real" plugin in your chain is deferred (turbo, wait-N, lucid) — you need a dedicated trailing carrier. That's this.

```
zinit ice wait'0' lucid atload'source $HOME/.zshrc.local'
zinit load MenkeTechnologies/zsh-zinit-final
```

Now `$HOME/.zshrc.local` is sourced by the `atload` ice when this stub loads, with no side-effects on the other plugins.

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
