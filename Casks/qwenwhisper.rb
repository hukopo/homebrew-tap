cask "qwenwhisper" do
  version "0.6.0"
  sha256 "36744971445f56c70d89e0872cd338e685be2a7c6ed25ef9d2a5a6cf63c33859"

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
