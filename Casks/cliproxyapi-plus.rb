cask "cliproxyapi-plus" do
  arch arm: "arm64", intel: "amd64"

  version "6.8.53-0"
  sha256 :no_check

  url "https://github.com/router-for-me/CLIProxyAPIPlus/releases/download/v#{version}/CLIProxyAPIPlus_#{version}_darwin_#{arch}.tar.gz"
  name "cliproxyapi-plus"
  desc "The Plus version of CLIProxyAPI. Wrap Gemini CLI, Codex, Claude Code, Qwen Code as an API service"
  homepage "https://github.com/router-for-me/CLIProxyAPIPlus"

  livecheck do
    url :url
    strategy :github_latest
  end

  etc_dir = "#{HOMEBREW_PREFIX}/etc"

  binary "cli-proxy-api-plus"

  cpap_shimscript = "#{staged_path}/cliproxyapi-plus.wrapper.sh"
  binary cpap_shimscript, target: "cliproxyapi-plus"

  preflight do
    File.write cpap_shimscript, <<~EOS
      #!/bin/sh
      exec '#{HOMEBREW_PREFIX}/bin/cli-proxy-api-plus' --config '#{etc_dir}/cliproxyapi-plus.yaml' "$@"
    EOS
  end

  postflight do
    system_command "cp", args: ["-n", "#{staged_path}/config.example.yaml", "#{etc_dir}/cliproxyapi-plus.yaml"]
  end

  caveats <<~EOS
    You can edit setting on #{etc_dir}/cliproxyapi-plus.yaml.
    
    Run binary:
        - cliproxyapi-plus: load config from etc_dir by default 
        - cli-proxy-api-plus: load config from the project root by default 
  EOS

  zap trash: [
    "#{etc_dir}/cliproxyapi-plus.yaml",
  ]
end
