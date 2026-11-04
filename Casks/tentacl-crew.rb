cask "tentacl-crew" do
  version "1.0-beta.1"
  sha256 "7dd7b0569c678d638f5f538d7ff63e47a73ea49ddcf8234304651b67cec16db9"

  url "https://github.com/kerhun/tentacl-crew/releases/download/v#{version}/TentaclCrew-#{version}.zip"
  name "Tentacl Crew"
  desc "Local panel that runs a team of coding agents"
  homepage "https://github.com/kerhun/tentacl-crew"

  livecheck do
    url :url
    strategy :github_latest
    regex(/v?(\d+(?:\.\d+)+(?:-beta\.\d+)?)/i)
  end

  depends_on macos: :sonoma

  app "Tentacl.app"

  zap trash: [
    "~/.config/tentacl",
    "~/Library/Application Support/Tentacl",
    "~/Library/Caches/com.kerhun.Tentacl",
    "~/Library/Preferences/com.kerhun.Tentacl.plist",
    "~/Library/Saved Application State/com.kerhun.Tentacl.savedState",
  ]

  caveats <<~EOS
    Tentacl Crew is ad hoc signed, not notarized. Open it once, then allow it in
    System Settings → Privacy & Security → "Open Anyway".
  EOS
end
