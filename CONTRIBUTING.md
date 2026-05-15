# Contributing

Contributions are welcome, but the project scope should stay small and focused.

## Project goal

PSReadLineSmartTab should improve one specific interaction:

> `Tab` should use normal completion first and accept PSReadLine inline suggestions only as a fallback.

The module should not become a large shell framework.

## Good contribution candidates

- Better detection of useful vs. generic completion candidates.
- Native command completers where they directly improve the smart tab experience.
- Tests for PSReadLine behavior where reasonably possible.
- Documentation improvements.
- Compatibility fixes for PowerShell 7.x.

## Non-goals

- Replacing PSReadLine.
- Replacing PowerShell's completion engine.
- Large prompt/theme frameworks.
- Command-specific automation unrelated to tab completion.

## Development setup

Clone the repository:

    git clone https://github.com/konradszwed/PSReadLineSmartTab.git
    cd PSReadLineSmartTab

Import locally:

    Import-Module ./PSReadLineSmartTab.psd1 -Force

Run tests:

    Invoke-Pester -Path ./tests

Validate the manifest:

    Test-ModuleManifest ./PSReadLineSmartTab.psd1

## Pull requests

Before opening a pull request:

1. Keep the change small.
2. Add or update tests when practical.
3. Update README or docs if behavior changes.
4. Explain the user-facing behavior in the PR description.

## Style

- Keep PowerShell code readable and explicit.
- Avoid hidden global side effects except the intended PSReadLine key binding.
- Prefer clear function names over aliases.
- Keep line endings as LF.
