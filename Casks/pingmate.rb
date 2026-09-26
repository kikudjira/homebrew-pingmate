cask "pingmate" do
  version "1.1.0"
  sha256 "9423faa10cc424eb9cb0c52e74ddf8d4a5b6f95ceffb91a5f13c2335fbe29738"

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
  postflight_steps do
    # Arguments take no path templates, so xattr runs inside the bundle on ".".
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "."],
        chdir:          "{{appdir}}/PingMate.app",
        writable_paths: ["{{appdir}}/PingMate.app"]
  end

  uninstall quit: "com.kikudjira.pingmate"

  zap trash: [
    "~/Library/Caches/com.kikudjira.pingmate",
    "~/Library/Preferences/com.kikudjira.pingmate.plist",
  ]
end
