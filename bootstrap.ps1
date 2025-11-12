# bootstrap.ps1 - Launcher definitivo
$ErrorActionPreference = "Stop"

# URL del tool principale (GIÀ CORRETTO)
$toolUrl = "https://raw.githubusercontent.com/Frafri-11/MyTweakTool/main/MyTweakTool.ps1"

# Percorso temporaneo
$temp = Join-Path $env:TEMP "MyTweakTool.ps1"

Write-Host "[+] Scarico il tool da:"
Write-Host "    $toolUrl"
Write-Host ""

try {
    Invoke-WebRequest -Uri $toolUrl -OutFile $temp -UseBasicParsing
}
catch {
    Write-Host "[ERRORE] Download fallito:"
    Write-Host "         $($_.Exception.Message)"
    exit 1
}

if (-not (Test-Path $temp) -or (Get-Item $temp).Length -eq 0) {
    Write-Host "[ERRORE] File scaricato vuoto o mancante."
    exit 1
}

Write-Host "[+] Download completato. Avvio del tool..."
powershell.exe -NoProfile -ExecutionPolicy Bypass -File $temp
