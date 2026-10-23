cask "shmotix" do
  version "0.1.0"
  sha256 "8a040e116d227aff87c5aae70b3751cf44d22b69b7db905a660b2968364a6835"

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
