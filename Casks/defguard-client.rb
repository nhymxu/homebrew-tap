cask "defguard-client" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.3.0"
  sha256  arm:   "63bb263ce2c9c6b14a808cabf48335f13a7ca1300488e724a646f151ae751ea7",
          intel: "98ced5d2c332e4626376d24bdd8ffb4188d6b8ef86a48f4e5c9069831ca783da"

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
