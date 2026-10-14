cask "designcraft" do
  version "0.7.1"
  sha256 :no_check

  url "https://github.com/storytold/designcraft/releases/download/v#{version}/designcraft-#{version}-macos-universal.dmg"
  name "DesignCraft"
  desc "Page layout and publishing design editor in pure Rust"
  homepage "https://getartcraft.com/apps/designcraft"

  app "DesignCraft.app"

  zap trash: [
    "~/Library/Application Support/DesignCraft",
    "~/Library/Preferences/ai.storyteller.designcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.designcraft.savedState",
  ]
end
