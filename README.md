# workprasanth9/homebrew-tap

Homebrew tap for macOS tools by [Prasanth Yethirajula](https://github.com/workprasanth9).

## Install

```bash
brew tap workprasanth9/tap
brew install --cask nightshiftctl
```

Or in one line:

```bash
brew install --cask workprasanth9/tap/nightshiftctl
```

## Available casks

| Cask | What it installs |
| --- | --- |
| `nightshiftctl` | [NightShiftCtl](https://github.com/workprasanth9/NightShiftCtl): menu bar app for Night Shift, Keep Awake, Dark Mode and other everyday toggles, plus the `nightshift` command line tool |

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

## Update and uninstall

```bash
brew upgrade --cask nightshiftctl
brew uninstall --cask nightshiftctl
brew uninstall --cask --zap nightshiftctl   # also removes preferences and caches
brew upgrade jamfea-kit
brew uninstall jamfea-kit
```

## License

The casks and formulae in this tap are MIT licensed. Each app has its own license.
