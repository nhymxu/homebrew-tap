cask "materialgram" do
  version "6.7.7.1"
  sha256 :no_check

  url "https://github.com/kukuruzka165/materialgram/releases/download/v#{version}/applesilicon_materialgram_v#{version}_untested.zip"
  name "materialgram"
  desc "Telegram Desktop fork with material icons and some improvements"
  homepage "https://github.com/kukuruzka165/materialgram"

  app "materialgram.app"
end
