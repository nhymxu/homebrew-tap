class CliproxyapiPlus < Formula
  desc "The Plus version of CLIProxyAPI. Wrap Gemini CLI, Codex, Claude Code, Qwen Code as an API service"
  homepage "https://github.com/router-for-me/CLIProxyAPIPlus"
  version "6.9.5-0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/router-for-me/CLIProxyAPIPlus/releases/download/v#{version}/CLIProxyAPIPlus_#{version}_darwin_arm64.tar.gz"
      sha256 :no_check
    end

    on_intel do
      url "https://github.com/router-for-me/CLIProxyAPIPlus/releases/download/v#{version}/CLIProxyAPIPlus_#{version}_darwin_amd64.tar.gz"
      sha256 :no_check
    end
  end

  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    bin.install "cli-proxy-api-plus"
    (etc/"cliproxyapi-plus.yaml").write (buildpath/"config.example.yaml").read unless (etc/"cliproxyapi-plus.yaml").exist?
  end

  service do
    run [opt_bin/"cli-proxy-api-plus", "--config", etc/"cliproxyapi-plus.yaml"]
    keep_alive true
    log_path var/"log/cliproxyapi-plus.log"
    error_log_path var/"log/cliproxyapi-plus-error.log"
  end

  def caveats
    <<~EOS
      You can edit settings at #{etc}/cliproxyapi-plus.yaml.

      To start cliproxyapi-plus now and restart at login:
        brew services start nhymxu/tap/cliproxyapi-plus

      To stop the service:
        brew services stop nhymxu/tap/cliproxyapi-plus
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cli-proxy-api-plus --version 2>&1")
  end
end
