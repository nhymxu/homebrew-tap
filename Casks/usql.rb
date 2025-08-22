cask "usql" do
  arch arm: "arm64", intel: "amd64"

  version "0.19.21"
  sha256 :no_check

  url "https://github.com/xo/usql/releases/download/v#{version}/usql-#{version}-darwin-#{arch}.tar.bz2"
  name "xo/usql"
  desc "Universal command-line interface for SQL databases"
  homepage "https://github.com/xo/usql"

  livecheck do
    url :url
    strategy :github_latest
  end

  # conflicts_with cask: "xo/xo/usql"

  binary "usql"
end
