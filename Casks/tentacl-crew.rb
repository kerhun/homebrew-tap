cask "tentacl-crew" do
  version "1.0-beta.1"
  sha256 "02c2531a72969025e9b6d93084911aa73e6cdf80d3805c55043aaf8d44fb8d39"

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
