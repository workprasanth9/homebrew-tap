cask "updatedoctor-app" do
  version "1.1.2"
  sha256 "fd4a4fb0e8068de9143d3e7a897d40627a3cf1a6a4e804be1a4cbfa36347728d"

  url "https://github.com/workprasanth9/UpdateDoctor/releases/download/v#{version}/UpdateDoctor-#{version}-app.zip"
  name "UpdateDoctor"
  desc "Menu bar app that explains why system updates did not install"
  homepage "https://github.com/workprasanth9/UpdateDoctor"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "UpdateDoctor.app"
  binary "#{appdir}/UpdateDoctor.app/Contents/Resources/updatedoctor"

  # Ad hoc signed and not notarized. Installing from this tap is the trust
  # decision, so clear the quarantine flag on this app only.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/UpdateDoctor.app"],
        must_succeed:   false,
        writable_paths: ["UpdateDoctor.app"],
        writable_base:  :appdir
  end

  uninstall quit: "com.updatedoctor.menu"

  zap trash: [
    "~/Library/Caches/com.updatedoctor.menu",
    "~/Library/HTTPStorages/com.updatedoctor.menu",
    "~/Library/Preferences/com.updatedoctor.menu.plist",
    "~/Library/Saved Application State/com.updatedoctor.menu.savedState",
  ]

  caveats <<~EOS
    UpdateDoctor lives in the menu bar as a colored dot and has no Dock icon:
    green is healthy, yellow is at risk, red is blocked.
    The updatedoctor command line tool is linked into your Homebrew prefix,
    so do not also install the updatedoctor formula.

    "Run full check (admin)" asks for an administrator password through the
    standard macOS prompt. Nothing else runs as root.

    If UpdateDoctor is useful to you, please star it on GitHub and share it
    with a Mac admin friend:
      https://github.com/workprasanth9/UpdateDoctor
  EOS
end
