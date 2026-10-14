cask "wordcraft" do
  version "0.6.1"
  sha256 :no_check

  url "https://github.com/storytold/wordcraft/releases/download/v#{version}/wordcraft-#{version}-macos-universal.dmg"
  name "WordCraft"
  desc "Fast, open-source word processor in pure Rust"
  homepage "https://getartcraft.com/apps/wordcraft"

  app "WordCraft.app"

  zap trash: [
    "~/.config/wordcraft",
    "~/Library/Application Support/WordCraft",
    "~/Library/Preferences/ai.storyteller.wordcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.wordcraft.savedState",
  ]
end
