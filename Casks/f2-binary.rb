cask "f2-binary" do
  arch arm: "arm64", intel: "amd64"

  version "2.2.2"
  sha256 :no_check

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
