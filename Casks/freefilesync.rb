cask 'freefilesync' do
  version '13.7'
  sha256 :no_check # required as upstream package is updated in-place

  url "https://www.freefilesync.org/download/FreeFileSync_#{version}_macOS.zip"
  name 'FreeFileSync'
  homepage 'https://www.freefilesync.org/'

  pkg "FreeFileSync_#{version}.pkg"

  uninstall pkgutil: [
    'org.freefilesync.pkg.FreeFileSync',
    'org.freefilesync.pkg.RealTimeSync',
  ]
end
