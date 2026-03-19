

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "Checking for available updates using winget..." -ForegroundColor Cyan


$wingetOutput = (winget list --upgrade-available | Out-String).Split([Environment]::NewLine)


$headerIndex = 0
while ($headerIndex -lt $wingetOutput.Length -and -not ($wingetOutput[$headerIndex].Trim().StartsWith("Name"))) {
    $headerIndex++
}


$packageLines = $wingetOutput | Select-Object -Skip ($headerIndex + 2)


$updateList = $packageLines | Where-Object { -not ([string]::IsNullOrWhiteSpace($_)) -and $_ -notmatch 'upgrades available' }


if ($updateList.Length -eq 0) {
    Write-Host "`nThere are [0] programs on the system that need to be updated." -ForegroundColor Green
} else {
    Write-Host "`nSoftware with updates available:" -ForegroundColor Yellow
    foreach ($line in $updateList) {
        Write-Host $line
    }
    
    
    $updateCount = $updateList.Length

    
    Write-Host "`nThere are [$updateCount] programs on the system that need to be updated." -ForegroundColor Green
}

