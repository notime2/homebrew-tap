# notime2/tap

Homebrew casks for [Typer On](https://github.com/notime2/Typer-on-macos), an
open-source macOS menu-bar AI writing assistant.

```bash
brew install --cask notime2/tap/typer-on
```

Requires macOS Tahoe 26 or later on Apple Silicon.

The app is ad-hoc signed and not notarized. The cask verifies the DMG checksum
and then removes the quarantine attribute from `/Applications/Typer On.app`, so
Gatekeeper does not block the first launch. If you prefer to keep quarantine,
install the DMG from
[Releases](https://github.com/notime2/Typer-on-macos/releases) instead.

`brew uninstall --zap --cask typer-on` also removes settings, caches and chat
history. The API key stays in the Keychain under `com.typeron.app`.
