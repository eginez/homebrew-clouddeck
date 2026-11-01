class Clouddeck < Formula
  desc "Read only browser for your EC2 instances"
  homepage "https://github.com/eginez/clouddeck"
  url "https://github.com/eginez/clouddeck/releases/download/v0.2.1/CloudDeck-0.2.1-linux-x86_64.tar.gz"
  sha256 "087af8aff901bea748e7eceb9419adcdafb7ea050324a35d43d5fb98b52e1625"
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
