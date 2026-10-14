cask "effectcraft" do
  version "0.9.2"
  sha256 :no_check

  url "https://github.com/storytold/effectcraft/releases/download/v#{version}/effectcraft-#{version}-macos-universal.dmg"
  name "EffectCraft"
  desc "Motion graphics and visual effects compositor in pure Rust"
  homepage "https://getartcraft.com/apps/effectcraft"

  app "EffectCraft.app"

  zap trash: [
    "~/Library/Application Support/EffectCraft",
    "~/Library/Caches/EffectCraft",
    "~/Library/Preferences/ai.storyteller.effectcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.effectcraft.savedState",
  ]
end
