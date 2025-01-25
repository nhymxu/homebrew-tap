cask "i4tools" do
  version "3.16.002"
  sha256 :no_check # required as upstream package is updated in-place

  url "http://url.i4.cn/fqIBBbaa"

  name "i4Tools"
  desc "a professional Apple flash assistant and Apple jailbreak assistant. It is also equipped with iAssist PC, iAssist Mac, iAssist mobile, and iAssist enhanced version. It is designed to provide Apple users with millions of iPhone and iPad software, games, ringtones, and wallpaper resources for safe, fast, and free download."
  homepage "https://www.i4.cn/"

  pkg "i4tools.pkg"

  uninstall pkgutil: [
    'cn.i4tools.mac',
  ]
end
