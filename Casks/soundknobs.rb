cask "soundknobs" do
  version "0.1.0"
  sha256 :no_check

  url "https://github.com/valeriy777-ua/SoundKnobs/releases/download/v#{version}/SoundKnobs.zip"
  name "SoundKnobs"
  desc "Per-app volume control for macOS. A tiny menu-bar mixer: every app currently playing audio gets its own row with an icon, a volume slider, and a mute button — and the sliders genuinely change that app's volume, independently of everything else."
  homepage "https://github.com/valeriy777-ua/SoundKnobs"

  app "SoundKnobs.app"
end
