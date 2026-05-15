# Roadmap

## 0.1.x

- Validate MVP behavior on Windows PowerShell 7.x.
- Improve README examples after real-world testing.
- Add tests for exported functions and manifest validity.
- Confirm GitHub Actions workflow on Windows and Linux.

## 0.2.x

- Improve detection of useful vs. generic completion candidates.
- Investigate native command edge cases.
- Add optional SSH host completion from `~/.ssh/config`.
- Add more explicit configuration options.

## 0.3.x

- Consider publishing to PowerShell Gallery.
- Add installation instructions for PowerShell Gallery.
- Add release workflow if publishing becomes useful.

## Ideas

- Optional completer for SSH hosts.
- Optional completer for Docker Compose services.
- Optional completer for Git branches.
- Better diagnostics command, e.g. `Get-PSReadLineSmartTabStatus`.

## Non-goals

- Replacing PSReadLine.
- Building a full shell framework.
- Changing prompt rendering.
- Managing user secrets or credentials.
