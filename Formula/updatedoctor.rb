class Updatedoctor < Formula
  desc "Read only diagnosis of why a Mac did not install a macOS update"
  homepage "https://github.com/workprasanth9/UpdateDoctor"
  url "https://github.com/workprasanth9/UpdateDoctor/releases/download/v1.1.2/updatedoctor-1.1.2-macos-universal.tar.gz"
  sha256 "b94b3d9baa92e9f1d35b3305f6399321aebd87941225c8c63c40f93de50fcfa3"
  license "MIT"

  depends_on :macos

  def install
    bin.install "updatedoctor"
  end

  test do
    assert_match "updatedoctor #{version}", shell_output("#{bin}/updatedoctor version")
    assert_match "Usage:", shell_output("#{bin}/updatedoctor help")
    assert_match "<result>", shell_output("#{bin}/updatedoctor doctor --ea --quick --offline")
  end
end
