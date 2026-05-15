# Design Notes

## Problem

PowerShell and PSReadLine expose two different user assistance mechanisms:

1. PowerShell completion.
2. PSReadLine predictive suggestions.

These are useful independently, but the default interaction can feel unnatural when PSReadLine already shows the desired inline suggestion and `Tab` does not accept it.

## Goal

Make `Tab` behave in a completion-first, suggestion-fallback way:

1. Ask PowerShell whether completion candidates exist.
2. If candidates exist, use the configured completion mode.
3. If no candidates exist, ask PSReadLine to accept the current inline suggestion.

## Current implementation

The module binds `Tab` with `Set-PSReadLineKeyHandler`.

The handler reads the current command line buffer through:

    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState(...)

It then checks completion candidates through:

    [System.Management.Automation.CommandCompletion]::CompleteInput(...)

If completion candidates exist, it calls either:

    [Microsoft.PowerShell.PSConsoleReadLine]::MenuComplete(...)

or:

    [Microsoft.PowerShell.PSConsoleReadLine]::TabCompleteNext(...)

If no completion candidates exist, it calls:

    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptSuggestion(...)

## Important limitation

PowerShell may return generic path or file completions for native commands. In such cases, the current implementation treats those as real completions.

A later version may add smarter filtering for low-value fallback completions.
