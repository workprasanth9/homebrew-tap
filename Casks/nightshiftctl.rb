cask "nightshiftctl" do
  version "1.1.1"
  sha256 "5e3913fdb15389ac0d306d457729cee4920ecf7c06d9c6c1ee7f5a146297fe5f"

  url "https://github.com/workprasanth9/NightShiftCtl/releases/download/v#{version}/NightShiftCtl-#{version}-app.zip"
  name "NightShiftCtl"
  desc "Menu bar app and CLI to control Night Shift and everyday system toggles"
  homepage "https://github.com/workprasanth9/NightShiftCtl"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "NightShiftCtl.app"
  binary "#{appdir}/NightShiftCtl.app/Contents/Resources/nightshift"

  # Release builds are open source and ad hoc signed but not notarized, so
  # Gatekeeper would block both the app and the bundled CLI. Installing from
  # this tap is the trust decision, so clear the quarantine flag on this app only.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/NightShiftCtl.app"],
        must_succeed:   false,
        writable_paths: ["NightShiftCtl.app"],
        writable_base:  :appdir
  end

  uninstall quit: "com.workprasanth9.NightShiftCtl"

  zap trash: [
    "~/Library/Caches/com.workprasanth9.NightShiftCtl",
    "~/Library/HTTPStorages/com.workprasanth9.NightShiftCtl",
    "~/Library/Preferences/com.workprasanth9.NightShiftCtl.plist",
    "~/Library/Saved Application State/com.workprasanth9.NightShiftCtl.savedState",
  ]

  caveats <<~EOS
    NightShiftCtl lives in the menu bar (look for the moon icon). It has no Dock icon.

    The app is open source and ad hoc signed, but not notarized by Apple.
    This cask clears the download quarantine flag on NightShiftCtl.app so the
    app and the nightshift CLI open normally. If macOS still blocks it, approve
    it once in System Settings > Privacy & Security > Open Anyway.

    The nightshift command line tool is linked into Homebrew's bin. Run:
      nightshift help

    Dark Mode needs no permission. Empty Trash asks once to control Finder.
    Turn on Launch at Login from the app's menu.

    If you previously installed the .pkg, it also placed /usr/local/bin/nightshift.
    You can remove that copy with:
      sudo rm /usr/local/bin/nightshift
      sudo pkgutil --forget com.workprasanth9.NightShiftCtl
  EOS
end
