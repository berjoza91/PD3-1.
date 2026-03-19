$updates = winget upgrade

$count = ($updates | Select-String "Available")

write-Output "Pieejami atjauninajumi: $count"