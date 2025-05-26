# PowerShell Script: Permanently Delete File

# Path to the file to delete
$filePath = "C:\Users\Library\Desktop\FullFWAWebInstaller_Port Public PC Test.exe"

# Check if the file exists
if (Test-Path $filePath) {
    # Delete the file permanently (no Recycle Bin)
    Remove-Item -Path $filePath -Force
    Write-Output "File deleted: $filePath"
} else {
    Write-Output "File not found: $filePath"
}
