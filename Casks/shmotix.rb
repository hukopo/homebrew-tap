cask "shmotix" do
  version "0.2.0"
  sha256 "b98b538e3c53e8bcfe10e5c6e1a591bb2744ffb008728492c1b47a92d0feac66"

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
