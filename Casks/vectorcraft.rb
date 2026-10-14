cask "vectorcraft" do
  version "0.10.0"
  sha256 :no_check

  url "https://github.com/storytold/vectorcraft/releases/download/v#{version}/vectorcraft-#{version}-macos-universal.dmg"
  name "VectorCraft"
  desc "Open-source vector illustration tool written in pure Rust"
  homepage "https://getartcraft.com/apps/vectorcraft"

  app "VectorCraft.app"

  zap trash: [
    "~/Library/Application Support/VectorCraft",
    "~/Library/Preferences/ai.storyteller.vectorcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.vectorcraft.savedState",
  ]
end
