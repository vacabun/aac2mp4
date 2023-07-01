$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location -Path $scriptPath

Get-ChildItem -Filter *.aac | ForEach-Object {
    $name = $_.BaseName
    $outputFile = "$name.mp4"
    & ffmpeg -loop 1 -y -i "$name.png" -i $_.FullName -shortest -r 24 -b:v 2400k -b:a 320k $outputFile
}
