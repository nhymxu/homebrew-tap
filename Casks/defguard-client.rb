cask "defguard-client" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.4.0"
  sha256  arm:   "3a195427681dc9eac592d2d924d68ade7c9b27205d99fa5fcff127bcccf2a8a6",
          intel: "db13d31530075396d2ac799d0d3688ea524c919a7b65332feb695b5bcdf38c37"

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
