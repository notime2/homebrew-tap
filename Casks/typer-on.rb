cask "typer-on" do
  version "0.3.0"
  sha256 "62c72ad1f8fc80b9546eb4687bc22147d9e4276f509c883fc2120c45f3615fe0"

  url "https://github.com/notime2/Typer-on-macos/releases/download/v#{version}/TyperOn-#{version}.dmg"
  name "Typer On"
  desc "Menu-bar AI writing assistant for any app"
  homepage "https://github.com/notime2/Typer-on-macos"

  # Sparkle updates the app itself from 0.3.0 on.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Typer On.app"

  # The release is ad-hoc signed and not notarized, so Gatekeeper would block the first
  # launch. Homebrew has already checked the sha256 above; strip quarantine on every
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
