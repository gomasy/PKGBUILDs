# AGENTS.md

## Overview

A collection of custom PKGBUILD scripts for Arch Linux ARM.
Each top-level directory is a package containing a `PKGBUILD`, a generated `.SRCINFO`, and any patches or supplementary files.
See [README.md](README.md) for the full package list.

## Rules

- After updating a PKGBUILD (version bump, source change, etc.), always regenerate `.SRCINFO` in that package's directory:

  ```sh
  makepkg --printsrcinfo > .SRCINFO
  ```

  Never edit `.SRCINFO` by hand.
  Never commit a PKGBUILD change without the matching `.SRCINFO` update.
