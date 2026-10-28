class Updatedoctor < Formula
  desc "Read only diagnosis of why a Mac did not install a macOS update"
  homepage "https://github.com/workprasanth9/UpdateDoctor"
  url "https://github.com/workprasanth9/UpdateDoctor/releases/download/v1.0.0/updatedoctor-1.0.0-macos-universal.tar.gz"
  sha256 "437075bbaa1217976c9bd97fe61f063a621b400d882f156b760efa6dfab17a7a"
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
