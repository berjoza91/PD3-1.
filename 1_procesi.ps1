
$topProcesses = Get-Process |
    Where-Object { $_.Name -ne "svchost" } |
    Sort-Object -Property WS -Descending |
    Select-Object -First 5


$totalRamBytes = ($topProcesses | Measure-Object -Property WS -Sum).Sum


$totalRamMB = [math]::Round($totalRamBytes / 1MB, 1)


Write-Host "Top 5 processes total RAM: $($totalRamMB) MB"


Write-Host "`nDetails of top 5 processes (excluding svchost):"
$topProcesses | Select-Object Name, Id, @{Name="WorkingSet(MB)";Expression={[math]::Round($_.WS / 1MB, 1)}} | Format-Table -AutoSize
