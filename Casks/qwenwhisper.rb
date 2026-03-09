cask "qwenwhisper" do
  version "0.2.4"
  sha256 "29f8948e890ea5f3439aba7f85315a2a92f393700ad1ae67feba4d54b8fbc41a"

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
