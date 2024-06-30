<#
.SYNOPSIS
Start onthespot, optionally deleting playlists or everything in the cache.

.DESCRIPTION
Workaround for BUG: https://github.com/casualsnek/onthespot/issues/120

.EXAMPLE
.\Start-OnTheSpot.ps1

.EXAMPLE
.\Start-OnTheSpot.ps1 -DeleteCache Playlists

.EXAMPLE
```
.\Start-OnTheSpot.ps1 `
    -HideConsole `
    -DeleteCache Playlists `
    -Executable "C:\Program Files\onthespot\onthespot_win_ffm.exe"`
    -Cache "C:\Users\USERNAME\.cache\casualOnTheSpot\reqcache"
```

.LINK
https://github.com/casualsnek/onthespot

.LINK
https://github.com/casualsnek/onthespot/issues/120

#>
[CmdletBinding()]
param (
    # What parts of the cache to delete before starting onthespot.
    [ValidateSet("All", "Playlists", "None")]
    [string]$DeleteCache = "None",
    # The path and filename of the onthespot executable.
    [string]$Executable = (Join-Path $env:ProgramFiles "onthespot\onthespot_win_ffm.exe"),
    # The path of the cache "reqcache" directory. Commonly "%HOMEPATH%\.cache\casualOnTheSpot\reqcache".
    [string]$Cache = (Join-Path $env:HOMEPATH ".cache\casualOnTheSpot\reqcache"),
    # Hide the log console.
    [switch]$HideConsole = $false
)

$runDir = Split-Path -Parent $Executable

switch ($DeleteCache) {
    "All" { 
        Remove-Item -Path "${Cache}\*" -Force
    }
    "Playlists" {
        (Select-String -Pattern "/playlists/" -Path "$($Cache)\*" -CaseSensitive -SimpleMatch) | Remove-Item -Force 
    }
}

$arguments = @{
    FilePath = $Executable
    WorkingDirectory = $runDir
}

if ( $HideConsole ) {
    $arguments["WindowStyle"] = "Hidden"
}

Start-Process @arguments