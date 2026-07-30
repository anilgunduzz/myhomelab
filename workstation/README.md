# 💻 Workstation — CachyOS + Hyprland

> 🚧 **Under construction.** Setup is functional day-to-day but not yet fully documented, and Secure Boot is still an open item. This page will be expanded with actual configs (Hyprland dotfiles, Secure Boot key enrollment steps, package list) as the setup matures.

## 🎯 Goal

A daily-driver Linux desktop that dual-boots cleanly alongside Windows 11 — Linux for development and general use, Windows kept available for anything that specifically needs it (games, hardware tools, etc.) — built on a distribution and kernel tuned for performance rather than a generic general-purpose default.

## 🔩 Current Setup

| Component | Choice | Why |
|---|---|---|
| Distribution | CachyOS (Arch-based) | Arch's rolling-release model without doing the base install by hand, plus CachyOS's own performance-oriented packaging (optimized builds, kernel choices) on top of it |
| Kernel | Latest CachyOS kernel | Tracks CachyOS's own kernel builds rather than the distribution-default LTS kernel, trading a bit of stability margin for newer hardware support and scheduler/performance improvements as they land |
| Window Manager | Hyprland (Wayland compositor) | Wayland-native tiling compositor — chosen over a traditional DE for a lighter, keyboard-driven, highly configurable workflow |
| Filesystem | Btrfs | Copy-on-write, native snapshot support, and transparent compression — useful for being able to roll back a bad update on a rolling-release distribution, even though snapshotting isn't fully wired up yet (see below) |
| Boot | Dual-boot with Windows 11 | Windows kept available for the handful of things that genuinely need it, rather than running it in a VM or dropping it entirely |

## 🗺️ Status

- ✅ CachyOS installed and running as daily driver, on the latest CachyOS kernel build.
- ✅ Hyprland configured as the primary desktop environment.
- ✅ Dual-boot with Windows 11 working.
- ✅ Btrfs as the root filesystem.
- 🚧 **Secure Boot is not yet configured** — the machine currently boots without it. This is a known, open gap rather than an oversight: getting Secure Boot working correctly on an Arch-based rolling-release system means enrolling custom keys (e.g. via `sbctl`) and keeping them valid across kernel and bootloader updates, rather than a one-time setup step. It's being treated as worth doing properly rather than skipped.
- 🚧 Btrfs snapshots aren't automated yet (no `snapper`/`timeshift` scheduling in place) — the filesystem is ready for it, but the safety net isn't actually configured yet.
- 🚧 Dotfiles and configuration are not yet version-controlled or organized for publishing here.

## 📋 Planned Next Steps

1. **Enable Secure Boot with custom key enrollment** rather than leaving it off — the goal is to keep the security boundary Secure Boot provides instead of trading it away for convenience, which is the more common shortcut on Arch-based systems.
2. Wire up scheduled Btrfs snapshots (`snapper` or equivalent), so the copy-on-write filesystem actually functions as a rollback safety net on a rolling-release distribution, not just as a technical choice on paper.
3. Version-control the Hyprland/CachyOS dotfiles (config, keybindings, theming) and publish a sanitized copy here.
4. Document the Secure Boot key enrollment process step by step once it's done — this is likely the most reusable, non-obvious part of the setup for anyone else wanting Secure Boot **and** an Arch-based rolling-release system.
5. Document the dual-boot partition/bootloader layout (without disk sizes or partition labels that reveal anything sensitive).

## 🛠️ Stack (so far)

`CachyOS` `Arch Linux` `Hyprland` `Wayland` `Btrfs` `Windows 11 (dual-boot)`
