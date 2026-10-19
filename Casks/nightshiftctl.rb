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

  uninstall quit: "com.workprasanth9.NightShiftCtl"

  zap trash: [
    "~/Library/Caches/com.workprasanth9.NightShiftCtl",
    "~/Library/HTTPStorages/com.workprasanth9.NightShiftCtl",
    "~/Library/Preferences/com.workprasanth9.NightShiftCtl.plist",
    "~/Library/Saved Application State/com.workprasanth9.NightShiftCtl.savedState",
  ]

  caveats <<~EOS
    NightShiftCtl lives in the menu bar (look for the moon icon). It has no Dock icon.

    The app is open source and ad hoc signed, but not notarized by Apple, so
    Gatekeeper may block the first launch. Either approve it once in
    System Settings > Privacy & Security > Open Anyway, or clear the
    download quarantine flag yourself:
      xattr -dr com.apple.quarantine /Applications/NightShiftCtl.app

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
