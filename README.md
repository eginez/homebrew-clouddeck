# homebrew-clouddeck

Homebrew tap for [CloudDeck](https://github.com/eginez/clouddeck), a read only
desktop app for browsing your EC2 instances.

```bash
brew install --cask eginez/clouddeck/clouddeck    # macOS, Apple silicon
brew install eginez/clouddeck/clouddeck           # Linux, x86_64
```

Every release is built by CI in the main repository. The cask and formula pin
the sha256 of the published download, so Homebrew refuses a file that differs
from the one that was released.

Report problems with the app in the main repository. Report security issues as
described in its `SECURITY.md`.
