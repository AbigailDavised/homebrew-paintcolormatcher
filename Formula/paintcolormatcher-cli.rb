class PaintcolormatcherCli < Formula
  desc "CIEDE2000 Cross-Brand Architectural Paint Color & LRV Matcher CLI"
  homepage "https://paintcolormatcher.com"
  url "https://github.com/AbigailDavised/homebrew-paintcolormatcher/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "3c4070b753bcea3d51488c92c7f9554af2c1d05b386a7576eb9152e83a3f4c60"
  license "MIT"

  depends_on "node"

  def install
    chmod 0755, "bin/paintcolormatcher-cli"
    bin.install "bin/paintcolormatcher-cli"
  end

  test do
    output = shell_output("#{bin}/paintcolormatcher-cli --version")
    assert_match "1.0.0", output
  end
end
