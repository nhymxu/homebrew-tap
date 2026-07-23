cask "fagram" do
  version "2.3.3"
  sha256 :no_check

  url "https://github.com/fagramdesktop/fadesktop/releases/download/#{version}/fagram-mac-#{version}.dmg"
  name "fagram"
  desc "FAgram is a desktop telegram client with lots of customisations"
  homepage "https://github.com/fagramdesktop/fadesktop"

  app "FAgram.app"
end
