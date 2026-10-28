class Updatedoctor < Formula
  desc "Read only diagnosis of why a Mac did not install a macOS update"
  homepage "https://github.com/workprasanth9/UpdateDoctor"
  url "https://github.com/workprasanth9/UpdateDoctor/releases/download/v1.1.1/updatedoctor-1.1.1-macos-universal.tar.gz"
  sha256 "3ffe987d2a0d212c6a4cfc83793b26046f984fcfab8bdc36b5d3589ac04e4405"
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
