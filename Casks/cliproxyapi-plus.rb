cask "cliproxyapi-plus" do
  arch arm: "arm64", intel: "amd64"

  version "6.9.1-0"
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
  plist_label = "nhymxu.homebrew.cliproxyapi-plus"
  plist_dir = "#{etc_dir}/cliproxyapi-plus"
  plist_path = "#{plist_dir}/#{plist_label}.plist"
  config_path = "#{etc_dir}/cliproxyapi-plus.yaml"

  binary "cli-proxy-api-plus"

  cpap_shimscript = "#{staged_path}/cliproxyapi-plus.wrapper.sh"
  cpap_plist = "#{staged_path}/#{plist_label}.plist"
  binary cpap_shimscript, target: "cliproxyapi-plus"

  preflight do
    File.write cpap_shimscript, <<~EOS
      #!/bin/sh
      LABEL="#{plist_label}"
      PLIST_SRC="#{plist_path}"
      PLIST_DST="${HOME}/Library/LaunchAgents/${LABEL}.plist"

      case "$1" in
        install)
          mkdir -p "${HOME}/Library/LaunchAgents"
          ln -sfv "${PLIST_SRC}" "${PLIST_DST}"
          launchctl bootstrap "gui/$(id -u)" "${PLIST_DST}"
          echo "cliproxyapi-plus LaunchAgent installed and loaded."
          ;;
        uninstall)
          launchctl bootout "gui/$(id -u)/${LABEL}" 2>/dev/null
          rm -f "${PLIST_DST}"
          echo "cliproxyapi-plus LaunchAgent unloaded and removed."
          ;;
        *)
          exec '#{HOMEBREW_PREFIX}/bin/cli-proxy-api-plus' --config '#{config_path}' "$@"
          ;;
      esac
    EOS

    File.write cpap_plist, <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
          <key>Label</key>
          <string>#{plist_label}</string>
          <key>ProgramArguments</key>
          <array>
              <string>#{HOMEBREW_PREFIX}/bin/cli-proxy-api-plus</string>
              <string>--config</string>
              <string>#{config_path}</string>
          </array>
          <key>RunAtLoad</key>
          <true/>
          <key>KeepAlive</key>
          <true/>
          <key>StandardErrorPath</key>
          <string>#{Dir.home}/Library/Logs/cliproxyapi-plus.err</string>
          <key>StandardOutPath</key>
          <string>#{Dir.home}/Library/Logs/cliproxyapi-plus.out</string>
      </dict>
      </plist>
    EOS
  end

  postflight do
    if File.exist?(config_path)
        puts "Config file exists."
    else
        puts "Config file not exists. Create default file..."
        FileUtils.cp "#{staged_path}/config.example.yaml", "#{config_path}"
    end
 
    FileUtils.mkdir_p plist_dir
    FileUtils.cp cpap_plist, plist_path
  end

  caveats <<~EOS
    You can edit setting on #{etc_dir}/cliproxyapi-plus.yaml.

    Run binary:
        - cliproxyapi-plus: load config from etc_dir by default
        - cli-proxy-api-plus: load config from the project root by default

    To register cliproxyapi-plus as a LaunchAgent (auto-start on login):
        cliproxyapi-plus install

    To unregister the LaunchAgent:
        cliproxyapi-plus uninstall
  EOS

  zap trash: [
    "#{etc_dir}/cliproxyapi-plus.yaml",
    plist_dir,
    "~/Library/LaunchAgents/#{plist_label}.plist",
    "~/Library/Logs/cliproxyapi-plus.err",
    "~/Library/Logs/cliproxyapi-plus.out",
  ]
end
