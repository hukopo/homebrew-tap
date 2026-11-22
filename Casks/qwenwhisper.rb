cask "qwenwhisper" do
  version "0.5.3"
  sha256 "4f2f7acb19c2762e934af052106b6855c8843f94cfe3e0e399ed394eab8e23ff"

  url "https://github.com/hukopo/qwenwishper/releases/download/v#{version}/QwenWhisper-#{version}-macos-arm64.dmg"
  name "QwenWhisper"
  desc "Local dictation and live translation for macOS. Whisper + Qwen, runs on device"
  homepage "https://github.com/hukopo/qwenwishper"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "QwenWhisper.app"

  # Unsigned build: drop quarantine so macOS doesn't report the app as "damaged" after install/upgrade.
  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/QwenWhisper.app"]
  end

  zap trash: [
    "~/Library/Caches/QwenWhisper",
    "~/Library/Preferences/com.hukopo.qwenwhisper.plist",
    "~/Library/Application Support/QwenWhisper",
  ]
end
