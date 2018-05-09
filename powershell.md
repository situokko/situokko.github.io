# Powershell "spells"

## New environment setup
1. `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned` (as admin)
1. `echo $null >> $profile`

## Load URL contents (wget/curl)
```powershell
(Invoke-webrequest -URI "https://cs.chromium.org/codesearch/f/chromium/src/net/http/transport_security_state_static.json?cl=797a3802e77
7fb42a24529261a1af57a8f899e12").Content
```

## Regex return captured group only
```powershell
Get-Content .\sts.json | Select-String -Pattern " `"([a-z0-9-.]*.fi)`"" | % { $_.Matches.Value }
```

## Invoke command dynamically with custom parameters
```powershell
function invokeWithArgs($cmd) {
    $argString = [system.String]::Join(" ", $args)
    $sb = [scriptblock]::Create("$cmd $argString")
    Invoke-Command $sb
}

invokeWithArgs "dir -s" -filter "*.txt" -name
```

## Grep IPs from IIS access-log
```powershell
    grep XXX.*Linux .\u_ex180508.log | Select-String -Pattern '10\.18\.*?\s' -AllMatches | % { $_.Matches.Value }  | Group
```
