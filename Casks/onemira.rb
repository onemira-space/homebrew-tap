cask "onemira" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.53,bundle-v2026.11.17.1"
  sha256 arm:   "f4faa0fffbbb7543e64daa353b4ed443490635e2f3f5c6e7b2f465484315ab6b",
         intel: "ccb4d97310e96a2cbc09a40f6aaaa72c2aa1891fbc4c24a7bc8931766ed046c2"

  url "https://github.com/onemira-space/onemira-updates/releases/download/#{version.csv.second}/OneMira-macOS-#{version.csv.first}-#{arch}.dmg",
      verified: "github.com/onemira-space/onemira-updates/"
  name "OneMira"
  desc "Offline local AI meeting transcription, speaker ID, and OKF Wiki workspace"
  homepage "https://onemira.com"

  livecheck do
    url "https://updates.onemira.com/mira-context/macos/appcast.xml"
    strategy :sparkle do |item|
      tag = item.url[%r{/releases/download/([^/]+)/}, 1]
      next if item.short_version.blank? || tag.blank?

      "#{item.short_version},#{tag}"
    end
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "OneMira.app"

  zap trash: [
    "~/Library/Application Support/OneMira",
    "~/Library/Caches/com.onemira.desktop",
    "~/Library/Preferences/com.onemira.desktop.plist",
  ]
end
