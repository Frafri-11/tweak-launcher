# bootstrap.ps1
# Avvia il mio tool principale da GitHub

$ErrorActionPreference = "Stop"

# URL diretto al file MyTweakTool.ps1 nel tuo repository privato
# (per ora metti un segnaposto, lo sostituiremo nel passo 3)
$toolUrl = "https://raw.githubusercontent.com/TUOUSER/My-tweaktool/main/MyTweakTool.ps1"

# Scarica il file temporaneamente
$temp = Join-Path $env:TEMP "MyTweakTool.ps1"
Invoke-WebRequest -Uri $toolUrl -OutFile $temp -UseBasicParsing

# Avvia il tool
powershell.exe -NoProfile -ExecutionPolicy Bypass -File $temp
