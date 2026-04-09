class CliproxyapiPlus < Formula
  desc "The Plus version of CLIProxyAPI. Wrap Gemini CLI, Codex, Claude Code, Qwen Code as an API service"
  homepage "https://github.com/router-for-me/CLIProxyAPIPlus"
  version "6.9.18-0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/router-for-me/CLIProxyAPIPlus/releases/download/v#{version}/CLIProxyAPIPlus_#{version}_darwin_arm64.tar.gz"
    sha256 "8e722383d5d1a521d682b94150bd81da8014e19e81e61b8048c3b1fe4ea555f7"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/router-for-me/CLIProxyAPIPlus/releases/download/v#{version}/CLIProxyAPIPlus_#{version}_darwin_amd64.tar.gz"
    sha256 "fcc0064af24ceb30ad027e8962ef3befe198814b1cdd34227aa7b679a8093ad5"
  end

  def install
    bin.install "cli-proxy-api-plus"
    etc.install "config.example.yaml" => "cliproxyapi-plus.yaml"
    (bin/"cliproxyapi-plus").write <<~SHELL
      #!/bin/sh
      exec '#{bin}/cli-proxy-api-plus' --config '#{etc}/cliproxyapi-plus.yaml' "$@"
    SHELL
  end

  service do
    run [opt_bin/"cliproxyapi-plus"]
    keep_alive true
  end

  def caveats
    <<~EOS
      You can edit settings at #{etc}/cliproxyapi-plus.yaml.
      
      Or, if you don't want/need a background service you can just run:
        /opt/homebrew/bin/cliproxyapi-plus
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cli-proxy-api-plus --version 2>&1")
  end
end
