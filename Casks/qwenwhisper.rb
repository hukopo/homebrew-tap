cask "qwenwhisper" do
  version "0.6.1"
  sha256 "be18e727aa0b2e4fcca99aed8d60c8e382bff497c26aa644146dddb188119222"

  url "https://github.com/hukopo/qwenwishper/releases/download/v#{version}/QwenWhisper-#{version}-macos-arm64.dmg"
  name "QwenWhisper"
  desc "Local dictation and live translation for macOS. Whisper + Qwen, runs on device"
  homepage "https://github.com/hukopo/qwenwishper"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "QwenWhisper.app"

  # Unsigned build: drop quarantine before the app is moved to /Applications,
  # otherwise macOS reports it as "damaged" after install/upgrade.
  preflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "QwenWhisper.app"], chdir: ".", writable_paths: ["QwenWhisper.app"]
  end

  zap trash: [
    "~/Library/Caches/QwenWhisper",
    "~/Library/Preferences/com.hukopo.qwenwhisper.plist",
    "~/Library/Application Support/QwenWhisper",
  ]
end
