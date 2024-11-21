cask "battery-toolkit" do
  version "1.5"
  sha256 :no_check

  url "https://github.com/mhaeuser/Battery-Toolkit/releases/download/#{version}/Battery-Toolkit-#{version}.zip"
  name "Battery Toolkit"
  desc "Control the platform power state of your Apple Silicon Mac."
  homepage "https://github.com/mhaeuser/Battery-Toolkit"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "Battery Toolkit.app"

  uninstall launchctl: [ "me.mhaeuser.batterytoolkitd",
                         "me.mhaeuser.BatteryToolkitAutostart" ],
            quit:        "me.mhaeuser.BatteryToolkit",
            login_item:  "Battery Toolkit"

  zap trash: [
    "~/Library/Preferences/me.mhaeuser.BatteryToolkit.plist",
    "~/Library/Saved Application State/me.mhaeuser.BatteryToolkit.savedState"
  ]
end
