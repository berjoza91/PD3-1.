$source = "$env:USERPROFILE\Document\Errors.txt"
$date = Get-Date -Format "yyyy-MM-dd"
$zipPath = "$env:USERPROFILE\Documents\Atskait_$date.zip"

Compress-Archive -Path $ource -DestinationPath $zipPath -Force

$sizeKB = (Get-item $sizePath).Lenght / 1KB

Write-Output ("Arhīva izmērs: {0:N1} KB" -f $sizeKB)