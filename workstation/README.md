# 💻 Workstation — CachyOS + Hyprland

> 🚧 **Under construction.** Setup is functional day-to-day but not yet fully documented. This page will be expanded with actual configs (Hyprland dotfiles, Secure Boot key enrollment steps, package list) as the setup stabilizes.

## 🎯 Goal

A daily-driver Linux desktop that dual-boots cleanly alongside Windows 11 — Linux for development and general use, Windows kept available for anything that specifically needs it (games, hardware tools, etc.) — without compromising on boot security or desktop responsiveness.

## 🔩 Current Setup

| Component | Choice |
|---|---|
| Distribution | CachyOS (Arch-based, performance-oriented kernel/patches) |
| Window Manager | Hyprland (Wayland compositor) |
| Boot | Dual-boot with Windows 11 |
| Secure Boot | Enabled, with custom key enrollment (rather than disabling it for Linux) |
| Filesystem | Btrfs |

## 🗺️ Status

- ✅ CachyOS installed and running as daily driver alongside Windows 11.
- ✅ Hyprland configured as the primary desktop environment.
- ✅ Secure Boot kept **enabled** rather than disabled — Linux boots under Secure Boot via custom-enrolled keys (e.g. via `sbctl`), rather than taking the common shortcut of turning Secure Boot off entirely. This preserves the security boundary Secure Boot provides instead of trading it away for convenience.
- 🚧 Dotfiles and configuration are not yet version-controlled or organized for publishing here.
- 🚧 Full package list and post-install setup steps not yet documented.

## 📋 Planned Next Steps

1. Version-control the Hyprland/CachyOS dotfiles (config, keybindings, theming) and publish a sanitized copy here.
2. Document the Secure Boot custom key enrollment process step by step — this is the most reusable, non-obvious part of the setup for anyone else wanting Secure Boot **and** Arch-based Linux.
3. Write up the dual-boot partition/bootloader layout (without disk sizes or partition labels that reveal anything sensitive).
4. Note any CachyOS-specific performance tuning worth keeping (kernel choice, scheduler, etc.).

## 🛠️ Stack (so far)

`CachyOS` `Arch Linux` `Hyprland` `Wayland` `Btrfs` `Secure Boot / sbctl` `Windows 11 (dual-boot)`
