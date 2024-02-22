cask "usql" do
  arch arm: "arm64", intel: "amd64"

  version "0.17.5"
  sha256  arm:   "08d1f56a393eeca6c34919e170beb6abe184ac07ec9ec37c344bfa683e0a04c7",
          intel: "1fabe95ea1b4d608579026643d29d12e05eee0e0c97a7e9ac57628f5889842cb"

  url "https://github.com/xo/usql/releases/download/v#{version}/usql-#{version}-darwin-#{arch}.tar.bz2"
  name "xo/usql"
  desc "Universal command-line interface for SQL databases"
  homepage "https://github.com/xo/usql"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "xo/xo/usql"

  binary "usql"
end
