$myFolder = "C:\Deek-PS"

foreach($file in Get-ChildItem $myFolder)
{
    Write-Output $file
}