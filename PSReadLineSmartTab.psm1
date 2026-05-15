Set-StrictMode -Version Latest

$script:PSReadLineSmartTabCompletionMode = 'MenuComplete'

function Enable-PSReadLineSmartTab {
    [CmdletBinding()]
    param(
        [ValidateSet('MenuComplete', 'TabCompleteNext')]
        [string] $CompletionMode = 'MenuComplete'
    )

    $script:PSReadLineSmartTabCompletionMode = $CompletionMode

    Set-PSReadLineKeyHandler -Chord Tab -ScriptBlock {
        param($key, $arg)

        $line = $null
        $cursor = $null

        [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState(
            [ref] $line,
            [ref] $cursor
        )

        $completion = [System.Management.Automation.CommandCompletion]::CompleteInput(
            $line,
            $cursor,
            $null
        )

        $hasCompletion =
            $null -ne $completion -and
            $null -ne $completion.CompletionMatches -and
            $completion.CompletionMatches.Count -gt 0

        if ($hasCompletion) {
            if ($script:PSReadLineSmartTabCompletionMode -eq 'TabCompleteNext') {
                [Microsoft.PowerShell.PSConsoleReadLine]::TabCompleteNext($key, $arg)
            }
            else {
                [Microsoft.PowerShell.PSConsoleReadLine]::MenuComplete($key, $arg)
            }

            return
        }

        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptSuggestion($key, $arg)
    }
}

function Disable-PSReadLineSmartTab {
    [CmdletBinding()]
    param(
        [ValidateSet('MenuComplete', 'TabCompleteNext')]
        [string] $RestoreTo = 'MenuComplete'
    )

    Set-PSReadLineKeyHandler -Chord Tab -Function $RestoreTo
}

Export-ModuleMember -Function Enable-PSReadLineSmartTab, Disable-PSReadLineSmartTab
