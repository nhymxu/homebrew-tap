cask "CliproxyapiPlus" do
  arch arm: "arm64", intel: "amd64"

  version "6.8.53-0"
  sha256 :no_check

  url "https://github.com/router-for-me/CLIProxyAPIPlus/releases/download/v#{version}/CLIProxyAPIPlus_#{version}_darwin_#{arch}.tar.gz",
  name "defguard-client"
  desc "The Plus version of CLIProxyAPI. Wrap Gemini CLI, Codex, Claude Code, Qwen Code as an API service"
  homepage "https://github.com/router-for-me/CLIProxyAPIPlus"
  head "https://github.com/router-for-me/CLIProxyAPIPlus.git", branch "main"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "cli-proxy-api-plus"

  cpap_shimscript = "#{staged_path}/cliproxyapi-plus.wrapper.sh"
  binary cpap_shimscript, target: "cliproxyapi-plus"

  preflight do
    File.write cpap_shimscript, <<~EOS
      #!/bin/sh
      exec '#{opt_bin}/cli-proxy-api-plus' --config '#{etc/"cliproxyapi-plus.conf"} "$@"
    EOS
  end

  postflight do
    # File.write "#{opt_bin}/cliproxyapi-plus", <<~SH
    #   #!/bin/sh

    #   exec '#{opt_bin}/cli-proxy-api-plus' --config '#{etc/"cliproxyapi-plus.conf"} "$@"
    # SH

    etc.install "config.example.yaml" => "cliproxyapi-plus.conf"
  end

  service do
    run [opt_bin/"cliproxyapi-plus"]
    keep_alive true
  end

  test do
    require "pty"
    PTY.spawn(bin/"cliproxyapi-plus", "-login", "-no-browser") do |r, _w, pid|
      sleep 5
      Process.kill "TERM", pid
      assert_match "accounts.google.com", r.read_nonblock(1024)
    end
  end
end
