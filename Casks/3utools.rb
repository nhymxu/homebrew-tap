cask "3utools" do
  version "3.06.005"
  sha256 :no_check # required as upstream package is updated in-place

  url "https://dl.3u.com/update/mac/dl/3uTools_v#{version}.dmg"
  name "3uTools"
  desc "Useful Apple Mobile Device Management Tool"
  homepage "https://www.3u.com/"

  pkg "3utools_v#{version}.pkg"

  uninstall pkgutil: [
    'cn.3utools.mac',
  ]
end
