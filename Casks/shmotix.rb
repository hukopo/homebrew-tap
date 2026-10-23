cask "shmotix" do
  version "0.1.0"
  sha256 "abeb86e32ffda30b666a562f416c6b444e47e177c1f3dbdfd6d3432439bf331a"

  url "https://github.com/hukopo/shmotix/releases/download/v#{version}/Shmotix-#{version}-macos-arm64.dmg"
  name "Shmotix"
  desc "Screen magnifier that translates subtitles in real time with local models"
  homepage "https://github.com/hukopo/shmotix"

  depends_on arch: :arm64

  app "Shmotix.app"

  zap trash: [
    "~/Library/Caches/dev.shmotix.app",
    "~/Library/WebKit/dev.shmotix.app",
  ]
end
