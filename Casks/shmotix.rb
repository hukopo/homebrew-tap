cask "shmotix" do
  version "0.3.1"
  sha256 "630da81900230d6168df9783916e781da66dfea40e3aa5de827b83b8c10c02d2"

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
