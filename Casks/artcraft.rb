cask "artcraft" do
  version "0.41.0"
  sha256 :no_check

  url "https://github.com/storytold/artcraft/releases/download/artcraft-v#{version}/ArtCraft_#{version}_universal.dmg"
  name "ArtCraft"
  desc "Open-source desktop app for generating AI video and images"
  homepage "https://getartcraft.com/"

  app "ArtCraft.app"

  zap trash: [
    "~/Artcraft/artcraft_debug.log",
    "~/Artcraft/credentials",
    "~/Artcraft/settings",
    "~/Artcraft/state",
    "~/Artcraft/temp",
    "~/Library/Caches/ai.artcraft.app",
    "~/Library/Logs/ai.artcraft.app",
  ]
end
