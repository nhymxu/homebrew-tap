cask "defguard-client" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.2"
  sha256  arm:   "3d46008775f3773b8a9b8208dd87b8cd006213f62883c9c65695291a61287105",
          intel: "ac54b197cf95c301cb91ef735c960c0fecc1e71ec6f299dd94dffaaa86c434fc"

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
