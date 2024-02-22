cask "defguard-client" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.1"
  sha256  arm:   "8decb79ba5e1bc7a66196dfe6595bb32f7ec2b6b2b0b301c6f3c0eb921507a6d",
          intel: "d2403cdafe5cd4460fb8b54899d2c63ed99eb533fb78e093ec13ca2f21fae5f5"

  url "https://github.com/DefGuard/client/releases/download/v#{version}/defguard-#{arch}-apple-darwin-#{version}.pkg",
      verified: "github.com/DefGuard/client/"
  name "defguard-client"
  desc "Best WireGuard desktop client with Multi-Factor Authentication"
  homepage "https://defguard.net/"

  livecheck do
    url :url
    strategy :github_latest
  end

  pkg "defguard-#{arch}-apple-darwin-#{version}.pkg"

  uninstall script: {
    executable: "/Applications/defguard-client.app/Contents/Resources/resources-macos/resources/uninstall.sh",
    sudo:       true,
  }
end
