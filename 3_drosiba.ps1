
$defender = Get-MpComputerStatus

$isRealTimeOff = $defender.RealTimeProtectionEnabled -eq $false
$isScanOld = $defender.QuickScanAge -gt 3


if ($isRealTimeOff -or $isScanOld) {
    Write-Host "System is at risk!" -ForegroundColor Red
} else {
    Write-Host "System is safe." -ForegroundColor Green
}
