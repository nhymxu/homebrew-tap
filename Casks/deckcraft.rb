cask "deckcraft" do
  version "0.6.1"
  sha256 :no_check

  url "https://github.com/storytold/deckcraft/releases/download/v#{version}/deckcraft-#{version}-macos-universal.dmg"
  name "DeckCraft"
  desc "Fast, dynamic slide presentations app in pure Rust"
  homepage "https://getartcraft.com/apps/deckcraft"

  app "DeckCraft.app"

  zap trash: [
    "~/.config/deckcraft",
    "~/Library/Application Support/DeckCraft",
    "~/Library/Preferences/ai.storyteller.deckcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.deckcraft.savedState",
  ]
end
