cask "clouddeck" do
  arch arm: "aarch64"

  version "0.3.1"
  sha256 "2729b11a7066840d1a2a30a688ec1da17a719d4f6db6399d15879d1c212314b2"

  url "https://github.com/eginez/clouddeck-releases/releases/download/v#{version}/CloudDeck-#{version}-macos-#{arch}.tar.gz"
  name "CloudDeck"
  desc "Read only browser for your EC2 instances"
  homepage "https://clouddeck.dev"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "CloudDeck.app"

  # The app is ad-hoc signed and not notarized, so macOS would block the
  # first launch. Clear the quarantine flag that the download put on it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/CloudDeck.app"],
                   sudo: false
  end

  zap trash: "~/.config/clouddeck"
end
