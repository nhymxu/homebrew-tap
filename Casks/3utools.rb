cask "3utools" do
  arch arm: "arm64", intel: "x64"

  version "9.01.010"
  sha256 :no_check # required as upstream package is updated in-place

  url "https://dl.3u.com/update/v900/macos/#{arch}/3uTools_v#{version}_#{arch}.dmg"
  
  name "3uTools"
  desc "Your iPhone Management Expert. All-in-one solution for your iPhone: Device Verification, Flashing, Backup, Optimization, and App downloads"
  homepage "https://www.3u.com/productsWin"

  pkg "3utools_arm64.pkg"

  uninstall pkgutil: [
    'com.3utools.mac',
  ]
end
