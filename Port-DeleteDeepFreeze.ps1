# PowerShell Script: Delete File and Refresh Desktop

# Path to the file
$filePath = "C:\Users\Library\Desktop\FullFWAWebInstaller_Port Public PC Test.exe"

# Delete the file if it exists
if (Test-Path $filePath) {
    Remove-Item -Path $filePath -Force
    Write-Output "File deleted: $filePath"
} else {
    Write-Output "File not found: $filePath"
}

# Refresh the desktop
# This uses Windows API via COM object to send a refresh
$shellApp = New-Object -ComObject Shell.Application
$shellApp.NameSpace(0).Self.InvokeVerb("Refresh")
