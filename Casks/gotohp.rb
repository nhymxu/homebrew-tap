cask "gotohp" do
  version "0.7.0"
  sha256 :no_check

  url "https://github.com/xob0t/gotohp/releases/download/v#{version}/gotohp-macos-universal.zip"
  name "gotohp"
  desc "Unofficial Google Photos Desktop GUI Client"
  homepage "https://github.com/xob0t/gotohp"

  app "gotohp.app"

  # zap trash: [
  #   "~/Library/Application Support/gotohp",
  #   "~/Library/WebKit/com.xob0t.gotohp",
  #   "~/Library/Caches/com.xob0t.gotohp"
  # ]
end
