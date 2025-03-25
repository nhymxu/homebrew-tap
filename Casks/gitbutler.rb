cask "gitbutler" do
    arch arm: "aarch64", intel: "x86_64"
    arch2 arm: "aarch64", intel: "x64"

    version "0.14.13-1764"
    sha256 :no_check # required as upstream package is updated in-place

    # url "https://releases.gitbutler.com/releases/release/#{version}/macos/#{arch}/GitButler_#{version.sub(/\-\d+/, "")}_#{arch2}.dmg"
    url "https://app.gitbutler.com/downloads/release/darwin/#{arch}/dmg"

    name "GitButler"
    desc "A Git client for simultaneous branches on top of your existing workflow."
    homepage "https://gitbutler.com/"
  
    app "GitButler.app"

    zap trash: [

    ]
end
