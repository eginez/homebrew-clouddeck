class Clouddeck < Formula
  desc "Read only browser for your EC2 instances"
  homepage "https://github.com/eginez/clouddeck"
  url "https://github.com/eginez/clouddeck/releases/download/v0.2.0/CloudDeck-0.2.0-linux-x86_64.tar.gz"
  sha256 "2d3d3dc227012fd2c123ac4e09ad9f3acb8bca1a77169470635cbebf663a816d"
  license any_of: ["MIT", "Apache-2.0"]

  # Linux only. On macOS install the cask:
  #   brew install --cask eginez/clouddeck/clouddeck
  depends_on arch: :x86_64
  depends_on :linux

  def install
    bin.install "clouddeck"
    (share/"applications").install "clouddeck.desktop"
    share.install "share/icons"
    doc.install "README.txt"
  end

  def caveats
    <<~EOS
      CloudDeck needs the AWS CLI v2 on your PATH, a Vulkan driver, libxkbcommon,
      fontconfig, and a Wayland or X11 session. See #{doc}/README.txt.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clouddeck --version")
  end
end
