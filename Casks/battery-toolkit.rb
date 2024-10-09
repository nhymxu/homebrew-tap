cask "battery-toolkit" do
  version "1.5"
  sha256 :no_check

  url "https://github.com/mhaeuser/Battery-Toolkit/releases/download/#{version}/Battery-Toolkit-#{version}zip"
  name "Battery-Toolkit"
  desc "Control the platform power state of your Apple Silicon Mac."
  homepage "https://github.com/mhaeuser/Battery-Toolkit"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "Battery Toolkit.app"
end
