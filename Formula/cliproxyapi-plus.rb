class CliproxyapiPlus < Formula
  desc "The Plus version of CLIProxyAPI. Wrap Gemini CLI, Codex, Claude Code, Qwen Code as an API service"
  homepage "https://github.com/router-for-me/CLIProxyAPIPlus"
  version "6.9.27-0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/router-for-me/CLIProxyAPIPlus/releases/download/v#{version}/CLIProxyAPIPlus_#{version}_darwin_arm64.tar.gz"
    sha256 "3428d2a29170b446436c86efa22e3954748dbc161cb9973f0d46967b9f6a172c"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/router-for-me/CLIProxyAPIPlus/releases/download/v#{version}/CLIProxyAPIPlus_#{version}_darwin_amd64.tar.gz"
    sha256 "adf6455f02b4928efc7cb8fb549bb245c786884db1cddd278d6a5c51c4c36da8"
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
