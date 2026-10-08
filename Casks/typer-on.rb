cask "typer-on" do
  version "0.4.1"
  sha256 "33c972af77cdce7d79935b28ec4afa58b02ed11e61bd956b97a188535b391fbc"

  url "https://github.com/notime2/Typer-on-macos/releases/download/v#{version}/TyperOn-#{version}.dmg"
  name "Typer On"
  desc "Menu-bar AI writing assistant for any app"
  homepage "https://github.com/notime2/Typer-on-macos"

  # Sparkle updates the app itself from 0.3.0 on.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Typer On.app"

  # Releases use the stable self-signed identity and are not notarized. Homebrew
  # has already checked the sha256 above; strip quarantine on every
  # install and upgrade so users do not have to run xattr by hand.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Typer On.app"]
  end

  zap trash: [
    "~/Library/Application Support/Typer On",
    "~/Library/Caches/com.typeron.app",
    "~/Library/HTTPStorages/com.typeron.app",
    "~/Library/HTTPStorages/com.typeron.app.binarycookies",
    "~/Library/Preferences/com.typeron.app.plist",
  ]
end
