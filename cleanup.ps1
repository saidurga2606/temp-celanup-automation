# Advanced Temp Cleanup Script

Write-Host "Starting Cleanup..."

# -------- Disk Usage Check --------
$drive = Get-PSDrive C
$usedPercent = [math]::round(($drive.Used / ($drive.Used + $drive.Free)) * 100)

Write-Host "Disk Usage: $usedPercent%"

if ($usedPercent -lt 70) {
    Write-Host "Disk usage is low. Skipping cleanup."
    exit
}

# -------- Logging Setup --------
$logFile = "C:\cleanup-log.txt"
"--- Cleanup started at $(Get-Date) ---" | Out-File -Append $logFile

# -------- Space Before --------
$before = (Get-PSDrive C).Used

# -------- Paths --------
$paths = @(
    "$env:TEMP",
    "C:\Windows\Temp"
)

$deleted = 0

foreach ($path in $paths) {
    Write-Host "Cleaning: $path"
    "Cleaning: $path" | Out-File -Append $logFile

    if (Test-Path $path) {
        Get-ChildItem -Path $path -Recurse -Force -ErrorAction SilentlyContinue | ForEach-Object {
            try {
                Remove-Item $_.FullName -Recurse -Force -ErrorAction Stop
                $deleted++
            } catch {
                "Skipped: $($_.FullName)" | Out-File -Append $logFile
            }
        }
    }
}

# -------- Clear Recycle Bin --------
Write-Host "Clearing Recycle Bin..."
Clear-RecycleBin -Force -ErrorAction SilentlyContinue

# -------- Space After --------
$after = (Get-PSDrive C).Used
$freed = [math]::round(($before - $after) / 1MB, 2)

Write-Host "Freed space: $freed MB"
Write-Host "Deleted files: $deleted"

"Freed space: $freed MB" | Out-File -Append $logFile
"Deleted files: $deleted" | Out-File -Append $logFile
"Cleanup completed at $(Get-Date)" | Out-File -Append $logFile