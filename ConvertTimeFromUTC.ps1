Function Get-ConvertedTime($utcTime,$tz)
{
    $tzinfo=[System.TimeZoneInfo]::FindSystemTimeZoneById($tz)
    Write-Debug "Got Timezone ID for $tz : $tzinfo"
    $convertedTime = [System.TimeZoneInfo]::ConvertTimeFromUtc($utcTime,$tzinfo)
    Return $convertedTime
}

$utcInput=Read-Host "Enter the UTC time to convert "
$tgtTimezone = Read-Host "Enter the timezone to convert $utcInput to "
$tgtTimezoneSearchVal = $tgtTimezone+"*"
$tgtTZID=(Get-TimeZone -Name "$tgtTimezoneSearchVal").Id
Write-host "Searching for timezones matching name $tgtTimezone"
#Write-Host "Found $tgtTZID"
foreach($tzidval in $tgtTZID)
{
    Write-Host " "
    Write-Host "+=========================================================+"
    Write-Host "Converting to $tzidval"
    $convTime=Get-ConvertedTime $utcInput $tzidval
    Write-Host "Converted $utcInput to $tzidval and the result is $convTime"
    Write-Host "+=========================================================+"
    Write-Host " "
}
