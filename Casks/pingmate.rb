cask "pingmate" do
  version "1.0.2"
  sha256 "0c02a161edc774d9f8446913e0b58c4a225c563d36212d28cea8b99bad9284be"

  url "https://github.com/kikudjira/pingmate/releases/download/v#{version}/PingMate-#{version}.dmg"
  name "PingMate"
  desc "Menu bar monitor for internet connection quality"
  homepage "https://github.com/kikudjira/pingmate"

  # Liquid Glass UI — macOS 26 Tahoe or newer. The bare symbol is the minimum;
  # an upper bound would be a separate `maximum_macos` stanza.
  depends_on macos: :tahoe

  app "PingMate.app"

  # The build is ad-hoc signed, not notarized, so Gatekeeper would refuse to
  # launch it straight out of a quarantined download.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/PingMate.app"]
  end

  uninstall quit: "com.kikudjira.pingmate"

  zap trash: [
    "~/Library/Caches/com.kikudjira.pingmate",
    "~/Library/Preferences/com.kikudjira.pingmate.plist",
  ]
end
