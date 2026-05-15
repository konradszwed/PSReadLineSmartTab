BeforeAll {
    $moduleRoot = Split-Path -Parent $PSScriptRoot
    Import-Module "$moduleRoot/PSReadLineSmartTab.psd1" -Force
}

Describe 'PSReadLineSmartTab module' {
    It 'exports Enable-PSReadLineSmartTab' {
        Get-Command Enable-PSReadLineSmartTab | Should -Not -BeNullOrEmpty
    }

    It 'exports Disable-PSReadLineSmartTab' {
        Get-Command Disable-PSReadLineSmartTab | Should -Not -BeNullOrEmpty
    }

    It 'has a valid module manifest' {
        $moduleRoot = Split-Path -Parent $PSScriptRoot
        Test-ModuleManifest "$moduleRoot/PSReadLineSmartTab.psd1" | Should -Not -BeNullOrEmpty
    }
}
