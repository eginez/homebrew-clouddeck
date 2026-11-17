class Clouddeck < Formula
  desc "Read only browser for your EC2 instances"
  homepage "https://clouddeck.dev"
  url "https://github.com/eginez/clouddeck-releases/releases/download/v0.3.1/CloudDeck-0.3.1-linux-x86_64.tar.gz"
  sha256 "c4f35b438b3df626927ca99b148f3fc9f5801fe350dd58bb7dc5d08b79cfac8f"
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
