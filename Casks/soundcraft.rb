cask "soundcraft" do
  version "0.6.1"
  sha256 :no_check

  url "https://github.com/storytold/soundcraft/releases/download/v#{version}/soundcraft-#{version}-macos-universal.dmg"
  name "SoundCraft"
  desc "Professional audio recording and mixing DAW in pure Rust"
  homepage "https://getartcraft.com/apps/soundcraft"

  app "SoundCraft.app"

  zap trash: [
    "~/.config/soundcraft",
    "~/Library/Application Support/SoundCraft",
    "~/Library/Preferences/ai.storyteller.soundcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.soundcraft.savedState",
  ]
end
