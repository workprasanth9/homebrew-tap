cask "keepawake" do
  version "1.0.0"
  sha256 "4f9e381907f87d603fa27900d9ecf07faa3ec46b76414593882327e43fe66e06"

  url "https://github.com/workprasanth9/KeepAwake/releases/download/v#{version}/KeepAwake-#{version}-app.zip"
  name "KeepAwake"
  desc "Menu bar app and CLI that keep the computer awake with power assertions"
  homepage "https://github.com/workprasanth9/KeepAwake"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "KeepAwake.app"
  binary "#{appdir}/KeepAwake.app/Contents/Resources/keepawake"

  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/KeepAwake.app"],
        must_succeed:   false,
        writable_paths: ["KeepAwake.app"],
        writable_base:  :appdir
  end

  uninstall quit: "com.keepawake.menu"

  zap trash: [
    "~/Library/Application Support/KeepAwake",
    "~/Library/Caches/com.keepawake.menu",
    "~/Library/HTTPStorages/com.keepawake.menu",
    "~/Library/Preferences/com.keepawake.menu.plist",
    "~/Library/Saved Application State/com.keepawake.menu.savedState",
  ]

  caveats <<~EOS
    KeepAwake lives in the menu bar and has no Dock icon.
    The keepawake command line tool is linked into your Homebrew prefix.
    Run `keepawake --help` to get started.

    Run `keepawake uninstall` before removing this cask if you installed a
    LaunchAgent or LaunchDaemon. Homebrew does not remove launchd jobs.

    This build is ad hoc signed and not notarized, so the cask clears the
    quarantine flag after install.

    If KeepAwake is useful to you, please star it on GitHub and share it
    with a Mac admin friend:
      https://github.com/workprasanth9/KeepAwake
  EOS
end
