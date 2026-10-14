cask "gridcraft" do
  version "0.6.1"
  sha256 :no_check

  url "https://github.com/storytold/gridcraft/releases/download/v#{version}/gridcraft-#{version}-macos-universal.dmg"
  name "GridCraft"
  desc "Fast, native spreadsheet application in pure Rust"
  homepage "https://getartcraft.com/apps/gridcraft"

  app "GridCraft.app"

  zap trash: [
    "~/.config/gridcraft",
    "~/Library/Application Support/GridCraft",
    "~/Library/Preferences/ai.storyteller.gridcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.gridcraft.savedState",
  ]
end
