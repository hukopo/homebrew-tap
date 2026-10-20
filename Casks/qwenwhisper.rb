cask "qwenwhisper" do
  version "0.5.0"
  sha256 "e6761a2967449b85666f63799a5bd57a1bf7e80f55616f139c1d5f8b0da073bc"

  url "https://github.com/hukopo/qwenwishper/releases/download/v#{version}/QwenWhisper-#{version}-macos-arm64.dmg"
  name "QwenWhisper"
  desc "Local dictation and live translation for macOS. Whisper + Qwen, runs on device"
  homepage "https://github.com/hukopo/qwenwishper"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "QwenWhisper.app"

  zap trash: [
    "~/Library/Caches/QwenWhisper",
    "~/Library/Preferences/com.hukopo.qwenwhisper.plist",
    "~/Library/Application Support/QwenWhisper",
  ]
end
