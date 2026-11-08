cask "clouddeck" do
  arch arm: "aarch64"

  version "0.2.2"
  sha256 "76bcee6954ed93b679bc62f77abd509435bed1c7a1993d02acc8ac5377997949"

  url "https://github.com/eginez/clouddeck/releases/download/v#{version}/CloudDeck-#{version}-macos-#{arch}.tar.gz"
  name "CloudDeck"
  desc "Read only browser for your EC2 instances"
  homepage "https://github.com/eginez/clouddeck"

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
