cask "lightcraft" do
  version "0.7.1"
  sha256 :no_check

  url "https://github.com/storytold/lightcraft/releases/download/v#{version}/lightcraft-#{version}-macos-universal.dmg"
  name "LightCraft"
  desc "Photo library and non-destructive raw developer in pure Rust"
  homepage "https://getartcraft.com/apps/lightcraft"

  app "LightCraft.app"

  zap trash: [
    "~/.config/lightcraft",
    "~/Library/Application Support/LightCraft",
    "~/Library/Preferences/ai.storyteller.lightcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.lightcraft.savedState",
  ]
end
