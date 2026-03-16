
Import-Module Microsoft.WinGet.Client

try {
    
    $updatablePackages = Get-WinGetPackage | Where-Object { $_.IsUpdateAvailable }

    
    $updateCount = $updatablePackages.Count

    
    Write-Host "Total number of programs with updates available: $updateCount"

    
    if ($updateCount -gt 0) {
        Write-Host "`nPrograms with available updates:"
        $updatablePackages | Select-Object Name, Version, AvailableVersion, Source | Format-Table
    }

} catch {
    Write-Error "An error occurred while checking for updates. Ensure winget is installed and functional."
    Write-Error $_.Exception.Message
}
