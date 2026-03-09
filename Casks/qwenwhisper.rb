cask "qwenwhisper" do
  version "0.2.3"
  sha256 "7d1edcd05d57418c0c1807def519bf13aed6a7f7519b6b22631828fc43801b19"

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
