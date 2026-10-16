class Sgrep < Formula
  desc "Search code and text in plain English using ripgrep and local static embeddings"
  homepage "https://github.com/context-dot-dev/sgrep"
  version "0.3.0"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "ripgrep"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/context-dot-dev/sgrep/releases/download/v#{version}/sgrep-macos-arm64.tar.gz"
    sha256 "e387fca129c56824dd2292b4d6375fbddf1e73caac066ec5ef4f083ef27b2d8c"
  end

  def install
    bin.install "sgrep"
  end

  def caveats
    <<~EOS
      Upstream only publishes a macOS Apple Silicon binary. On Intel or Linux,
      install sgrep from source instead:
        cargo install --git https://github.com/context-dot-dev/sgrep --locked

      The first search downloads a model (32-34 MB) and any required code parsers.
      Later searches can run offline. Source and queries stay on your machine.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sgrep --version")
  end
end
