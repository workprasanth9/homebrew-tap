# workprasanth9/homebrew-tap

Homebrew tap for macOS tools by [Prasanth Yethirajula](https://github.com/workprasanth9).

## Install

```bash
brew tap workprasanth9/tap
brew trust workprasanth9/tap
brew install --cask nightshiftctl
```

Recent Homebrew versions refuse to load casks and formulae from a third party
tap until you trust it. `brew trust workprasanth9/tap` trusts this whole tap.
To trust only one entry, use for example `brew trust --cask workprasanth9/tap/keepawake`.

Or in one line:

```bash
brew install --cask workprasanth9/tap/nightshiftctl
```

## Available casks

| Cask | What it installs |
| --- | --- |
| `nightshiftctl` | [NightShiftCtl](https://github.com/workprasanth9/NightShiftCtl): menu bar app for Night Shift, Keep Awake, Dark Mode and other everyday toggles, plus the `nightshift` command line tool |
| `keepawake` | [KeepAwake](https://github.com/workprasanth9/KeepAwake): menu bar app and `keepawake` command line tool that keep a Mac awake with IOKit power assertions, schedules, and LaunchAgent or LaunchDaemon installs |

```bash
brew install --cask workprasanth9/tap/keepawake
keepawake start --duration 2h
```

## Available formulae

| Formula | What it installs |
| --- | --- |
| `jamfea-kit` | [JamfEA-Kit](https://github.com/workprasanth9/JamfEA-Kit): 19 tested Jamf Pro Extension Attribute scripts and the `jamfea` CLI to list, run, validate, and export them |

```bash
brew install workprasanth9/tap/jamfea-kit
jamfea list
```

## NightShiftCtl notes

- The app goes to `/Applications/NightShiftCtl.app` and the `nightshift` CLI is
  linked into Homebrew's `bin`, so `nightshift help` works right away.
- The app lives in the menu bar (moon icon) and has no Dock icon.
- Builds are open source and ad hoc signed but not notarized by Apple. The cask
  clears the download quarantine flag on NightShiftCtl.app only, so the app and
  the CLI open without a Gatekeeper block. If macOS still blocks it, approve it
  once in System Settings > Privacy & Security > Open Anyway.

- If you installed NightShiftCtl from the `.pkg` before, reinstall over it with
  `brew install --cask --force nightshiftctl`. The old `/usr/local/bin/nightshift`
  from the package can be removed with `sudo rm /usr/local/bin/nightshift`.

## KeepAwake notes

- The app goes to `/Applications/KeepAwake.app` and the `keepawake` CLI is
  linked into Homebrew's `bin`.
- The app lives in the menu bar and has no Dock icon. Like NightShiftCtl, it is
  ad hoc signed and not notarized, so the cask clears the quarantine flag on
  KeepAwake.app only.
- Run `keepawake uninstall` before removing the cask if you installed a
  LaunchAgent or LaunchDaemon. Homebrew does not remove launchd jobs.
- For Jamf rollouts, use `keepawake-cli-<version>.pkg` from the
  [KeepAwake releases](https://github.com/workprasanth9/KeepAwake/releases) instead.

## Update and uninstall

```bash
brew upgrade --cask nightshiftctl
brew uninstall --cask nightshiftctl
brew uninstall --cask --zap nightshiftctl   # also removes preferences and caches
brew upgrade --cask keepawake
brew uninstall --cask keepawake
brew uninstall --cask --zap keepawake       # also removes preferences and Application Support files
brew upgrade jamfea-kit
brew uninstall jamfea-kit
```

## License

The casks and formulae in this tap are MIT licensed. Each app has its own license.
