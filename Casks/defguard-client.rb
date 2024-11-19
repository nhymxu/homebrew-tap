cask "defguard-client" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.0.1"
  sha256 :no_check

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
