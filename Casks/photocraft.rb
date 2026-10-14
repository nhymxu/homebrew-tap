cask "photocraft" do
  version "0.8.2"
  sha256 :no_check

  url "https://github.com/storytold/photocraft/releases/download/v#{version}/photocraft-#{version}-macos-universal.dmg"
  name "PhotoCraft"
  desc "Open-source photo editor written in pure Rust"
  homepage "https://getartcraft.com/apps/photocraft"

  app "PhotoCraft.app"

  zap trash: [
    "~/Library/Application Support/Photocraft",
    "~/Library/Preferences/ai.storyteller.photocraft.plist",
    "~/Library/Saved Application State/ai.storyteller.photocraft.savedState",
  ]
end
