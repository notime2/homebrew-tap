cask "typer-on" do
  version "0.2.0"
  sha256 "1c0e2fe3601cc3ee49df472b1e15545fb9ec7147100fcdcd9d9457f2aa842610"

  url "https://github.com/notime2/Typer-on-macos/releases/download/v#{version}/TyperOn-#{version}.dmg"
  name "Typer On"
  desc "Menu-bar AI writing assistant for any app"
  homepage "https://github.com/notime2/Typer-on-macos"

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
