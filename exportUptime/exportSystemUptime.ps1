# Export System Uptime
$url = Read-Host "Infocyte Instance"
$token = Read-Host "Token"
Set-ICToken $url $token
$boxid = (get-icbox -Last7 -Global).id
$ErrorActionPreference = "SilentlyContinue"
((get-icapi -endpoint "boxExtensionInstances" -where @{boxId=$boxid;name="System Uptime"}).output|select -ExpandProperty output).entry| %{ConvertFrom-Json -InputObject $_  -ErrorAction Ignore} |export-csv -Path "uptime-$(Get-Date -f "MM-dd-yyyy-hh.mm.ss.tt").csv" -NoClobber -NoTypeInformation