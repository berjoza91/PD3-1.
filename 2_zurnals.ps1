$errors = Get-Process |
	Where-Object ($_.ProcessName -notlike
 	Sort-Object WorkingSet -Descending |
	Select-Object -First 5
}
$file = "$env:USERPROFILE\Documents\Errors.txt"

if($errors.count -gt 10) {
	"[KRITISKI] Sistēma ir nestabila!" | Out-File $file
} else {
]  [OK] Kļūdu līmenis ir normāls." | Out-file $file
}

$error |ForEach-Object {
	"S(S_.TimeCreated)- S(S_.Message)"
} | Out-File $file -Append

