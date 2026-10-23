cask "shmotix" do
  version "0.3.0"
  sha256 "94830636e35a8165660f6aa166bb1d7425e5fa1042cf95da3df4febe7d78d44c"

  url "https://github.com/hukopo/shmotix/releases/download/v#{version}/Shmotix-#{version}-macos-arm64.dmg"
  name "Shmotix"
  desc "Screen magnifier that translates subtitles in real time with local models"
  homepage "https://github.com/hukopo/shmotix"

  depends_on arch: :arm64

  app "Shmotix.app"

  # приложение не подписано — без этого Gatekeeper не даст открыть
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Shmotix.app"]
  end

  zap trash: [
    "~/Library/Caches/dev.shmotix.app",
    "~/Library/WebKit/dev.shmotix.app",
  ]
end
