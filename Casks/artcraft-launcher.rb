cask "artcraft-launcher" do
  version "0.4.1"
  sha256 :no_check

  url "https://github.com/storytold/craft-launcher/releases/download/v#{version}/artcraft-launcher-#{version}-macos-universal.dmg"
  name "ArtCraft Launcher"
  desc "Launcher that installs and updates all ArtCraft applications"
  homepage "https://getartcraft.com/apps"

  app "ArtCraft Launcher.app"

  zap trash: [
    "~/Library/Application Support/ArtCraft Launcher",
    "~/Library/Preferences/ai.storyteller.artcraft-launcher.plist",
    "~/Library/Saved Application State/ai.storyteller.artcraft-launcher.savedState",
  ]
end
