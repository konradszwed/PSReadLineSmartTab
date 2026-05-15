# PSReadLineSmartTab

PSReadLineSmartTab is a small PowerShell module that changes how the Tab key behaves with PSReadLine.

Default PowerShell behavior keeps two mechanisms separate:

- Tab completion: command names, paths, parameters, argument values.
- PSReadLine predictive suggestions: grey inline suggestions from history or predictors.

This module makes Tab behave more naturally:

1. If normal PowerShell completion has candidates, Tab uses normal completion.
2. If completion has no candidates, but PSReadLine shows an inline suggestion, Tab accepts that suggestion.

## Example

You type:

    ssh home

PowerShell may not have a real completion candidate for home, but PSReadLine may show an inline suggestion such as:

    ssh homelab-docker

With this module enabled, pressing Tab accepts the inline suggestion when normal completion has no candidates.

## Manual install

Clone the repository into your PowerShell modules directory:

    git clone git@github.com:roonie11lord/PSReadLineSmartTab.git "$HOME\Documents\PowerShell\Modules\PSReadLineSmartTab"

Then add this to your PowerShell profile:

    Import-Module PSReadLineSmartTab
    Enable-PSReadLineSmartTab -CompletionMode MenuComplete

Open your PowerShell profile with:

    notepad $PROFILE

## Usage

Enable smart Tab behavior:

    Enable-PSReadLineSmartTab

Use classic cycling completion instead of menu completion:

    Enable-PSReadLineSmartTab -CompletionMode TabCompleteNext

Disable and restore normal menu completion:

    Disable-PSReadLineSmartTab

Disable and restore classic tab completion:

    Disable-PSReadLineSmartTab -RestoreTo TabCompleteNext

## Requirements

- PowerShell 7.2+
- PSReadLine

## Development

Run tests:

    Invoke-Pester -Path ./tests

## Status

Early MVP.
