# bootstrap.ps1
# Launcher principale - scarica ed esegue il tuo tool

$ErrorActionPreference = "Stop"

# URL del file principale (lo metteremo nel passo successivo)
$toolUrl = "https://raw.githubusercontent.com/Frafri-11/MyTweakTool/main/MyTweakTool.ps1"

# Percorso temporaneo locale
$temp = Join-Path $env:TEMP "MyTweakTool.ps1"

# Scarica il tool
Write-Host "[+] Download del tool in corso..."
Invoke-WebRequest -Uri $toolUrl -OutFile $temp -UseBasicParsing

# Avvia il tool
Write-Host "[+] Avvio del tool..."
powershell.exe -NoProfile -ExecutionPolicy Bypass -File $temp
