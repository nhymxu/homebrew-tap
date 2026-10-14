cask "filmcraft" do
  version "0.7.2"
  sha256 :no_check

  url "https://github.com/storytold/filmcraft/releases/download/v#{version}/filmcraft-#{version}-macos-universal.dmg"
  name "FilmCraft"
  desc "Open-source nonlinear video editor written in pure Rust"
  homepage "https://getartcraft.com/apps/filmcraft"

  app "FilmCraft.app"

  zap trash: [
    "~/Library/Application Support/FilmCraft",
    "~/Library/Preferences/ai.storyteller.filmcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.filmcraft.savedState",
  ]
end
