cask "cadcraft" do
  version "0.6.2"
  sha256 :no_check

  url "https://github.com/storytold/cadcraft/releases/download/v#{version}/cadcraft-#{version}-macos-universal.dmg"
  name "CADCraft"
  desc "Computer-aided design and drafting in pure Rust"
  homepage "https://getartcraft.com/apps/cadcraft"

  app "CADCraft.app"

  zap trash: [
    "~/Library/Application Support/CADCraft",
    "~/Library/Preferences/ai.storyteller.cadcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.cadcraft.savedState",
  ]
end
