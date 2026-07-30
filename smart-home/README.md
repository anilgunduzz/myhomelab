# 🏡 Smart Home — Work in Progress

> 🚧 **Under construction.** This is an early-stage effort, documented here as a running log of intent, hardware, and progress rather than a finished write-up. It will be filled in properly (configs, diagrams, working automations) as the project matures.

## 🎯 Goal

Integrate RF-controlled roller blinds (Mosel-brand motors) into Home Assistant, so they can be automated alongside the rest of the smart-home stack described in [`docker/`](../docker) — scheduled by time of day, sunlight, or presence, rather than only operated from their original RF remote.

## 🔩 Hardware in Use

| Component | Purpose |
|---|---|
| Sonoff RF Bridge R2 (flashed with Portisch firmware) | Captures raw RF codes from the existing blind remotes |
| CC1101 + ESP8266, via ESPHome | Intended long-term RF transceiver — capture and (eventually) transmit |
| Mosel roller blind motors | The actual devices being controlled, driven by their stock 433 MHz RF remotes today |

## 🗺️ Current Status

```mermaid
flowchart LR
    A[✅ RF code capture<br/>Sonoff RF Bridge<br/>Portisch firmware] --> B[🔧 CC1101 capture<br/>via ESPHome<br/>working]
    B --> C[🚧 CC1101 transmit<br/>not yet verified]
    C --> D[⬜ Home Assistant<br/>cover entity]
    D --> E[⬜ Automations<br/>schedule / sunlight]

    style A fill:#2ecc71,color:#000
    style B fill:#2ecc71,color:#000
    style C fill:#f39c12,color:#000
    style D fill:#555,color:#fff
    style E fill:#555,color:#fff
```

- ✅ **RF capture working** — raw codes from the Mosel remotes have been successfully captured using the Sonoff RF Bridge running Portisch's custom firmware, which exposes the underlying RF codes rather than the stock firmware's cloud-only B0/B1 format.
- ✅ **CC1101 capture via ESPHome working** — the CC1101 module can also receive and decode the same signals.
- 🚧 **CC1101 transmit not yet verified** — sending the captured codes back out to actually move a blind hasn't been confirmed working yet. This is the current blocker.
- ⬜ **Home Assistant integration** — not started. Once transmit is reliable, the next step is exposing the blinds as `cover` entities.
- ⬜ **Automations** — scheduling, sunlight-based control, presence-based control. Depends on everything above.

## 📋 Planned Next Steps

1. Get reliable RF transmit working from the CC1101/ESPHome side — likely a matter of correctly matching timing/modulation parameters to what the Mosel remotes actually send, rather than just replaying captured bytes.
2. Once transmit is confirmed, expose blind control as a proper ESPHome `cover` component so Home Assistant can drive it natively (rather than via one-off RF replay scripts).
3. Build actual automations (e.g. close at sunset, open at sunrise, close on high outdoor temperature).
4. Document the full RF capture → decode → replay pipeline here in detail, once it's stable enough to be worth writing up properly.

## 🔭 Longer-Term Vision

The roller blind work above is the first piece of a broader plan for the space. Once it's stable, the intended scope expands to:

| Area | Goal |
|---|---|
| 💡 Light switches & outlets | Retrofit smart switches/outlets so lighting and plugged devices are controllable and automatable, not just the blinds |
| 🚶 Presence sensors | Occupancy-based automation — lighting and blinds reacting to whether a room is actually in use, rather than on a fixed schedule alone |
| 💧 Water leak sensors | Early detection near appliances/plumbing most likely to fail, with an alert path independent of whether anyone is home |
| 🚪 Door/window sensors | Contact sensors feeding both security automations (e.g. don't run the AC with a window open) and basic intrusion awareness |
| 📷 Privacy-conscious cameras | Camera coverage limited to points of interest (entryways, common areas), deliberately excluding private spaces — placement and field of view chosen for security value without turning the home into a surveillance environment |

None of this is built yet — it's included here to be transparent about direction, and because the roller blind pipeline (RF handling, ESPHome device management, Home Assistant integration patterns) is meant to be the reusable foundation the rest of this is built on top of, rather than a one-off.

## 🛠️ Stack (so far)

`ESPHome` `CC1101` `ESP8266` `Sonoff RF Bridge R2` `Portisch firmware` `Home Assistant` (planned)
