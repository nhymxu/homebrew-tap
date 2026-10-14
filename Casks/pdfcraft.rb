cask "pdfcraft" do
  version "0.7.1"
  sha256 :no_check

  url "https://github.com/storytold/pdfcraft/releases/download/v#{version}/pdfcraft-#{version}-macos-universal.dmg"
  name "PdfCraft"
  desc "Open-source PDF reader, editor, and workbench in pure Rust"
  homepage "https://getartcraft.com/apps/pdfcraft"

  app "PdfCraft.app"

  zap trash: [
    "~/.local/share/pdfcraft",
    "~/Library/Application Support/PdfCraft",
    "~/Library/Preferences/ai.storyteller.pdfcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.pdfcraft.savedState",
  ]
end
