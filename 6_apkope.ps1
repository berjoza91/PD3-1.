$logFile = "$env:USERPFOILE\Documents\Apkope.log"

$disk - Get-PSDrive C
$freePercent = ($disk.Free / $disk.Used) * 100

$startfile = Get-Date

if ($freePercent -It 25) {

$before = $disk.Free

	Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue

	Clear-RecycleBin -Force -ErrorAction Silentlycontinue

$disk = Get-PSDrive C
$after = $disk.Free

$freedGB = ($after - $before) / 1GB

"[{0}] Tirisana veikta. Atbrivoti {1:N2} GB." -f $startTime, $freedGB |
	OutFile $logFile -Append
} else {
	"[{0}] vieta pietiekama." -f $startTime |
	OutFile $logFile -Append
}