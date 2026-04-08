class CliproxyapiPlus < Formula
  desc "The Plus version of CLIProxyAPI. Wrap Gemini CLI, Codex, Claude Code, Qwen Code as an API service"
  homepage "https://github.com/router-for-me/CLIProxyAPIPlus"
  version "6.9.16-0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/router-for-me/CLIProxyAPIPlus/releases/download/v#{version}/CLIProxyAPIPlus_#{version}_darwin_arm64.tar.gz"
    sha256 "2c5ba34c8d216198fa5b0c4c641bcc2dc4eba0b09ac3dbaeab759ab6941960f0"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/router-for-me/CLIProxyAPIPlus/releases/download/v#{version}/CLIProxyAPIPlus_#{version}_darwin_amd64.tar.gz"
    sha256 "baba18529cbc85a369aa273f31f7810ce965f755f881cd286c663da27a4a7ac8"
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
