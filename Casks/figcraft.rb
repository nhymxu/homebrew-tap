cask "figcraft" do
  version "0.5.1"
  sha256 :no_check

  url "https://github.com/storytold/figcraft/releases/download/v#{version}/figcraft-#{version}-macos-universal.dmg"
  name "FigCraft"
  desc "Interface design and collaborative prototyping tool in pure Rust"
  homepage "https://getartcraft.com/apps/figcraft"

  app "FigCraft.app"

  zap trash: [
    "~/Library/Application Support/FigCraft",
    "~/Library/Preferences/ai.storyteller.figcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.figcraft.savedState",
  ]
end
