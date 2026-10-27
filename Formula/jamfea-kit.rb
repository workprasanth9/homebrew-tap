class JamfeaKit < Formula
  desc "Tested Jamf Pro Extension Attribute scripts and the jamfea CLI"
  homepage "https://github.com/workprasanth9/JamfEA-Kit"
  url "https://github.com/workprasanth9/JamfEA-Kit/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e4241407ddc4cc550187f194e200d28ec590ebd65c1e6b1b360a68d78563ed58"
  license "MIT"

  depends_on :macos

  def install
    (pkgshare/"eas").install Dir["eas/*.sh"]
    libexec.install "bin/jamfea"
    (bin/"jamfea").write <<~SH
      #!/bin/bash
      export JAMFEA_EA_DIR="#{pkgshare}/eas"
      exec "#{libexec}/jamfea" "$@"
    SH
  end

  test do
    assert_match "jamfea #{version}", shell_output("#{bin}/jamfea version")
    assert_match "uptime-days", shell_output("#{bin}/jamfea list")
    assert_match "<result>", shell_output("#{bin}/jamfea run macos-version")
    assert_match "computer_extension_attribute", shell_output("#{bin}/jamfea export --format xml")
  end
end
