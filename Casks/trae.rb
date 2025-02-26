

cask "trae" do
    arch arm: "arm64", intel: "x64"
    version "1.0.7272"
    sha256 :no_check

    url "https://lf-cdn.trae.ai/obj/trae-ai-sg/pkg/app/releases/stable/#{version}/darwin/Trae-darwin-#{arch}.dmg"
    name "Trae AI IDE"
    desc "Trae is an adaptive AI IDE that transforms how you work, collaborating with you to run faster."
    homepage "https://www.trae.ai/"

    auto_updates false
    depends_on macos: ">= :catalina"

    app "Trae.app"
end
