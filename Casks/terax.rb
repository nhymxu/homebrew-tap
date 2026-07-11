cask "terax" do
  version "0.8.5"
  sha256 :no_check
  depends_on arch: :arm64

  url "https://github.com/crynta/terax-ai/releases/download/v#{version}/Terax_#{version}_aarch64.dmg"
  name "Terax"
  desc "A lightweight Terminal-first AI-native dev workspace with a built-in editor, AI agents, and live web preview. 7 MB on disk. 300 ms cold start. BYOK or fully local."
  homepage "https://terax.app"

  app "Terax.app"
end
