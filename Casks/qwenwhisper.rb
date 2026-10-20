cask "qwenwhisper" do
  version "0.5.0"
  sha256 "e6761a2967449b85666f63799a5bd57a1bf7e80f55616f139c1d5f8b0da073bc"

  url "https://github.com/hukopo/qwenwishper/releases/download/v#{version}/QwenWhisper-#{version}-macos-arm64.dmg"
  name "QwenWhisper"
  desc "Push-to-talk dictation for macOS — local Whisper transcription + Qwen 3.5 rewriting"
  homepage "https://github.com/hukopo/qwenwishper"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "QwenWhisper.app"

  zap trash: [
    "~/Library/Caches/QwenWhisper",
    "~/Library/Preferences/com.hukopo.qwenwhisper.plist",
    "~/Library/Application Support/QwenWhisper",
  ]
end
