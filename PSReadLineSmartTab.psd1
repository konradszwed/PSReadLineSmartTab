@{
    RootModule = 'PSReadLineSmartTab.psm1'
    ModuleVersion = '0.1.0'
    GUID = '61d5c784-52cd-4f3d-91da-d56c5c783edc'
    Author = 'Konrad Szwed'
    CompanyName = 'Konrad Szwed'
    Copyright = '(c) 2026 Konrad Szwed. All rights reserved.'
    Description = 'A small PSReadLine helper that makes Tab use normal completion first and accept inline suggestions only when completion has no candidates.'

    PowerShellVersion = '7.2'
    RequiredModules = @('PSReadLine')

    FunctionsToExport = @(
        'Enable-PSReadLineSmartTab',
        'Disable-PSReadLineSmartTab'
    )

    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()

    PrivateData = @{
        PSData = @{
            Tags = @(
                'PowerShell',
                'PSReadLine',
                'TabCompletion',
                'PredictiveIntelliSense',
                'DeveloperTools'
            )
            LicenseUri = ''
            ProjectUri = ''
            ReleaseNotes = 'Initial development version.'
        }
    }
}
