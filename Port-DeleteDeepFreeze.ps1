# PowerShell Script: Delete File and Refresh Desktop Properly

# Define path to the file
$filePath = "C:\Users\Library\Desktop\FullFWAWebInstaller_Port Public PC Test.exe"

# Delete the file if it exists
if (Test-Path $filePath) {
    Remove-Item -Path $filePath -Force
    Write-Output "File deleted: $filePath"
} else {
    Write-Output "File not found: $filePath"
}

# Add necessary user32 functions to send refresh command
Add-Type @"
using System;
using System.Runtime.InteropServices;

public class WinAPI {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);

    [DllImport("user32.dll", SetLastError = true)]
    public static extern IntPtr SendMessage(IntPtr hWnd, uint Msg, IntPtr wParam, IntPtr lParam);
}
"@

# Constants
$WM_COMMAND = 0x111
$REFRESH = 0x7103

# Get handle to the desktop
$desktopHandle = [WinAPI]::FindWindow("Progman", $null)

# Send refresh command to desktop
[WinAPI]::SendMessage($desktopHandle, $WM_COMMAND, [IntPtr]$REFRESH, [IntPtr]0)
