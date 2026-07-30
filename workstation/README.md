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

1. **Enable Secure Boot with custom key enrollment** rather than leaving it off. *Benefit:* restores verification of the boot chain, so a tampered bootloader or kernel won't silently load — the security boundary most Arch users trade away for convenience. It also keeps the Windows side of the dual-boot working under its expected security posture rather than requiring firmware settings to be weakened for both operating systems.
2. **Wire up scheduled Btrfs snapshots** (`snapper` or equivalent). *Benefit:* turns Btrfs from a technical choice on paper into an actual safety net — on a rolling-release distribution a bad update can break the desktop at any time, and a pre-update snapshot converts that from a reinstall into a two-minute rollback.
3. **Version-control the Hyprland/CachyOS dotfiles.** *Benefit:* makes the setup reproducible on a new machine in minutes instead of being reconstructed from memory, and makes it possible to roll back a configuration change independently of a system snapshot.
4. **Document the Secure Boot enrollment process** once it's done. *Benefit:* this is the least-documented, most-fragile part of the setup — keys have to survive kernel and bootloader updates — so a written procedure is what makes it maintainable rather than a one-off that breaks at the next update.
5. **Document the dual-boot partition and bootloader layout** (omitting anything sensitive). *Benefit:* makes recovery from a broken bootloader a procedure rather than an improvisation, which is exactly when clear notes matter most.

## 🛠️ Stack (so far)

`CachyOS` `Arch Linux` `Hyprland` `Wayland` `Btrfs` `Windows 11 (dual-boot)`
