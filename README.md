# homebrew-pingmate

Homebrew tap for [PingMate](https://github.com/kikudjira/pingmate) — a menu bar monitor for internet connection quality.

```sh
brew install --cask kikudjira/pingmate/pingmate
```

The app is ad-hoc signed rather than notarized, so the cask clears the quarantine attribute after install.

## Updating the cask

Releases are built in the [main repo](https://github.com/kikudjira/pingmate/actions). Each run prints the two lines that change here — `version` and `sha256` — in its job summary.

```sh
shasum -a 256 PingMate-<version>.dmg   # if you need to recompute it yourself
brew style Casks/pingmate.rb
```
