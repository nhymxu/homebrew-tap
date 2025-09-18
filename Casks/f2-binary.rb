cask "f2-binary" do
  arch arm: "arm64", intel: "amd64"

  version "2.2.1"
  sha256  arm:   "5c7fe3e5f61c2e41ab7a13270848b0068cc76ebbae2fc6777340b2ca2190203f",
          intel: "57e79132b466be61c2de223388bc5aa55db296f358fe2e1ca5f2f8e3f31cf6a0"

  url "https://github.com/ayoisaiah/f2/releases/download/v#{version}/f2_#{version}_darwin_#{arch}.tar.gz"
  name "f2-binary"
  desc "Command-line batch renaming tool"
  homepage "https://github.com/ayoisaiah/f2"

  livecheck do
    url :url
    strategy :github_latest
  end

  # conflicts_with formula: "f2"

  binary "f2"
  bash_completion "scripts/completions/f2.bash", target: "f2"
  fish_completion "scripts/completions/f2.fish"
  zsh_completion "scripts/completions/f2.zsh", target: "_f2"
end
