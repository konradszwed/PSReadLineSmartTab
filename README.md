# PSReadLineSmartTab

[![PowerShell](https://github.com/konradszwed/PSReadLineSmartTab/actions/workflows/powershell.yml/badge.svg)](https://github.com/konradszwed/PSReadLineSmartTab/actions/workflows/powershell.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

PSReadLineSmartTab is a small PowerShell module that makes the `Tab` key behave more naturally with PSReadLine predictive suggestions.

By default, PowerShell keeps two mechanisms separate:

- `Tab` completion: commands, paths, parameters, and argument values.
- PSReadLine predictive suggestions: grey inline suggestions from history or predictors.

This module changes `Tab` behavior to:

1. Use normal PowerShell completion when real completion candidates exist.
2. Accept the current PSReadLine inline suggestion when normal completion has no candidates.

## Why

Sometimes PSReadLine already predicts exactly what you want, but `Tab` does not accept it because predictive suggestions are separate from tab completion.

Example:

    ssh home

PSReadLine may show an inline suggestion such as:

    ssh homelab-docker

With this module enabled, `Tab` can accept that inline suggestion when normal completion has nothing useful to offer.

## Status

Early MVP.

This project is intentionally small. The current goal is to improve one specific terminal interaction without replacing PSReadLine or PowerShell completion.

## Requirements

- PowerShell 7.2+
- PSReadLine

## Installation

### Manual install from GitHub

Clone the repository into your PowerShell modules directory:

    git clone https://github.com/konradszwed/PSReadLineSmartTab.git "$HOME\Documents\PowerShell\Modules\PSReadLineSmartTab"

Then import the module:

    Import-Module PSReadLineSmartTab

Enable the smart `Tab` behavior:

    Enable-PSReadLineSmartTab

### Add to your PowerShell profile

Open your profile:

    notepad $PROFILE

If the file does not exist yet:

    New-Item -ItemType File -Force $PROFILE
    notepad $PROFILE

Add:

    Import-Module PSReadLineSmartTab
    Enable-PSReadLineSmartTab -CompletionMode MenuComplete

Restart PowerShell.

## Usage

Enable smart `Tab` behavior with menu completion:

    Enable-PSReadLineSmartTab

Enable smart `Tab` behavior with classic cycling completion:

    Enable-PSReadLineSmartTab -CompletionMode TabCompleteNext

Disable the module and restore menu completion:

    Disable-PSReadLineSmartTab

Disable the module and restore classic tab completion:

    Disable-PSReadLineSmartTab -RestoreTo TabCompleteNext

## Behavior

| Situation | Result |
|---|---|
| PowerShell has completion candidates | `Tab` runs normal completion |
| PowerShell has no completion candidates and PSReadLine shows an inline suggestion | `Tab` accepts the inline suggestion |
| No completion and no inline suggestion | Nothing changes |

## Known limitations

This is an early implementation.

- The module does not generate suggestions. It only accepts the current PSReadLine inline suggestion.
- If PowerShell returns generic path/file completions, those may still count as completion candidates.
- Some native commands may need custom argument completers for best results.
- Behavior depends on PSReadLine predictive suggestions being enabled.

## Recommended PSReadLine setup

Predictive suggestions should be enabled:

    Set-PSReadLineOption -PredictionSource History

Optional list-style predictions:

    Set-PSReadLineOption -PredictionViewStyle ListView

## Development

Clone the repository:

    git clone https://github.com/konradszwed/PSReadLineSmartTab.git
    cd PSReadLineSmartTab

Import the local module:

    Import-Module ./PSReadLineSmartTab.psd1 -Force

Run tests:

    Invoke-Pester -Path ./tests

Validate the manifest:

    Test-ModuleManifest ./PSReadLineSmartTab.psd1

## Roadmap

See [docs/roadmap.md](docs/roadmap.md).

## Design notes

See [docs/design.md](docs/design.md).

## License

MIT. See [LICENSE](LICENSE).
