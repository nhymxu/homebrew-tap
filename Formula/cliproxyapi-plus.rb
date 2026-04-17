class CliproxyapiPlus < Formula
  desc "The Plus version of CLIProxyAPI. Wrap Gemini CLI, Codex, Claude Code, Qwen Code as an API service"
  homepage "https://github.com/router-for-me/CLIProxyAPIPlus"
  version "6.9.28-0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/router-for-me/CLIProxyAPIPlus/releases/download/v#{version}/CLIProxyAPIPlus_#{version}_darwin_arm64.tar.gz"
    sha256 "f7745a681b1130f34d9fb90344ae792324ba6d90e445a7372c157d2908e47864"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/router-for-me/CLIProxyAPIPlus/releases/download/v#{version}/CLIProxyAPIPlus_#{version}_darwin_amd64.tar.gz"
    sha256 "116da656d67fe9132f01e8e3effe60a84c4e38cc8d5f827fd193e7606897fce4"
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
